$(document).ready(function () 
{
    
    $("input[type=submit]:not([class]),input[type=button]:not([class])").addClass("CSS_Button");
    
    $("input[type=submit],input[type=button]").hover(
      function () {
        $(this).css("backgroundImage", $(this).css("backgroundImage").replace(".png","_hover.png"));
      }, 
      function () {
        $(this).css("backgroundImage", $(this).css("backgroundImage").replace("_hover.png",".png"));
      }
    );

});

