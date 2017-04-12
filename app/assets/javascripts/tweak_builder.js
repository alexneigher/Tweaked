$(function(){

  $( "#draggable-tweak-characters" ).sortable();
  $( "#draggable-tweak-characters" ).disableSelection();

  //click to add
  $('.tweak-character.clickable').click(function(){
    var $newChar = $(this).removeClass('clickable');
    $('#draggable-tweak-characters').append( $newChar )
  })
})