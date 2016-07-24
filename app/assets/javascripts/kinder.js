console.log("hello??");

$(document).ready(function() {
	console.log("hello");
	$("dev.swiping_container").on("clck", function(e) {
		console.log("leeeeeft");
	});

	$(".swiping_container").on("swiperight", function(e) {
		console.log("right");
	});
});