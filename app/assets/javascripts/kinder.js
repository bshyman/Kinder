console.log("hello??");

$(document).ready(function() {
	console.log("hello");
	$("div.swiping_container").on("click", function(e) {
		console.log(e.target);
		console.log("leeeeeft");
	});

	$(".swiping_container").on("swiperight", function(e) {
		console.log("right");
	});
});