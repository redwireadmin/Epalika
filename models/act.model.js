const mongoose = require("mongoose");

const actSchema = new mongoose.Schema(
  {
    file: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      unique: true,
      minlength: [5, "The title must be at least 5 character"],
    },
    actbody: {
      type: String,
      minlength: [
        15,
        "Please provide the useful act or rules  and it must be atleast 15 characters.",
      ],
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Act", actSchema);
