/*
============RELEASE 0==============
declare array, which contains strings of various lengths
	
declare function that returns the longest string in the array
	* assign the first element in the array to a variable
	* loop through each element in the array, starting at the 2nd element, while it's less than the length of the array
		* IF the length of the current longest string is equivalent to the string being compared
			* assign the current string to the current longest string variable
		* ELSE IF the length of the current longest word is equivalent to the current string
			* add the current string to the current longest string variable
	* END of loop
	* RETURN the value of the longest string variable
END of function
*/

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
	var alpha = "abcdefghijklmnopqrstuvwxyz";
	var string = "";
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

// Release 0
// var arrayTest = ["aa", "aaaa", "aaa", "a"];
// var arrayTest = ["bbbb", "bbb", "bb", "b"];
// var arrayTest = ["c c", "c", "cccc", " cc c "];
// var arrayTest = ["d", "dd", "ddd", "dddd", "d dd ddd dd"];
var arrayTest = ["long phrase","longest phrase","longer phrase"];

console.log(longest(arrayTest));


// Release 1
// var one = {name: "Steven", age: 54, gender: "male", color: "pink"}; 
// var two = {name: "Tamir", age: 54, gender: "female", pet: "lizard"};
var first = {name: "Steven", age: 4, gender: "male", color: "pink"}; 
var second = {name: "Tamir", age: 54, gender: "female", pet: "lizard"};

console.log(match(first, second));


// Release 2
var number = 4

for(count = 1; count < 11; count++) {
	testArray = arrayBuilder(number);
	console.log(testArray);
	console.log(longest(testArray));
}
