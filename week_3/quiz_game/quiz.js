var read = require('read');

var Question = function(question, answer, id) {
  this.question = question;
  this.answer = answer;
  this.id = id
};

var Quiz = function() {
  var allQuestions = [];

  console.log("Quiz Time!");

  this.askQuestion = function () {
    var index = 0
    options = {
      prompt: allQuestions[index].question
    }
    read(options, displayAnswer)

    function displayAnswer(err, answer){
      if (answer.toLowerCase() === allQuestions[index].answer){
        console.log("Correct!")
        index ++
        return this.askQuestion
      } else {
        console.log("Incorrect")
        return this.askQuestion
      }
    } 
  };

  this.getQuestions = function (questions) {
    allQuestions.push(questions);
    return allQuestions;
  };
};


var question1 = new Question("What is the capital of Italy?", "rome", 1)
var question2 = new Question("What is the capital of Spain?", "madrid", 2)

var aQuiz = new Quiz();
aQuiz.getQuestions(question1);
aQuiz.getQuestions(question2);

aQuiz.askQuestion();
