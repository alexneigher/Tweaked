//Sound Files
var addSound = new Audio("../sounds/add_letter.mp3");
var deleteSound = new Audio("../sounds/add_delete.mp3")

$(function(){
  $("#items1,#items2").sortable({
    cancel: '.original-character',
    connectWith: "#items1, #items2",
    update: function( ) {
      addSound.play();
      completeActionShowSubmit();
    }
  });

  //focus on a letter
  $('.tweak-character.original-character').click(function(){
    $('.tweak-character').removeClass('focus');
    $('#alphabet-container').removeClass('hidden');
    $(this).addClass('focus');
  });


  //add a letter
  $('.tweak-character.addable').click(function(){
    addSound.play();
    var newCharacter = $(this).html();
    var $focusedCharacter = $('.tweak-character.focus');
    $focusedCharacter.children('input').val(newCharacter);
    $focusedCharacter.children('.character').html(newCharacter);
    $focusedCharacter.removeClass('focus');
    completeActionShowSubmit();

  })
})


function completeActionShowSubmit() {
  $('#alphabet-container').remove();
  $('.tweak-character').removeClass('focus');
  $('.reset-btn').removeClass('hidden');
  $('.description-area').removeClass('hidden').focus();
  $('.submit-button').removeClass('hidden');
  $('.tweak-character').unbind('click');
}



