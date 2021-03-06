/*
============RELEASE 0==============
declare function that returns the longest string(s) in an array
	* declare variable that keeps track of the current longest string(s)
	* loop through each element in the array
		* IF the element is longer than current longest string(s)
			* replace the current longest string(s) with the new longest string
		* ELSE IF the element is equal to the current longest string(s)
			* add it to the list of current longest string(s)
	* END of loop
	* RETURN the longest string(s) in the array
END of function
*/

function longestString(array) {
	var longest = [array[0]];
	
	for (var index = 1; index < array.length; index++) {
		if (longest[0].length < array[index].length) {
			longest = [array[index]];
		} else if (longest[0].length === array[index].length) {
			longest.push(array[index]);
		} 
	}
	return longest;
}

/*
============RELEASE 1==============
declare function that checks to see if the 2 objects share any key-value pairs
	* loop through each key-value pair until the end of the object
		* IF key-value pair is equivalent to the other key-value pair
			* RETURN true
		* END of conditional
	* END of loop
	* RETURN false 
END of function
*/

function match(one, two) {
	for (var key in one) {
		if (one[key] === two[key]) {
	   		return true;
		}
	}
	return false;
}

/*
============RELEASE 2==============
define function that returns a random string with 1-10 characters
	* define list of each letter in the alphabet and store in variable
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
	var stringLength = Math.floor((Math.random() * (10)) + 1);
	
	while(string.length < stringLength) {
		string += alpha.charAt(Math.floor((Math.random() * alpha.length))); 
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
// var arrayTest = ["bbbb", "bbb", "bb", "b", "bbbc"];
// var arrayTest = ["c c", "c", "cccc", " cc c "];
// var arrayTest = ["d", "dd", "ddd", "dddd", "d dd ddd dd"];
var arrayTest = ["long phrase","longest phrase","longer phrase"];

console.log(longestString(arrayTest));


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
	console.log(longestString(testArray));
}
