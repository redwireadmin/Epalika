const mongoose = require("mongoose");

const newsSchema = new mongoose.Schema(
  {
    image: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
      unique: true,
      minlength: [5, "The title must be at least 5 character"],
    },
    newsBody: {
      type: String,
      required: true,
      minlength: [
        15,
        "Please provide the useful news and it must be atleast 15 characters.",
      ],
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("News", newsSchema);
