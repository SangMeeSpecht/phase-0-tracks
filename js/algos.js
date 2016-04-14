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
// var array = ["long phrase","longest phrase","longer phrase"];

function longest() {
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
console.log(longest());

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

// var one = {name: "Steven", age: 4, gender: "male", color: "pink"}; 
// var two = {name: "Tamir", age: 54, gender: "female", pet: "lizard"};

function match() {
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
console.log(match());

/*
============RELEASE 2==============
*/
