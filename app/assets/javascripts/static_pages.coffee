# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).scroll ->
    url = window.location.protocol + '//' + location.hostname + '/'
    user_id = $('.profile').data('id')
    if document.URL == url
        total = $(document).height()
        position = $(window).scrollTop() + $(window).height()
        if position >= total && time > 5
            s = $('.tips').children('li').length
            url = document.URL + '/auto_load'
            $.ajax(
                url: url,
                type: 'GET',
                data: {
                    num: s,
                    user_id: user_id
                }
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
