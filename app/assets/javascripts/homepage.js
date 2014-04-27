$(document).ready(function(){

  $('a[href="#recent"]').click(function (e) {
    e.preventDefault()
    $('#votes').css('display','none')
    $('#recent').css('display','block')
    $('#trending').css('display','none')

  })
  $('a[href="#votes"]').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
    $('#recent').css('display','none')
    $('#votes').css('display','block')
    $('#trending').css('display','none')

  })

  $('a[href="#trending"]').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
    $('#recent').css('display','none')
    $('#votes').css('display','none')
    $('#trending').css('display','block')
  })

});