function appendAnswer(){
  alert('hello');
}


$(document).ready(function(){
  $('form#new_answer').on("ajax:success", function(e, data){

  console.log(data)

    $('ul.answer-list').append(data)
  })
});

