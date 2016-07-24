$(document).ready(function() {
  var xDown = 0;
  var yDown = 0;
  var xUp = 0;
  var yUp = 0;
  var pixelDifference = 30;
  $("#swiping_container")
    .on('mousedown touchstart', function (e) {
        xDown = e.pageX;
        yDown = e.pageY;
    })
    .on('mouseup touchend',function (e) {
        xUp = e.pageX;
        yUp = e.pageY;
        if (xDown+pixelDifference <= xUp) {
          //swiping right
            console.log("right!");
        } else if (xDown-pixelDifference >= xUp) {
          //swiping left
            console.log("left!");
        }
    });
});
