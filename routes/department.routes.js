const express = require("express");
const departmentList = require("../controllers/departmentListController");

const router = express.Router();

router.route("/department-list").get(departmentList.getDepartmentList);
router.route("/ward-list").get(departmentList.getWardList);

module.exports = router;
