function submitSong(event) {
  event.preventDefault();
  resetErrors();
  createSong($("#new_song_titel").val());
  ($("#new_song_titel").val(null));
}

function createSong(titel) {
  var newSong = { titel: titel};

  $.ajax({
    type: "POST",
    url: "/artists/:artist_id.json",
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"})

    .done(function(data) {
      console.log(data);

      var listItem = $("<li></li>");
      listItem.addClass("song");

      var label = $('<label></label>');
      label.attr('for',"song-"+ data.id);
      label.html(titel);

      listItem.append(label);
      $("#songlist").append( listItem );

    })

    .fail(function(error) {
      console.log(error);


    });
}

function resetErrors() {
  $("#error_message").remove();
  $("#new_song_titel").removeClass("error");
}


$(document).ready(function() {
// $("form#new_song").bind('submit', submitSong);
});
