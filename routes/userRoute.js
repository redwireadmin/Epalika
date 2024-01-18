const express = require("express");
const {
  signup,
  verifyOtp,
  login,
  forgotPassword,
  resetPassword,
} = require("../controllers/userController");

const router = express.Router();

router.post("/signup", signup);
router.post("/verify", verifyOtp);
router.post("/login", login);
router.post("/forgotpassword", forgotPassword);
router.get("/resetpassword", resetPassword);

module.exports = router;
