/*
declare a function that takes a string as a parameter
	loop through each character in the string
		* store empty string in variable 
		* beginning with the last character in the string, store each character in empty string
		* continue looping until the length of the reversed string is equal to the length of the original string
	END of loop
		* RETURN the reversed string
END of function

DRIVER CODE
call function with string argument and store in variable

IF some condition is true
	print the variable
END of conditional
*/

// Reverses string argument
function reversed(string) {
	var reverseString = "";
	for (index = string.length - 1; index >= 0; index --) {
		reverseString += string[index];
	}
	return reverseString;
}

// DRIVER CODE
console.log(reversed("hello"));
var string = "hiya!"

if (1 + 1 == 2) {
	console.log(reversed(string));
}
