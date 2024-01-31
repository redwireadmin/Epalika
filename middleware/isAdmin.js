const asyncHandler = require("../utils/asyncHandler");
const ApiError = require("../utils/ApiError");
const User = require("../models/userModel");

const isAdmin = asyncHandler(async (req, res, next) => {
  const user = await User.findById(req.user?._id);
  const userRole = user.role;

  if (userRole !== "admin") {
    throw new ApiError(
      403,
      "Only admin users are allowed to perform this operation."
    );
  }
  next();
});
module.exports = isAdmin;
