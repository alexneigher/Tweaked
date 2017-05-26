$(function(){

  $( "#draggable-tweak-characters" ).sortable();

  //drop in the delete area
  $("#remove-character").droppable({
    activeClass: 'active',
    hoverClass:'hovered',
    accept:".tweak-character",
    drop:function(event, ui){
      ui.draggable.remove();
    }
  });

  //click to add
  $('.tweak-character.clickable').click(function(){
    var $newChar = $(this).removeClass('clickable');
    $('#draggable-tweak-characters').append( $newChar )
  })
})