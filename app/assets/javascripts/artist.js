
function submitSong(event) {
  event.preventDefault();

  var title = $("#new-song").val();
//@marjolein je hebt een span gecreeerd rondom je form-input met id = "new-song"

  createSong(title);

  $("#new-todo").val(null);
}

function createSong(title) {

  var listItem = $("<li></li>");
  listItem.addClass("song");

  var label = $('<label></label>');
  label.attr('for',"song-"+ newSongId();
  label.html(title);

  listItem.append(label);

  $("#songlist").append( listItem );

}

function newSongId() {
  return $(".song").length  + 1;
}
//je begint hier dus weer met een song id van 2 of 1, niet geheel goed maar het werkt




$(document).ready(function() {
 $("form#new_song").bind('submit', submitSong);
});
