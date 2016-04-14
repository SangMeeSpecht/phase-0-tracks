/*
============RELEASE 0==============
declare array, which contains strings of various lengths
	
declare function that returns the longest string in the array
	* loop through each element in the array while the length of the array is greater than 1
		* IF the length of the first element is greater than the 2nd
			* delete the 2nd element
		* ELSE
			* delete the 1st element
	* END of loop
	* RETURN the 1st element of the array
END of function
*/

// var array = ["aa", "aaaa", "aaa", "a"];
// var array = ["bbbb", "bbb", "bb", "b"];
// var array = ["c c", "c", "cccc", " cc c "];
// var array = ["d", "dd", "ddd", "dddd", "d dd ddd dd"];
var arrayTest = ["long phrase","longest phrase","longer phrase"];

function longest(array) {
	for (var index = 1; array.length > 1; index += 0) {
		if (array[0].length > array[index].length) {
			array.splice(1, 1);
		} else {
			array.splice(0, 1);
		}
	}
	return "'" + array[0] + "'";
}

// DRIVER CODE
console.log(longest(arrayTest));

/*
============RELEASE 1==============
declare two objects with several key-value pairs

declare function that checks to see if the 2 objects share any key-value pairs
	* declare variable that keeps track of number of matches
	* declare variable that keeps track of number of non-matches
	* loop through each key-value pair until the end of the object
		* IF key-value pair is equivalent to the other key-value pair
			* increase match counter by 1
		* ELSE
			* increase non-match counter by 1
		* END of conditional
	* END of loop
	* IF the number of matches is equivalent to 0
		* RETURN false
	* ELSE
		* RETURN true
	* END of conditional
END of function
*/

// var one = {name: "Steven", age: 54, gender: "male", color: "pink"}; 
// var two = {name: "Tamir", age: 54, gender: "female", pet: "lizard"};

var first = {name: "Steven", age: 4, gender: "male", color: "pink"}; 
var second = {name: "Tamir", age: 54, gender: "female", pet: "lizard"};

function match(one, two) {
	var matches = 0;
	var noMatches = 0
	
	for (var key in one) {
	  if (one[key] === two[key]) {
	   	matches += 1;
	  } else {
	  	noMatches += 1;
	  }
	}
	
	if(matches === 0) {
		return false;
	} else {
		return true;
	}
}

// DRIVER CODE
console.log(match(first, second));

/*
============RELEASE 2==============
define function that returns a random string with 1-10 characters
	* define array of each letter in the alphabet and store in variable
	* define an empty string and store in variable
	* define a variable that has the value of a random number, with a range of 1-10
	* define a WHILE loop that loops while the string length is less than the random number
		* add a letter at a time to the string; select randomly from the alphabet array
	* END of loop
	* RETURN string
END of function

define function that takes an integer as an argument and returns an array that has that many strings
	* declare an empty array and store in variable
	* define a WHILE loop that loops while the array length is less than the integer argument
		* push the return value of the first function into the array
	* END of loop
	* RETURN array
END of function 
*/

function randomString() {
	var alpha = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
	var string = ""
	var stringLength = Math.floor(Math.random() * (11 - 1)) + 1;
	
	while(string.length < stringLength) {
		string += alpha[Math.floor(Math.random() * (26 - 0)) + 0]; 
	}
	return string;
}

function arrayBuilder(integer) {
	var array = [];

	while(array.length < integer) {
		array.push(randomString());
	}
	return array;
}

// DRIVER CODE
var number = 4

for(count = 1; count < 11; count++) {
	testArray = arrayBuilder(number);
	console.log(testArray);
	console.log(longest(testArray));
}

// Add driver code that does the following 10 times: generates an array, prints the array, feeds the array 
// to your "longest word" function, and prints the result.

