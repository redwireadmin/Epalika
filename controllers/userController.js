const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const Otp = require("../models/otpModel");
const User = require("../models/userModel");
const jwt = require("jsonwebtoken");
const asyncWrapper = require("../middleware/async");
const randomstring = require("randomstring");
require("dotenv").config({ path: "../vars/.env" });

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
  const { name, phoneNumber, email, birthday, password } = req.body;
  const encPass = await bcrypt.hash(password, 10);
  const otpValue = Math.floor(100000 + Math.random() * 900000);
  const otpExpiration = new Date();
  otpExpiration.setMinutes(otpExpiration.getMinutes() + 3);

  try {
    const createdUser = await User.create({
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

const verifyOtp = asyncWrapper(async (req, res) => {
  const { email, otp } = req.body;

  const user = await User.findOne({ email });

  if (!user) {
    res.status(400).json({
      status: "failed",
      message: "User not found.",
    });
    return;
  }

  const validOtp = await Otp.findOne({
    user: user._id,
    otp,
    used: false,
    expiration: { $gt: new Date() },
  });

  if (!validOtp) {
    res.status(400).json({
      status: "failed",
      message: "Invalid OTP or expired.",
    });
    return;
  }

  validOtp.used = true;
  await validOtp.save();

  res.status(200).json({
    message: "OTP verified successfully.",
  });
});

const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    if (!email) throw "Please provide email.";
    if (!password) throw "user must enter the password.";

    const getUser = await User.findOne({
      email: email,
    });

    if (!getUser) throw "The email is not registered.";

    const matched = await bcrypt.compare(password, getUser.password);

    if (!matched) throw "The email and password doesn't match.";
  } catch (e) {
    res.status(400).json({
      status: "failed",
      message: e,
    });
    return;
  }

  const getUserForAccessToken = await User.findOne({
    email: email,
  });

  const accessToken = await jwt.sign(
    {
      _id: getUserForAccessToken._id,
      email: getUserForAccessToken.email,
      name: getUserForAccessToken.name,
    },
    process.env.jwt_salt,
    { expiresIn: "5 years" }
  );
  res.status(200).json({
    status: "user logged in successfully.",
    accessToken,
  });
};

const sendResetPasswordMail = async (name, email, token) => {
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

    const resetUrl = `http://localhost:8000/api/v1/resetpassword?token=${token}`; // Update with your frontend app URL
    const mailOptions = {
      from: process.env.SMTP_MAIL,
      to: email,
      subject: "Password Reset",
      text: `Hi ${name} You are receiving this email because you (or someone else) has requested the reset of the password for your account.\n\n
      Please click on the following link, or paste this into your browser to complete the process:\n\n
      ${resetUrl}\n\n
      If you did not request this, please ignore this email and your password will remain unchanged.\n`,
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

const forgotPassword = async (req, res) => {
  try {
    const email = req.body.email;
    const userData = await User.findOne({ email: email });
    if (userData) {
      const randomString = randomstring.generate();
      const data = await User.updateOne(
        { email: email },
        { $set: { token: randomString } }
      );
      sendResetPasswordMail(userData.name, userData.email, randomString);
      res.status(200).json({
        success: "true",
        message: "Please check your inbox to reset the password.",
      });
    } else {
      res.status(200).json({
        success: "true",
        message: "This email does not exists.",
      });
    }
  } catch (error) {
    res.status(400).json({
      success: "false",
      message: error.message,
    });
  }
};

const resetPassword = async (req, res) => {
  try {
    const token = req.query.token;
    const tokenData = await User.findOne({ token: token });
    console.log(tokenData);
    if (tokenData) {
      const password = req.body.password;
      const newPassword = await bcrypt.hash(password, 10);
      const userData = await User.findByIdAndUpdate(
        { _id: tokenData._id },
        { $set: { password: newPassword, token: "" } },
        { new: true }
      );
      res.status(200).json({
        success: "true",
        message: "User password has been reset.",
        data: userData,
      });
    } else {
      res.status(200).json({
        success: "true",
        message: "This link has been expired.",
      });
    }
  } catch (error) {
    res.status(400).json({
      success: "false",
      message: error.message,
    });
  }
};

module.exports = { signup, verifyOtp, login, forgotPassword, resetPassword };
