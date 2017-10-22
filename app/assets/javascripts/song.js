

function submitSong(event) {
  event.preventDefault();
  resetErrors();
  createSong($("#song_titel").val());
  ($("#song_titel").val(null));
}

var localPath = String(window.location.pathname)+'.json';

function createSong(titel) {
  var newSong = { titel: titel};

  $.ajax({
    type: "GET",
    url: localPath,
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

      var labelDelete = $('<label class="deleteOneSong"></label>');
      labelDelete.html('<a href="#"> Delete this Song </a>');

      var tableRow = $('<tr class="song"></tr>')
        .append($('<td>').append(label))
        .append($('<td>').append(labelDelete));

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


function deleteAllSongs() {
 $('.song').remove();
}

$(document).ready(function() {
$("form").bind('submit', submitSong);
$("#delete-all-songs").bind('click', deleteAllSongs);
});
