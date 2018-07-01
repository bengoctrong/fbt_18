$(document).ready(function(){
  $('#quantity').change(function(){
    var quantity = parseInt($(this).val());
    var price = parseInt($('#unit_price').text())*quantity;
    $('#price').text(price + "$");
  });
  $('#category').change(function(){
    $.ajax({
      method: 'get',
      url: '/',
      data: {category : $('#category').val()},
      contentType: 'json',
      dataType: 'script',
    });
  });
})

