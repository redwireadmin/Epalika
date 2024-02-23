const express = require("express");
const {
  registerAct,
  getAllAct,
  updateAct,
  getAct,
  deleteAct,
  downloadAct,
} = require("../controllers/actController");
const uploadModule = require("../middleware/multer.middleware");
const upload = uploadModule.upload;

const router = express.Router();

router.route("/register").post(
  upload.fields([
    {
      name: "file",
      maxCount: 1,
    },
  ]),
  registerAct
);
router.route("/all-act").get(getAllAct);
router.route("/single-act/:id").get(getAct);
router.route("/update/:id").patch(updateAct);
router.route("/delete/:id").delete(deleteAct);
router.route("/download/:id").get(downloadAct);

module.exports = router;
