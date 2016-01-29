var read = require('read');

var Question = function(question, answer, id) {
  this.question = question;
  this.answer = answer;
  this.id = id
};


var Quiz = function(quizName) {
  var allQuestions = [];

  console.log(quizName);

  this.askQuestion = function myself (index) {
    var index = index || 0
    options = {
      prompt: allQuestions[index].question
    }
    read(options, displayAnswer)

    function displayAnswer(err, answer){
      if (answer.toLowerCase() === allQuestions[index].answer){
        console.log("Correct!")
        if (index===allQuestions.length-1){
          console.log("You've finished the quiz!")
          return
        } else {
          return myself(index+1);
        }
      } else {
        console.log("Incorrect")
        return myself(index);
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
var question3 = new Question("What is the capital of Ukraine?", "kiev", 3)
var question4 = new Question("What is the capital of The Netherlands?", "amsterdam", 4)


var euroQuiz = new Quiz("Quiz time! Capitals of Europe!");
euroQuiz.getQuestions(question1);
euroQuiz.getQuestions(question2);
euroQuiz.getQuestions(question3);
euroQuiz.getQuestions(question4);

euroQuiz.askQuestion();
