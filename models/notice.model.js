const mongoose = require("mongoose");

const noticeSchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: true,
      unique: true,
      minlength: [5, "The title must be at least 5 character"],
    },
    noticebody: {
      type: String,
      required: true,
      minlength: [
        15,
        "Please provide the useful notice and it must be atleast 15 characters.",
      ],
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Notice", noticeSchema);
