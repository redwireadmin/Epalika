const Notice = require("../models/notice.model");
const asyncHandler = require("../utils/asyncHandler");
const ApiError = require("../utils/ApiError");
const ApiResponse = require("../utils/ApiResponse");
const mongoose = require("mongoose");

//this is for commit message

const registerNotice = asyncHandler(async (req, res) => {
  const { title, noticebody } = req.body;
  if ([title, noticebody].some((field) => field?.trim() === "")) {
    throw ApiError(400, "title and noticebody is required.");
  }

  const existedNotice = await Notice.findOne({
    title,
  });

  if (existedNotice) {
    throw new ApiError(409, "notice with such title exists.");
  }

  const createdNotice = await Notice.create({
    title,
    noticebody,
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

const updateNotice = asyncHandler(async (req, res) => {
  const { id: updateID } = req.params;

  if (!mongoose.Types.ObjectId.isValid(updateID)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }

  if (!req.body || Object.keys(req.body).length === 0) {
    throw new ApiError(400, "at least one field is required for update.");
  }
  const updatedNotice = await Notice.findOneAndUpdate(
    { _id: updateID },
    req.body,
    {
      new: true,
      runValidators: true,
    }
  );

  if (!updatedNotice) {
    throw new ApiError(404, "No notice with such ID");
  }
  return res
    .status(200)
    .json(new ApiResponse(200, updatedNotice, "Notice updated successfully."));
});

const getAllNotice = asyncHandler(async (req, res) => {
  const notice = await Notice.find({});
  return res
    .status(200)
    .json(new ApiResponse(200, notice, "All notices retrieved."));
});

const getNotice = asyncHandler(async (req, res) => {
  const { id: noticeID } = req.params;
  if (!mongoose.Types.ObjectId.isValid(noticeID)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }
  const notice = await Notice.findOne({ _id: noticeID });
  return res
    .status(200)
    .json(new ApiResponse(200, notice, "Notice is retrieved."));
});

const deleteNotice = asyncHandler(async (req, res) => {
  const { id: deleteId } = req.params;
  if (!mongoose.Types.ObjectId.isValid(deleteId)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }
  const deletedNotice = await Notice.findOneAndDelete({ _id: deleteId });
  if (!deletedNotice) {
    throw new ApiError(404, "id not found to delete.");
  }
  return res
    .status(200)
    .json(new ApiResponse(200, deletedNotice, "notice deleted successfully."));
});

module.exports = {
  registerNotice,
  updateNotice,
  getAllNotice,
  getNotice,
  deleteNotice,
};
