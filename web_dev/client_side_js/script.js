console.log("Connecting files");

// Release 1
var add_items = document.createElement("li");
var node = document.createTextNode("Lunges");
add_items.appendChild(node);

var add_exercise = document.getElementById("home_exercises");
add_exercise.appendChild(add_items);

// Release 2
function addExercises(event) {
	var exerciseOptions = ["dead lifts", "eliptical", "crunches"];
	var rand = exerciseOptions[Math.floor(Math.random() * exerciseOptions.length)];

	console.log(event);
	var add_items = document.createElement("li");
	var node = document.createTextNode(rand);
	add_items.appendChild(node);

	var add_exercise = document.getElementById("home_exercises");
	add_exercise.appendChild(add_items);
}

var test = document.getElementById("add_exercises");
test.addEventListener("click", addExercises);



















