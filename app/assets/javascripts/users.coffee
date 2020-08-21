# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll ->
    url = window.location.protocol + '//' + location.hostname + '/users'
    #console.log(url)
    if document.URL == url
        total = $(document).height()
        position = $(window).scrollTop() + $(window).height()
        if position >= total && time > 5
            s = $('.users').children('li').length
            console.log(s)
            $.ajax(
                url: '/users/auto_load',
                type: 'GET',
                data: num: s
            )
            timerReset()
    return
  
time = 0

timer  = () ->
    setInterval ->
        time++
    ,100
    return
    
timerReset = () ->
    time = 0

timer()
