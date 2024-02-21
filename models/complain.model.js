const mongoose = require("mongoose");

const complainSchema = new mongoose.Schema(
  {
    subject: {
      type: String,
      required: true,
      unique: true,
      minlength: [5, "The title must be at least 5 character"],
    },
    cbody: {
      type: String,
      required: true,
      minlength: [15, "Explain brief about your dissatisfaction."],
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Complain", complainSchema);
