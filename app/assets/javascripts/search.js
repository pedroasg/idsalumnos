function initSearch(){

  if($("#search").val() == "") {
    $(".search-options").hide()
  }

  $('#search').keyup(function(e) {
    val = $(this).val();
    if(e.keyCode == 8 && !$("#search").length){
      val = "void"
    }
    console.log(val);
    $.ajax({
      method: 'GET',
      url: 'layout/search?search=' + val,
    });
  });
}

$(document).ready(initSearch);
