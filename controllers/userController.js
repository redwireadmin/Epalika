const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const Otp = require("../models/otpModel");
const User = require("../models/userModel");

const sendOtpToEmail = async (email, otpValue) => {
  try {
    const transporter = nodemailer.createTransport({
      host: "smtp.gmail.com",
      port: 587,
      secure: false,
      auth: {
        user: process.env.SMTP_MAIL,
        pass: process.env.SMTP_PASSWORD,
      },
    });

    const mailOptions = {
      from: process.env.SMTP_MAIL,
      to: email,
      subject: "Verification OTP",
      text: `Your OTP is: ${otpValue}`,
    };
    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log("Mail has been sent:", info.response);
      }
    });
  } catch (error) {
    res.status(400).json({
      success: "false",
      message: error.message,
    });
  }
};

const signup = async (req, res) => {
  const users = mongoose.model("users");
  const { name, phoneNumber, email, birthday, password } = req.body;
  const encPass = await bcrypt.hash(password, 10);
  const otpValue = Math.floor(100000 + Math.random() * 900000);
  const otpExpiration = new Date();
  otpExpiration.setMinutes(otpExpiration.getMinutes() + 5);

  try {
    const createdUser = await users.create({
      name,
      phoneNumber,
      email,
      birthday,
      password: encPass,
    });

    const createdOtp = await Otp.create({
      user: createdUser._id,
      otp: otpValue,
      expiration: otpExpiration,
    });
    await sendOtpToEmail(email, otpValue);

    res.status(200).json({
      message: "User registered! OTP sent to email to verify.",
      user: createdUser,
    });
  } catch (error) {
    res.status(400).json({
      status: "failed",
      message: error.message,
    });
  }
};

const verifyOtp = async (req, res) => {
  const { email, otp } = req.body;

  try {
    const user = await User.findOne({ email });

    if (user) {
      const validOtp = await Otp.findOne({
        user: user._id,
        otp,
        used: false,
        expiration: { $gt: new Date() },
      });

      if (validOtp) {
        validOtp.used = true;
        await validOtp.save();

        res.status(200).json({
          message: "OTP verified successfully.",
        });
      } else {
        res.status(400).json({
          status: "failed",
          message: "Invalid OTP or expired.",
        });
      }
    } else {
      res.status(400).json({
        status: "failed",
        message: "User not found.",
      });
    }
  } catch (error) {
    res.status(500).json({
      status: "error",
      message: error.message,
    });
  }
};
module.exports = { signup, verifyOtp };
