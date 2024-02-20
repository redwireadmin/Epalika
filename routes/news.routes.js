const express = require("express");
const uploadModule = require("../middleware/multer.middleware");
const {
  registerNews,
  getAllNews,
  getNews,
  updateNews,
  deleteNews,
} = require("../controllers/newsController");
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
router.route("/allnews").get(getAllNews);
router.route("/single-news/:id").get(getNews);
router.route("/update/:id").patch(updateNews);
router.route("/delete/:id").delete(deleteNews);

module.exports = router;
