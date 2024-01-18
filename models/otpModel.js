const mongoose = require("mongoose");

const otpSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  otp: {
    type: Number,
    required: true,
  },
  expiration: {
    type: Date,
    default: () => new Date(Date.now() + 60 * 1000),
    required: true,
  },
  used: {
    type: Boolean,
    default: false,
  },
});

otpSchema.index({ expiration: 1 }, { expireAfterSeconds: 0 });
const Otp = mongoose.model("Otp", otpSchema);

module.exports = Otp;
