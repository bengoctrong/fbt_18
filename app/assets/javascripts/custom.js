$(document).on('change', '#quantity', function(){
  var quantity = parseInt($(this).val());
  var price = parseInt($('#unit_price').text())*quantity;
  $('#price').text(price+"$");
});
$(document).on('change', '#category', function(){
  $.ajax({
    method: 'get',
    url: '/',
    data: {category : $('#category').val()},
    contentType: 'json',
    dataType: 'script',
  });
});
$(document).on('change', '#categoryadmin', function(){
  $.ajax({
    method: 'get',
    url: '/admin/tours',
    data: {category : $('#categoryadmin').val()},
    contentType: 'json',
    dataType: 'script',
  });
});

