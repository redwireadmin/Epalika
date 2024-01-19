const express = require("express");
const helmet = require("helmet");
const userRouter = require("./routes/userRoute");
require("dotenv").config({ path: "./vars/.env" });
require("./models/userModel");

const app = express();

app.use(express.json());
app.use(helmet());

require("./config/db").connect();

//routes
app.use("/api/v1", userRouter);

const port = process.env.port;
app.listen(port, () => {
  console.log(`Server started successfully at port ${port}`);
});
