const jwt = require("jsonwebtoken");
const asyncHandler = require("../utils/asyncHandler");
const User = require("../models/userModel");
const ApiError = require("../utils/ApiError");

const auth = asyncHandler(async (req, res, next) => {
  try {
    const authorizationHeader = req.headers.authorization;
    if (!authorizationHeader) {
      throw new ApiError(401, "unauthorized request.");
    }
    const token = authorizationHeader.split("Bearer ")[1];

    const checkToken = jwt.verify(token, process.env.jwt_salt);

    const user = await User.findById(checkToken?._id).select(
      "-password -refreshToken"
    );

    if (!user) {
      throw new ApiError(401, "Invalid access token");
    }

    req.user = user;
    next();
  } catch (error) {
    throw new ApiError(401, error?.message || "Invalid access token");
  }
});
module.exports = auth;
