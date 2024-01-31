const express = require("express");
const {
  registerNotice,
  updateNotice,
  getAllNotice,
  getNotice,
  deleteNotice,
} = require("../controllers/noticeController");
const auth = require("../middleware/auth");
const isAdmin = require("../middleware/isAdmin");

const router = express.Router();

router.route("/register").post(auth, isAdmin, registerNotice);
router.route("/update/:id").patch(auth, isAdmin, updateNotice);
router.route("/allnotice").get(getAllNotice);
router.route("/single-notice/:id").get(auth, isAdmin, getNotice);
router.route("/delete/:id").delete(auth, isAdmin, deleteNotice);

module.exports = router;
