$(document).ready(function() {
	$("#button").on("click", function() {
		$("body").toggleClass("light");
		$("footer, footer a").toggleClass("black_font");
	});
});
