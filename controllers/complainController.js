const Complain = require("../models/complain.model");
const asyncHandler = require("../utils/asyncHandler");
const ApiError = require("../utils/ApiError");
const ApiResponse = require("../utils/ApiResponse");
const mongoose = require("mongoose");

const registerComplain = asyncHandler(async (req, res) => {
  const { subject, cbody } = req.body;
  if (!subject && !cbody) {
    throw "subject and explaination is required.";
  }

  const createdComplaint = await Complain.create({
    subject,
    cbody,
  });

  if (!createdComplaint) {
    throw new ApiError(
      500,
      "something went wrong while registering the complaint."
    );
  }

  return res
    .status(200)
    .json(
      new ApiResponse(200, createdComplaint, "your complaint is registered.")
    );
});

const getAllComplaints = asyncHandler(async (req, res) => {
  const complaint = await Complain.find({});
  return res
    .status(200)
    .json(new ApiResponse(200, complaint, "All notices retrieved."));
});

const getComplaint = asyncHandler(async (req, res) => {
  const { id: noticeID } = req.params;
  if (!mongoose.Types.ObjectId.isValid(noticeID)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }
  const complaint = await Complain.findOne({ _id: noticeID });
  return res
    .status(200)
    .json(new ApiResponse(200, complaint, "Complaint is retrieved."));
});

const deleteComplaint = asyncHandler(async (req, res) => {
  const { id: deleteId } = req.params;
  if (!mongoose.Types.ObjectId.isValid(deleteId)) {
    throw new ApiError(400, "Please provide a valid objectId.");
  }
  const deleteComplaint = await Complain.findOneAndDelete({ _id: deleteId });
  if (!deleteComplaint) {
    throw new ApiError(404, "id not found to delete.");
  }
  return res
    .status(200)
    .json(
      new ApiResponse(200, deleteComplaint, "complaint deleted successfully.")
    );
});

module.exports = {
  registerComplain,
  getAllComplaints,
  getComplaint,
  deleteComplaint,
};
