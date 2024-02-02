const express = require("express");
const uploadModule = require("../middleware/multer.middleware");
const { registerNews } = require("../controllers/newsController");
const upload = uploadModule.upload;

const router = express.Router();

router.route("/register").post(
  upload.fields([
    {
      name: "image",
      maxCount: 1,
    },
  ]),
  registerNews
);

module.exports = router;
