const express = require("express");
const {
  registerComplain,
  getAllComplaints,
  getComplaint,
  deleteComplaint,
} = require("../controllers/complainController");

const router = express.Router();

router.route("/register").post(registerComplain);
router.route("/all-complaints").get(getAllComplaints);
router.route("/single-complaints/:id").get(getComplaint);
router.route("/delete/:id").delete(deleteComplaint);

module.exports = router;
