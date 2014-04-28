$(document).ready(function(){
  
  $('.question-vote-box form').on("ajax:success", function(e,data){
    e.preventDefault()
    thing = data
    $('.question-score').html(data)
  })

  $('.answer-upvote-box form').on("ajax:success", function(e,data){ 
    e.preventDefault();
    var parent = $(this).parents()[1]
    var idOfScore = $(parent).children()[3].id
    $('#'+idOfScore).html(data)
  })

  $('.answer-downvote-box form').on("ajax:success", function(e,data){
    e.preventDefault();
    var parent = $(this).parents()[1]
    var idOfScore = $(parent).children()[3].id
    $('#'+idOfScore).html(data)
  })

  $('.comment-upvote-box form').on("ajax:success", function(e,data){ 
    e.preventDefault();
    var parent = $(this).parents()[1]
    var idOfScore = $(parent).children()[1].id
    console.log(parent)
    $('#'+idOfScore).html(data)
  })

  $('.comment-downvote-box form').on("ajax:success", function(e,data){
    e.preventDefault();
    var parent = $(this).parents()[1]
    var idOfScore = $(parent).children()[1].id
    $('#'+idOfScore).html(data)
  })

});
