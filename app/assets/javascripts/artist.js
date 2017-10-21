function submitSong(event) {
  event.preventDefault();
  resetErrors();
  createSong($("#new_song_titel").val());
  ($("#new_song_titel").val(null));
}

function createSong(titel) {
  var newSong = { titel: titel};
  var path =

  $.ajax({
    type: "POST",
    url: '/songs.json',
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"})

    .done(function(data) {
      console.log(data);

      var label = $('<label></label>');
      label.attr('for','song-999');
      label.html(titel);

      var tableRow = $('<tr class="song"></tr>')
        .append($('<td>').append(label));

        $('#songsTable').append(tableRow);

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
 $("form").bind('submit', submitSong);
});
