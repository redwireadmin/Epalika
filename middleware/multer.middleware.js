const multer = require("multer");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./public/temp");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

const upload = multer({
  storage,
});

module.exports = {
  upload,
};

// const multer = require('multer');

// // Define the storage configuration
// const storage = multer.diskStorage({
//   destination: function (req, file, cb) {
//     let uploadFolder = ''; // Initialize the upload folder variable

//     // Determine the upload folder based on the endpoint or some other condition
//     if (req.baseUrl === '/news') {
//       uploadFolder = './public/news'; // Store images uploaded from '/news' endpoint in 'news' folder
//     } else if (req.baseUrl === '/notice') {
//       uploadFolder = './public/notice'; // Store images uploaded from '/notice' endpoint in 'notice' folder
//     } else {
//       uploadFolder = './public/temp'; // Default folder if no specific condition matches
//     }

//     // Call the callback with the determined upload folder
//     cb(null, uploadFolder);
//   },
//   filename: function (req, file, cb) {
//     cb(null, file.originalname);
//   },
// });

// // Initialize multer with the configured storage
// const upload = multer({ storage: storage });

// // Now, you can use the 'upload' middleware in your routes to handle file uploads
