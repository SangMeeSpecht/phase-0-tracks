/*

* Ruby has lots of handy functions like .reverse, but in JavaScript, we mostly have to write our own. In 
comments, pseudocode a function that takes a string as a parameter and reverses the string. reverse("hello"), 
for example, should return "olleh". This isn't a task specific to JavaScript -- your pseudocode should be in 
plain English and use phrases like "for each" instead of JavaScript-specific terms. Remember that you can add 
strings in JavaScript, so '' + 'a' would result in the string 'a'. Take your time. This is the most valuable 
skill in programming: being able to think through a problem logically.

* Under your commented pseudocode, implement your function in JavaScript. Test it with driver code if you 
like. Anytime you'd like to run your code, you can run node explore.js from the js folder in your terminal, 
similar to how you run Ruby programs.

* Add driver code that calls the function in order to reverse a string of your choice (as long as it's not a 
palindrome!), and stores the result of the function in a variable.

* Add driver code that prints the variable if some condition is true. The condition can be a silly one, like 
1 == 1.

declare a function that takes a string as an argument
	loop through each character in the string
		* beginning with the last character in the string, store each character in a data structure
		* continue looping until the length of the reversed string is equal to the length of the original string
		* join all of the strings in the data structure together
		* RETURN the reversed string
	END of loop
END of function

DRIVER CODE
call function with string argument and store in variable

IF some condition is true
	print the variable
END of conditional
*/

