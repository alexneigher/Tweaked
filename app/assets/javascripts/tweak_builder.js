$(function(){

  //click on a letter to delete, this removes the "add letter container", shows the reset button
  $('#sortable .deleteable').click(function(){
    $(this).remove();

    //cannot delete any more letter
    $('.deleteable').unbind('click').removeClass('deleteable');

    //remove add letters button and show reset
    $('.add-letter-btn').remove();
    $('.reset-btn').removeClass('hidden');

    //focus on description area
    $('.description-area').removeClass('hidden').focus();

    // show submit
    $('.submit-button').removeClass('hidden');
  });

  //click to add, this unbinds the ability to delete a letter
  $('#addable-characters .tweak-character').click(function(){
    $newchar = $(this).addClass('added').unbind('click');
    $('#sortable').append( $newchar  );

    //disable delete functionality
    $('.deleteable').unbind('click').removeClass('deleteable');

    //remove all other add letters
    $('#alphabet-container').remove();

    //remove add letters button and show reset
    $('.add-letter-btn').remove();
    $('.reset-btn').removeClass('hidden');

    //focus on description area
    $('.description-area').removeClass('hidden').focus();

    // show submit
    $('.submit-button').removeClass('hidden');
  });


  $( "#sortable" ).sortable({
    cancel: ".not-draggable"
  });

  $( "#sortable .tweak-character" ).disableSelection();
})