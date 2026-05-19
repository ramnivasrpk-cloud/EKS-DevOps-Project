const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("Production Grade DevOps Project Running on AWS EKS");
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});
