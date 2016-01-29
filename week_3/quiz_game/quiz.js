var read = require('read');

var Question = function(question, answer, id, points) {
  this.question = question;
  this.answer = answer;
  this.id = id;
  this.points = points;
};

var BonusQuestion = function(question, answer, id, points) {
  this.question = question;
  this.answer = answer;
  this.id = id;
  this.points = points;
};


var Quiz = function(quizName, pointsCounter) {
  var allQuestions = [];
  var allBonusQuestions = [];
  var pointsCounter = pointsCounter || 0;

  console.log(quizName);

  this.askQuestion = function myself (index) {
    var index = index || 0;
    options = {
      prompt: allQuestions[index].question
    }
    read(options, checkAnswer);

    function checkAnswer(err, answer){

      if (answer.toLowerCase() === allQuestions[index].answer){
        pointsCounter += allQuestions[index].points;
        console.log("\nCorrect! \nYou earned " + allQuestions[index].points + " points. Your score is now " + pointsCounter + ". \n");
        

        if (index === allQuestions.length-1){
          console.log("You have finished the quiz. Now you can try a bonus question to double your score!");
          return askBonusQuestion()

        } else {
          return myself(index+1);
        }

      } else {
        console.log("Incorrect");
        return myself(index);
      };

    };
  };

  function askBonusQuestion(){
    var randomIndex = Math.floor(Math.random()*3)
    options = {
      prompt: allBonusQuestions[randomIndex].question
    }
    read(options, checkBonusAnswer);    
    
    function checkBonusAnswer(err, answer){ 
      if (answer.toLowerCase() === allBonusQuestions[randomIndex].answer) {
        pointsCounter = pointsCounter * 2
        console.log("Correct! You've finished the quiz! Your final score is " + pointsCounter)
        return

      } else { 
        console.log ("Incorrect. Your final score is: " + pointsCounter);
        return
      }
    }
  }     
  this.getQuestions = function (questions) {
    allQuestions.push(questions);
    return allQuestions;
  };
  this.getBonusQuestions = function (questions) {
    allBonusQuestions.push(questions);
    return allBonusQuestions;
  }
};


var question1 = new Question("What is the capital of Italy?", "rome", 1, 10);
var question2 = new Question("What is the capital of Spain?", "madrid", 2, 10);
var question3 = new Question("What is the capital of Ukraine?", "kiev", 3, 10);
var question4 = new Question("What is the capital of The Netherlands?", "amsterdam", 4, 10);
var question5 = new Question("What is the capital of Germany?", "berlin", 5, 10);
var bonus1 = new BonusQuestion("What is the capital of Romania?", "bucharest", 1, 0);
var bonus2 = new BonusQuestion("What is the capital of Lithuania?", "vilna", 2, 0);
var bonus3 = new BonusQuestion("What is the capital of Luxembourg?", "luxembourg city", 3, 0);


var euroQuiz = new Quiz("Quiz time! Capitals of Europe! \n");

euroQuiz.getQuestions(question1);
euroQuiz.getQuestions(question2);
euroQuiz.getQuestions(question3);
euroQuiz.getQuestions(question4);
euroQuiz.getQuestions(question5);

euroQuiz.getBonusQuestions(bonus1);
euroQuiz.getBonusQuestions(bonus2);
euroQuiz.getBonusQuestions(bonus3);

euroQuiz.askQuestion();
