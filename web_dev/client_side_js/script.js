console.log("Connecting files");

// Release 1
// Add another list element
var addItems = document.createElement("li");
var node = document.createTextNode("Lunges");
addItems.appendChild(node);

var addExercise = document.getElementById("home_exercises");
addExercise.appendChild(addItems);

// Release 2
// Add another list element with an event listener
function addExercises(event) {
	var exerciseOptions = ["Dead lifts", "Eliptical", "Crunches"];
	var rand = exerciseOptions[Math.floor(Math.random() * exerciseOptions.length)];

	console.log(event);

	var addMoreItems = document.createElement("li");
	var node2 = document.createTextNode(rand);
	addMoreItems.appendChild(node2);

	var addMoreExercise = document.getElementById("home_exercises");
	addMoreExercise.appendChild(addMoreItems);
}

var test = document.getElementById("add_exercises");
test.addEventListener("click", addExercises);



















