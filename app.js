const express = require("express");
const helmet = require("helmet");
require("dotenv").config({ path: "./vars/.env" });
require("./config/db").connect();
const port = process.env.port;
const userRouter = require("./routes/userRoute");
require("./models/userModel");

const app = express();

app.use(express.json());
app.use(helmet());

//routes
app.use("/api/v1", userRouter);

app.listen(port, () => {
  console.log(`Server started successfully at port ${port}`);
});
