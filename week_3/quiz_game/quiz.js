var read = require('read');

var Question = function(question, answer, id, points) {
  this.question = question;
  this.answer = answer;
  this.id = id
  this.points = points

};


var Quiz = function(quizName, pointsCounter) {
  var allQuestions = [];
  var pointsCounter = pointsCounter || 0

  console.log(quizName);

  this.askQuestion = function myself (index) {
    var index = index || 0
    options = {
      prompt: allQuestions[index].question
    }
    read(options, displayAnswer)

    function displayAnswer(err, answer){
      if (answer.toLowerCase() === allQuestions[index].answer){
        pointsCounter += allQuestions[index].points
        console.log("\nCorrect! \nYou earned " + allQuestions[index].points + " points. Your score is now " + pointsCounter + ". \n")
        if (index===allQuestions.length-1){
          console.log("You've finished the quiz! Your final score is " + pointsCounter)
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


var question1 = new Question("What is the capital of Italy?", "rome", 1, 10)
var question2 = new Question("What is the capital of Spain?", "madrid", 2, 10)
var question3 = new Question("What is the capital of Ukraine?", "kiev", 3, 10)
var question4 = new Question("What is the capital of The Netherlands?", "amsterdam", 4, 10)


var euroQuiz = new Quiz("Quiz time! Capitals of Europe! \n");
euroQuiz.getQuestions(question1);
euroQuiz.getQuestions(question2);
euroQuiz.getQuestions(question3);
euroQuiz.getQuestions(question4);

euroQuiz.askQuestion();
