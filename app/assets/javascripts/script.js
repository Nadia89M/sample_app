$(document).ready(function() {

  setTimeout(function(){
    $('#notice').fadeOut();
  }, 4000);

  $('.img-zoom').hover(function(){
    $(this).elevateZoom();
  })

})
