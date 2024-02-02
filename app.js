const express = require("express");
const helmet = require("helmet");

require("dotenv").config({ path: "./vars/.env" });
require("./models/userModel");

const app = express();

app.use(express.json({ limit: "16kb" }));
app.use(express.urlencoded({ extended: true, limit: "16kb" }));
app.use(express.static("public"));
app.use(helmet());

require("./config/db").connect();

//route import
const userRouter = require("./routes/userRoute");
const noticeRouter = require("./routes/notice.routes");
const newsRouter = require("./routes/news.routes");

//route declaration
app.use("/api/v1", userRouter);
app.use("/api/v1/notice", noticeRouter);
app.use("/api/v1/news", newsRouter);

const port = process.env.port;
app.listen(port, () => {
  console.log(`Server started successfully at port ${port}`);
});
