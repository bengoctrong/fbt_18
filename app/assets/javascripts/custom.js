$(document).on('change', '#quantity', function(){
  var quantity = parseInt($(this).val());
  var price = parseInt($('#unit_price').text())*quantity;
  $('#price').text(price);
});
