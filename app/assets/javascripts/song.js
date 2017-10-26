
function submitSong(event) {
  event.preventDefault();
  resetErrors();
  var newSong = $("#song_form").val();
  createSong(newSong);
  ($("#song_form").val(null));

}

function createSong(titel) {

  $.ajax({
    type: "POST"  ,
    url: "/api"+ window.location.pathname + "/songs.json",
    data: JSON.stringify({
      song: {
      titel: titel }

    }),
    contentType: "application/json",
    dataType: "json"})

    .done(function(data) {
      console.log(data);

      var SongId = data.id
      var label = $('<label></label>');
      label.html(titel);

      var labelDelete = $('<label></label>');
      labelDelete.html('<a href="#", class="deletesong"> Delete Song</a>');
      labelDelete.attr('id',SongId);

      var tableRow = $('<tr class="song"></tr>')
        .append($('<td>').append(label))
        .append($('<td>').append(labelDelete));
      tableRow.attr('id',SongId)

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


/*/DELETING ALL SONGS WITH AJAX

function deleteAllSongs() {
      $('.song').remove();

      $.ajax({
      type: "GET",
      url: "/api"+ window.location.pathname + "/songs/" + songId + ".json",
      contentType: "application/json",
      dataType: "json"
    })

      .done(function(data){
        console.log(data);

      })

      .fail(function(error) {
          console.log(error);
      });

} */

function deleteSong(event) {
  var songId = event.target.id;
  removeSong(songId);
  debugger;
}

function removeSong(songId) {

        $.ajax({
          type: "DELETE",
          url: "/api"+ window.location.pathname + "/songs/" + songId + ".json",
          data: JSON.stringify,
          contentType: "application/json",
          dataType: "json"})

         .done(function(data){
           $(data).closest('tr').remove();

         })

         .fail(function(error) {
             console.log(error);
         });
}

$(document).ready(function() {

$("form").bind('submit', submitSong);
//$("#delete-all-songs").bind('click', deleteAllSongs);
$(".deletesong").bind('click', deleteSong);

});
