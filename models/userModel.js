const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "name is required."],
      trim: true,
    },
    phoneNumber: {
      type: String,
      required: [true, "Phone number is required."],
      validate: {
        validator: (value) => {
          return /^\+977\d{10}$/.test(value);
        },
        message: (props) =>
          `${props.value} is not a valid phone number in the format +977XXXXXXXXX`,
      },
    },
    email: {
      type: String,
      required: [true, "email address is required."],
      unique: [true, "email is already in use"],
    },
    birthday: {
      type: Date,
      required: [true, "Birthday is required."],
      validate: {
        validator: (value) => {
          return value < new Date();
        },
        message: (props) =>
          `${props.value} is not a valid birthday. It should be in the past.`,
      },
    },
    password: {
      type: String,
      required: [true, "Password is required."],
      hidden: true,
    },
    otps: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Otp",
      },
    ],
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("users", userSchema);
