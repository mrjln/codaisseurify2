

function submitSong(event) {
  event.preventDefault();
  resetErrors();
  createSong($("#song_titel").val());
  ($("#song_titel").val(null));
}

var localPath = String(window.location.pathname)+'.json';

function createSong(titel) {
  var newSong = { titel: titel};

//AJAX CREATE A NEW SONG
  $.ajax({
    type: "GET", //USED GET BECAUSE POST 404
    url: localPath,
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"}) //end of AJAX CREATE NEW SONG

    .done(function(data) {
      console.log(data);

      var updateSongId = ($("#song").length + 1);
      var label = $('<label></label>');
      label.attr('id','song-'+updateSongId);
      label.html(titel);


      var labelDelete = $('<label class="deleteOneSong"></label>');
      labelDelete.html('<a href="#" onClick="deleteSong(this);" > Delete song </a>');
      labelDelete.attr('id','song-'+updateSongId);
      labelDelete.attr('onclick','song-'+updateSongId);

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


//DELETING ALL SONGS WITH AJAX

function deleteAllSongs() {
      $('.song').remove();

      $.ajax({
      type: "DELETE",
      url: localPath,
      contentType: "application/json",
      dataType: "json"
    })

      .done(function(data){
        console.log(data);

      })

      .fail(function(error) {
          console.log(error);
      });

}

//DELETE JUST 1 SONG WITH AJAX

function deleteSong(obj) {
    $(obj).closest('tr').remove();
//Hier wijs je aan wat je verwijderd wilt hebben
        $.ajax({
          type: "DELETE",
          url: localPath,
          data: JSON.stringify,
          contentType: "application/json",
          dataType: "json"})

         .done(function(data){
           console.log(data);

         })

         .fail(function(error) {
             console.log(error);
         });
}

$(document).ready(function() {

$("form").bind('submit', submitSong);
$("#delete-all-songs").bind('click', deleteAllSongs);
$("#delete-song").bind('click', deleteSong);

});
