const mongoose = require("mongoose");
require("dotenv").config({ path: "/vars/.env" });

exports.connect = () => {
  mongoose
    .connect(process.env.mongo_connect, {})
    .then(() => {
      console.log("MongoDB connected successfully");
    })
    .catch((error) => {
      console.log("MongoDB connection failed.", error);
    });
};
