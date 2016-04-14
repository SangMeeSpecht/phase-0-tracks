/*

declare array, which contains strings of various lengths
	
declare method that returns the longest string in the array
	* loop through each element in the array while the length of the array is greater than 1
		* IF the length of the first element is greater than the 2nd
			* delete the 2nd element
		* ELSE
			* delete the 1st element
	* END of loop
	* RETURN the 1st element of the array
END of method

*/

//============RELEASE 0==============

// DRIVER CODE
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
	return array[0];
}

// DRIVER CODE
console.log(longest());

//============RELEASE 1==============
//============RELEASE 2==============