$(document).on('turbolinks:load', function() {
  App.init();
  turbolink_app();
  $('.select-select2').select2();
  $('.input-slider').slider();
});

var turbolink_app = function(){
  $(document).ready(function() {
      $(".notify").slideDown(300, function() {
      window.setTimeout(function() {
        $(".notify").slideUp(300, function() {
          $(".notify").hide();
        });
      }, 3000);
    });
    $(".close-message").click(function(){
      $(".notify").slideUp(300, function() {
        $(".notify").hide();
      });
    });

    $(".btn-comment").click(function(){
      $(".form-comment-"+$(this).attr("id")).slideDown();
    });

    $(function () {
      var find_list = $(".load-more-toggle");
      for(i = 0; i < find_list.length; i++){
        $("." + find_list[i].id + " li").slice(0, 5).show();
      }
      $(".load-more-toggle").on('click', function(e) {
        e.preventDefault();
        var list = e.target.id;
        $("." + list + " li:hidden").slice(0, 5).slideDown();
        $('html,body').animate({
          scrollTop: $(this).offset().top
        }, 500);
      });
    });

    $(function () {
      $(".list-cmt-time-line dt").slice(0, 2).show();
      var find_list = $(".load-more-comment");
      $(".load-more-comment").on('click', function(e) {
        e.preventDefault();
        var list = e.target.id;
        $("." + list + ":hidden").slice(0, 3).slideDown();
      });
    });
  });
};
