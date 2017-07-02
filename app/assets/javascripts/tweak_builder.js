$(function(){


  $("#items1,#items2").sortable({
    connectWith: "#items1, #items2",
    update: function( ) {
      completeActionShowSubmit();
    }
  });

  $('.tweak-character.original-character').click(function(){
    $('.tweak-character').removeClass('focus');
    $('#alphabet-container').removeClass('hidden');
    $(this).addClass('focus');
  });


  $('.tweak-character.addable').click(function(){
    var newCharacter = $(this).html();
    var $focusedCharacter = $('.tweak-character.focus');
    $focusedCharacter.children('input').val(newCharacter);
    $focusedCharacter.children('.character').html(newCharacter);
    $focusedCharacter.removeClass('focus');
    completeActionShowSubmit();

  })

  $('.delete-button').click(function(){
    $('.tweak-character.focus').remove();
    completeActionShowSubmit();
  });
})






function completeActionShowSubmit() {
  $('#alphabet-container').remove();
  $('.tweak-character').removeClass('focus');
  $('.reset-btn').removeClass('hidden');
  $('.description-area').removeClass('hidden').focus();
  $('.submit-button').removeClass('hidden');
  $('.tweak-character').unbind('click');
}
