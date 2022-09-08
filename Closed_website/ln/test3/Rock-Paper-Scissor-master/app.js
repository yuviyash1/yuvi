let userScore= 0;
let compScore = 0;
const userScore_span = document.getElementById('user-score');
const compScore_span = document.getElementById('comp-score');
const scoreBoard_div = document.querySelector('.score-board');
const result_p = document.querySelector('.result > p'); //get hte p tag inside result div
const rock_div = document.getElementById('r');
const paper_div = document.getElementById('p');
const scissor_div = document.getElementById('s');

function getComputerChoice(){
	const choices = ['r','p','s'];
	const randomChoice =Math.floor(Math.random()*3);
	return choices[randomChoice];
	 //math.radom to generate random no *3 to get no upto 2 math.floor to remove decimal values
}
getComputerChoice();

function convertToWord(letter){
	if (letter==='p') return "paper";
	if (letter==='r') return "rock";
	else return "scissor";
}

function win(userChoice, computerChoice){
	const userChoice_div = document.getElementById(userChoice);
	userScore++;
	userScore_span.innerHTML = userScore;
	compScore_span.innerHTML = compScore;
	result_p.innerHTML = convertToWord(userChoice) + " beats " + convertToWord(computerChoice) + " You Win :) ";
	userChoice_div.classList.add('green-glow'); //get document id and set the css styles to it
	setTimeout(function(){userChoice_div.classList.remove('green-glow');}, 300); //set a tier to perform something
	//setTimeout takes two parameters first the function or task to do and second its timing
}
function lose(userChoice,computerChoice){
	const userChoice_div = document.getElementById(userChoice);
	compScore++;
	compScore_span.innerHTML = compScore;
	userScore_span.innerHTML = userScore;
	result_p.innerHTML = convertToWord(userChoice) + " loses to " + convertToWord(computerChoice) + " You Lost :( ";
	userChoice_div.classList.add('red-glow'); //get document id and set the css styles to it
	setTimeout(function(){userChoice_div.classList.remove('red-glow');}, 300);
}
function draw(userChoice,computerChoice){
	const userChoice_div = document.getElementById(userChoice);
	userScore_span.innerHTML = userScore;
	compScore_span.innerHTML = compScore;
	result_p.innerHTML = convertToWord(userChoice) + " equals " + convertToWord(computerChoice) + " It's Draw! ";
	userChoice_div.classList.add('grey-glow'); //get document id and set the css styles to it
	setTimeout(function(){userChoice_div.classList.remove('grey-glow');}, 300);
}


function game(userChoice){
	const computerChoice=getComputerChoice();
	switch (userChoice + computerChoice){
		case "rs":
		case "sp":
		case "pr":
			win(userChoice, computerChoice);
			break;

		case "rp":
		case "ps":
		case "sr":
			lose(userChoice, computerChoice);
			break;

		case "rr":
		case "pp":
		case "ss":
			draw(userChoice, computerChoice);
			break;
	}
}

function main(){
rock_div.addEventListener('click',function(){
	game("r");
});
paper_div.addEventListener('click',function(){
	game("p");
});
scissor_div.addEventListener('click',function(){
	game("s");
});
}

main();