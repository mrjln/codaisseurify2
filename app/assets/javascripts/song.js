
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

      var songId = data.id
      var label = $('<label></label>');
      label.html(titel);

      var linkElementDelete = $('<a href=""></a>');
      linkElementDelete.html("Delete Song");
      linkElementDelete.attr('id',songId);
      linkElementDelete.attr('class','deleteSong');

      var tableRow = $('<tr class="song"></tr>')
        .append($('<td>').append(label))
        .append($('<td>').append(linkElementDelete));
      tableRow.attr('id',songId)

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

function deleteAllSongs(event) {
  event.preventDefault();
  $.each($('.song'), function(){
    songId = this.id;
    removeSong(songId)
  });
}

function deleteSong(event) {
  var songId = event.target.id;
  removeSong(songId);
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
  $(".deleteSong").bind('click', deleteSong );
  $("#delete-all-songs").bind('click', deleteAllSongs);

});
