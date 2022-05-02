window.addEventListener("load", start, false);

function start() {
    
    var quizButton = document.getElementById("quizButton");
    
    wordsButton.addEventListener("click", findWords, false);
    quizButton.addEventListener("click", submitQuiz, false);
}

function takeQuiz() {
    
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("resultQuiz").innerHTML = this.responseText;
      }
    };
    xhttp.open("GET", "quiz.json", true);
    xhttp.send();
}
