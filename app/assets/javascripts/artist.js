

function submitSong(event) {
  event.preventDefault();

  var title = $("#new-song").val();
//@marjolein je hebt een span gecreeerd rondom je form input met id = "new-song"

  createSong(title);

  $("#new-todo").val(null);
}


$(document).ready(function() {
 $("form#new_song").bind('submit', submitSong);
});
