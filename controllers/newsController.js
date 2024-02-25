const News = require("../models/news.model");
const asyncHandler = require("../utils/asyncHandler");
const ApiError = require("../utils/ApiError");
const ApiResponse = require("../utils/ApiResponse");
const mongoose = require("mongoose");
const fs = require("fs");
const path = require("path");

const registerNews = asyncHandler(async (req, res) => {
  const { title, newsBody } = req.body;
  if ([title, newsBody].some((field) => field?.trim() === "")) {
    throw ApiError(400, "title and newsbody is required.");
  }

  const existedNews = await News.findOne({
    title,
  });

  if (existedNews) {
    throw new ApiError(409, "notice with such title exists.");
  }

  const imageLocalPath = req.files?.image[0]?.path;
  if (!imageLocalPath) {
    throw new ApiError(400, "news image is required.");
  }
  // const image = await uploadOnCloudinary(imageLocalPath);

  // if (!image) {
  //   throw new ApiError(400, "news image is required.");
  // }

  const createdNews = await News.create({
    image: imageLocalPath,
    title,
    newsBody,
  });

  if (!createdNews) {
    throw new ApiError(500, "something went wrong while registering the news.");
  }

  return res
    .status(200)
    .json(new ApiResponse(200, createdNews, "news created successfully."));
});

const getAllNews = asyncHandler(async (req, res) => {
  const { sort } = req.query;
  const queryObject = {};
  let result = News.find(queryObject);
  if (sort) {
    if (sort === "createdAt") {
      result = result.sort({ createdAt: -1 });
    }
  } else {
    result = result.sort({ createdAt: 1 });
  }

  const page = Number(req.query.page) || 1;
  const limit = Number(req.query.limit) || 5;
  const skip = (page - 1) * limit;
  result = result.skip(skip).limit(limit);

  const news = await result;
  return res
    .status(200)
    .json(new ApiResponse(200, news, "All news retrieved."));
});

const getNews = asyncHandler(async (req, res) => {
  const { id: newsID } = req.params;
  if (!mongoose.Types.ObjectId.isValid(newsID)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }
  const notice = await News.findOne({ _id: newsID });
  return res
    .status(200)
    .json(new ApiResponse(200, notice, "News is retrieved."));
});

const updateNews = asyncHandler(async (req, res) => {
  const { id: updateID } = req.params;

  if (!mongoose.Types.ObjectId.isValid(updateID)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }

  if (!req.body || Object.keys(req.body).length === 0) {
    throw new ApiError(400, "at least one field is required for update.");
  }
  const updatedNews = await News.findByIdAndUpdate(updateID, req.body, {
    new: true,
    runValidators: true,
  });

  if (!updatedNews) {
    throw new ApiError(404, "No news with such ID");
  }

  const filename = path.basename(updatedNews.image);
  const filePath = path.join("public", "temp", filename);

  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
    console.log(`File ${filename} deleted successfully.`);
  } else {
    console.log(`File ${filename} does not exist.`);
  }

  const newFileLocalPath = req.files?.image[0]?.path;

  if (!newFileLocalPath) {
    throw new ApiError(400, "New image is required.");
  }

  updatedNews.image = newFileLocalPath;
  await updatedNews.save();

  return res
    .status(200)
    .json(new ApiResponse(200, updatedNews, "Notice updated successfully."));
});

const deleteNews = asyncHandler(async (req, res) => {
  const { id: deleteId } = req.params;
  if (!mongoose.Types.ObjectId.isValid(deleteId)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }
  const deletedNews = await News.findOneAndDelete({ _id: deleteId });
  if (!deletedNews) {
    throw new ApiError(404, "id not found to delete.");
  }
  const filename = path.basename(deletedNews.image);
  const filePath = path.join("public", "temp", filename);

  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
    console.log(`File ${filename} deleted successfully.`);
  } else {
    console.log(`File ${filename} does not exist.`);
  }
  return res
    .status(200)
    .json(new ApiResponse(200, deletedNews, "notice deleted successfully."));
});

module.exports = {
  registerNews,
  getAllNews,
  getNews,
  updateNews,
  deleteNews,
};
