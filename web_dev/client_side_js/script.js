console.log("Connecting files");


var add_items = document.createElement("li");
var node = document.createTextNode("Lunges");
add_items.appendChild(node);


var add_exercise = document.getElementById("home_exercises");
add_exercise.appendChild(add_items);

var btn = document.createElement("BUTTON");
var node2 = document.createTextNode("Add Exercise");
btn.appendChild(node2);

var add_more_exercise = document.getElementById("home_exercises");
add_more_exercise.appendChild(btn);

function addExercises(event) {
	// console.log("Click on the button to add more exercises.");
	console.log(event);
	event.target.style.border = "4px solid green";
}

var test = document.getElementById("home_exercises");
test.addEventListener("click", addExercises);



















