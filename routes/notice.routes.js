const express = require("express");
const uploadModule = require("../middleware/multer.middleware");
const {
  registerNotice,
  updateNotice,
  getAllNotice,
  getNotice,
  deleteNotice,
  downloadNotice,
} = require("../controllers/noticeController");
const upload = uploadModule.upload;
const auth = require("../middleware/auth");
const isAdmin = require("../middleware/isAdmin");

const router = express.Router();

router.route("/register").post(
  upload.fields([
    {
      name: "image",
      maxCount: 1,
    },
  ]),
  registerNotice
);

// router.route("/update/:id").patch(auth, isAdmin, updateNotice);
router.route("/update/:id").patch(
  upload.fields([
    {
      name: "image",
      maxCount: 1,
    },
  ]),
  updateNotice
);
router.route("/allnotice").get(getAllNotice);
router.route("/single-notice/:id").get(getNotice);
router.route("/delete/:id").delete(auth, isAdmin, deleteNotice);
router.route("/download/:id").get(downloadNotice);

module.exports = router;
