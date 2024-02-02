const Notice = require("../models/news.model");
const asyncHandler = require("../utils/asyncHandler");
const ApiError = require("../utils/ApiError");
const ApiResponse = require("../utils/ApiResponse");
const uploadOnCloudinary = require("../utils/cloudinary");

const registerNews = asyncHandler(async (req, res) => {
  const { title, newsBody } = req.body;
  if ([title, newsBody].some((field) => field?.trim() === "")) {
    throw ApiError(400, "title and newsbody is required.");
  }

  const existedNotice = await Notice.findOne({
    title,
  });

  if (existedNotice) {
    throw new ApiError(409, "notice with such title exists.");
  }

  const imageLocalPath = req.files?.image[0]?.path;
  if (!imageLocalPath) {
    throw new ApiError(400, "news image is required.");
  }
  const image = await uploadOnCloudinary(imageLocalPath);

  if (!image) {
    throw new ApiError(400, "news image is required.");
  }

  const createdNotice = await Notice.create({
    image: image.url,
    title,
    newsBody,
  });

  if (!createdNotice) {
    throw new ApiError(
      500,
      "something went wrong while registering the notice"
    );
  }

  return res
    .status(200)
    .json(new ApiResponse(200, createdNotice, "notice created successfully."));
});

module.exports = {
  registerNews,
};
