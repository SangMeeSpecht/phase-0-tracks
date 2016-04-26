Release 0
Study Plan
* Read info page about jQuery to get a big picture of it
* Codecademy (I personally learn best by experience and the course is very short, for this reason, I have decided to go against the assignment suggestion)
* Look for cheatsheets
* Take notes, bookmark important pages

Release 1
Effective Strategies
* The most effective strategy was going through the Codecademy jQuery course.  I really learn best and remember the most through experiencing it.  


jQuery Notes
* cross-platform JavaScript library used to simplify (make it easier to navigate document, select DOM elements, create animations, handle events) HTML scripting
* most popular JavaScript library
* free and open-source software
* usually used to create dynamic web pages and apps
* link file into HTML with this syntax: `<script type = "text/javascript" src="filename.js"></script>`
* simple syntax --> `$(document).ready(something);`
	* `$()` --> notifies jQuery that something is about to happen
	* `$(document)` --> notifies jQuery that it's going to do something to a doc; turns docs into jQuery object
	* `.ready()` --> function that will be called when doc is ready
	* `.ready(something)` --> jQuery event that will occur when doc is ready
	* example: `$(document).ready(function(){$("div").slideDown("slow");});`
	* example: 
	$(document).ready(function() {
    	$(".pull-me").click(function() {
        	$(".panel").slideToggle("slow");
        });
	});
* compound selector example
	* `$('p, li').fadeTo('slow', 0);`
* to select only certain elements when an event happens (vs. all of them), use `this` to refer to element you're doing something to (i.e. click on it)
 * `$(document).ready(function() {
    $('div').click(function() {
        $(this).fadeOut('slow');
    });
});`
* can insert new html elements into document
	* `$p = $("<p>I'm a new paragraph!</p>");`
* can add these elements before(prepend - first child) or after(append - last child) a target element
	* 
	$`(document).ready(function() {
    	$("body").append("<p>I'm a paragraph!</p>");
	});`
* can specify exactly where to put new element with `before` and `after` functions
	* 
	`$(document).ready(function() {
    	$("#one").after("<p>Div #1.5</p>");    
	});`
* can easily move elements around in the DOM (can also move existing elements by saving in variables)
	* 
	`$(document).ready(function() {
    	$("#one").after("<p>paragraph 1</p>");  
    	$("#two").after($("p"));
	});`
* can use `empty`(empties descendants in element) and `remove`(deletes descendants and itself) functions to remove elements
	* 
	`$(document).ready(function() {
    	$("#one").after("<p>paragraph 1</p>");  
    	$("#two").after($("p"));
    	$("p").remove();
	});`
* can add('.addClass()') or remove a class(`.removeClass()`) to an element
	* 
	`$(document).ready(function() {
    	$("#text").click(function() {
   			 $(this).addClass("highlighted");
    	});
	});`
* can turn class on or off, depending on its current state, with the `toggle` function
	* 
	`$(document).ready(function() {
    	$("#text").click(function() {
       		 $(this).toggleClass("highlighted");
    	});
	});`
* can change size of element
	* 
	`$(document).ready(function() {
    	$("div").height("200px");
    	$("div").width("200px");
    	$("div").css("border-radius", "10px");
	});`
* can modify content in html documents
	* `$('div').html("I love jQuery!");` (modifies first element that matches)
	* `$('input:checkbox:checked').val();` (modifies first value of the form elements)

http://www.dummies.com/how-to/content/jquery-for-dummies-cheat-sheet.html
https://en.wikipedia.org/wiki/JQuery
