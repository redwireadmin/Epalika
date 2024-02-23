const departmentList = [
  "Administration and Planning",
  "Infrastructure Development",
  "Youth and Sports Department",
  "Education Department",
  "Environmental Management",
  "Health and Social Development",
  "Economic Administration",
  "Information Technology",
];

const WardList = ["Ward 1", "Ward 2", "Ward 3", "Ward 4", "Ward 5"];

const getDepartmentList = (req, res) => {
  res.json(departmentList);
};

const getWardList = (req, res) => {
  res.json(WardList);
};

module.exports = {
  getDepartmentList,
  getWardList,
};
