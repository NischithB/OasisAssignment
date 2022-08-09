const mongoose = require("mongoose");

var QuestionSchema = new mongoose.Schema({
  label: String,
  selections: {
    type: Map,
    of: Boolean,
  },
});

var ResponseSchema = new mongoose.Schema({
  responseId: mongoose.ObjectId,
  questions: [QuestionSchema],
});

module.exports = mongoose.model("Response", ResponseSchema);
