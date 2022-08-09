var express = require("express");
var mongoose = require("mongoose");
var bodyParser = require("body-parser");
var Response = require("./models/response");

var app = express();
var port = 3000;

var mongoDB = "mongodb://localhost:27017/oasis_forms";
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });
var db = mongoose.connection;
db.on("error", console.error.bind(console, "MongoDB connection error"));

app.use(bodyParser.json());

app.get("/", (req, res) => {
  Response.find().exec(function (err, list_responses) {
    if (err) {
      return console.log(err);
    }
    //Successful, so render
    res.send({
      title: "Response List",
      response_list: list_responses,
    });
  });
});

app.post("/save", (req, res) => {
  var response = new Response({ questions: req.body.responses });
  response
    .save()
    .then((item) => {
      res.status(200).send("Form saved");
    })
    .catch((err) => {
      res.status(400).send("unable to save to database");
    });
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
