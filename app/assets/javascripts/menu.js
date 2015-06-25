$(document).ready(function() {

  $('.dropdown-toggle.jewelry').mouseover(function() {
    $('.dropdown-menu.jewelry').show().on('mouseover', function() {
      $('.dropdown-menu.jewelry').show(); 
    }).on('mouseleave', function() {
      $('.dropdown-menu.jewelry').hide();
    });
  });

  $('.dropdown-toggle.jewelry').mouseout(function() {
    $('.dropdown-menu.jewelry').hide();
  });

  $('.dropdown-toggle.info').mouseover(function() {
    $('.dropdown-menu.info').show().on('mouseover', function() {
      $('.dropdown-menu.info').show(); 
    }).on('mouseleave', function() {
      $('.dropdown-menu.info').hide();
    });
  });

  $('.dropdown-toggle.info').mouseout(function() {
    $('.dropdown-menu.info').hide();
  });



  var isSidebarOpen = false;
  $('.bars-icon').click(function() {
    if (isSidebarOpen) {
      $('.side-menubar').animate({ right: "-250px" }, 200);
      $('.main').animate({ right: "0px"}, 200);
    } else {
      $('.side-menubar').animate({ right: "0px" }, 200);
      $('.main').animate({ right: "250px"}, 200);
    }
    isSidebarOpen = !isSidebarOpen;  
  });
  
});

