$(document).ready(function(){
   $('.button-collapse').sideNav({
      menuWidth: 200, // Default is 240
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    }
  );

  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

  $('textarea#textarea1').characterCounter();

});

//detecting to see if user is browsing from mobile

