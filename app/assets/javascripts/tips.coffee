# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).scroll ->
    hoge = $('.profile')
    user_id = $('.profile').data('id')
    url = '/users/' + String(user_id)
    #console.log(url)
    if document.URL.match(url)
        total = $(document).height()
        position = $(window).scrollTop() + $(window).height()
        if position >= total && time > 5
            s = $('.tips').children('li').length
            #console.log(s)
            url = document.URL + '/tips/auto_load'
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
