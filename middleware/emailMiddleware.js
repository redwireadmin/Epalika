const nodemailer = require("nodemailer");
require("dotenv").config({ path: "../vars/.env" });
const asyncWrapper = require("../middleware/async");

const sendEmail = asyncWrapper(async (email, subject, text) => {
  const transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false,
    auth: {
      user: process.env.SMTP_MAIL,
      pass: process.env.SMTP_PASSWORD,
    },
  });

  const mailOptions = {
    from: process.env.SMTP_MAIL,
    to: email,
    subject: subject,
    text: text,
  };
  const info = await transporter.sendMail(mailOptions);
  console.log("Mail has been sent", info.response);
});

module.exports = { sendEmail };
