$(document).on('turbolinks:load', function() {
  $('input.rating[type=number]').rating();
  $(".join-event").click(function(){
    $("#new_user_event").submit();
  });
  $("#request-type").click(function() {
    if ($(this).val()==="Club"){
      $.get(
        "/users/1/club_requests", {},
        function(data) {}
      );
    }else{
      $.get(
        "/users/1/organization_requests", {},
        function(data) {}
      );
    }
  });

  App.init();
});

$(document).ready(function() {
});
