$(function(){
  $('.tweak-character.clickable').click(function(){
    $(this).remove();

    $('.tweak-character').unbind('click').removeClass('clickable');

    $('textarea').focus();

    $('.submit-tweak').removeClass('disabled');

    $('.reset-button').removeClass('hidden')
  });
})

// No longer using drag and drop functionality
// $(function(){

//   $( "#draggable-tweak-characters" ).sortable();

//   //drop in the delete area
//   $("#remove-character").droppable({
//     activeClass: 'active',
//     hoverClass:'hovered',
//     accept:".tweak-character",
//     drop:function(event, ui){
//       ui.draggable.remove();
//     }
//   });

//   //click to add
//   $('.tweak-character.clickable').click(function(){
//     var $newChar = $(this).removeClass('clickable');
//     $('#draggable-tweak-characters').append( $newChar )
//   })
// })
