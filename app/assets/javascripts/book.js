$(function(){
  $('.edit_book input[type=submit]').remove();
  $('.edit_book input[type=checkbox]').click(function(){
    $(this).parent('form').submit();
  });
});
