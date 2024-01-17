const express = require("express");
const { signup, verifyOtp } = require("../controllers/userController");

const router = express.Router();

router.post("/signup", signup);
router.post("/verify", verifyOtp);

module.exports = router;
