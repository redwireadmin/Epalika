const Act = require("../models/act.model");
const asyncHandler = require("../utils/asyncHandler");
const ApiError = require("../utils/ApiError");
const ApiResponse = require("../utils/ApiResponse");
const mongoose = require("mongoose");
const fs = require("fs");
const path = require("path");

const registerAct = asyncHandler(async (req, res) => {
  const { title, actbody } = req.body;
  if ([title, actbody].some((field) => field?.trim() === "")) {
    throw ApiError(400, "title and noticebody is required.");
  }

  const existedAct = await Act.findOne({
    title,
  });

  if (existedAct) {
    throw new ApiError(409, "act with such title exists.");
  }

  const fileLocalPath = req.files?.file[0]?.path;
  if (!fileLocalPath) {
    throw new ApiError(400, "file is required.");
  }

  const createdAct = await Act.create({
    file: fileLocalPath,
    title,
    actbody,
  });

  if (!createdAct) {
    throw new ApiError(500, "something went wrong while registering the act.");
  }

  return res
    .status(200)
    .json(new ApiResponse(200, createdAct, "notice created successfully."));
});

const getAllAct = asyncHandler(async (req, res) => {
  const { sort } = req.query;
  const queryObject = {};
  let result = Act.find(queryObject);
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

  const act = await result;
  return res
    .status(200)
    .json(new ApiResponse(200, act, "All notices retrieved."));
});

const getAct = asyncHandler(async (req, res) => {
  const { id: actID } = req.params;
  if (!mongoose.Types.ObjectId.isValid(actID)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }
  const act = await Act.findOne({ _id: actID });
  return res
    .status(200)
    .json(new ApiResponse(200, act, "Notice is retrieved."));
});

const updateAct = asyncHandler(async (req, res) => {
  const { id: updateID } = req.params;

  if (!mongoose.Types.ObjectId.isValid(updateID)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }

  if (!req.body || Object.keys(req.body).length === 0) {
    throw new ApiError(400, "At least one field is required for update.");
  }

  const updatedAct = await Act.findByIdAndUpdate(updateID, req.body, {
    new: true,
    runValidators: true,
  });

  if (!updatedAct) {
    throw new ApiError(404, "No act with such ID");
  }

  const filename = path.basename(updatedAct.file);
  const filePath = path.join("public", "temp", filename);

  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
    console.log(`File ${filename} deleted successfully.`);
  } else {
    console.log(`File ${filename} does not exist.`);
  }

  const newFileLocalPath = req.files?.file[0]?.path;

  if (!newFileLocalPath) {
    throw new ApiError(400, "New image is required.");
  }

  updatedAct.file = newFileLocalPath;
  await updatedAct.save();

  return res
    .status(200)
    .json(new ApiResponse(200, updatedAct, "Notice updated successfully."));
});

const deleteAct = asyncHandler(async (req, res) => {
  const { id: deleteId } = req.params;
  if (!mongoose.Types.ObjectId.isValid(deleteId)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }
  const deletedAct = await Act.findOneAndDelete({ _id: deleteId });
  if (!deletedAct) {
    throw new ApiError(404, "id not found to delete.");
  }
  const filename = path.basename(deletedAct.file);
  const filePath = path.join("public", "temp", filename);

  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
    console.log(`File ${filename} deleted successfully.`);
  } else {
    console.log(`File ${filename} does not exist.`);
  }
  return res
    .status(200)
    .json(new ApiResponse(200, deletedAct, "act deleted successfully."));
});

const downloadAct = asyncHandler(async (req, res) => {
  const actId = req.params.id;
  const act = await Act.findById(actId);
  var filePath = act.file;
  res.download(filePath);
});

module.exports = {
  registerAct,
  updateAct,
  getAllAct,
  getAct,
  deleteAct,
  downloadAct,
};
