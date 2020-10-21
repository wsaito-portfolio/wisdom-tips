# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#ajaxでuser、tipの情報を取得する。
$(window).scroll ->
    total = $(document).height()
    position = $(window).scrollTop() + $(window).height()
    if position >= total && time > 5
        user_id = $('.profile').data('id')
        url_users = window.location.protocol + '//' + location.hostname + '/users'
        url_tips = window.location.protocol + '//' + location.hostname + '/users/' + String(user_id)
        url_search = window.location.protocol + '//' + location.hostname + '/search'
        if document.URL == url_users
            s = $('.users').children('li').length
            console.log(s)
            $.ajax(
                url: '/users/auto_load',
                type: 'GET',
                data: num: s
            )
            timerReset()
        else if document.URL == url_tips
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
        else if document.URL.match(url_search)
            search_focus = $('.search_focus')[0].value
            search_word = $('.search_field')[1].dataset['searchWord']
            if search_focus == "tips"
                url = url_search +  '/auto_load_tips'
                s = $('.tips').children('li').length
                console.log(s)
                $.ajax(
                    url: url,
                    type: 'GET',
                    data: {
                        num: s,
                        search: search_word
                    }
                )
                timerReset()
            else if search_focus == "users"
                url = url_search + '/auto_load_users'
                s = $('.users').children('li').length
                console.log(s)
                $.ajax(
                    url: url,
                    type: 'GET',
                    data: {
                        num: s,
                        search: search_word
                    }
                )
                timerReset()
        return

#検索時にフォーカスしているタブを保存する
$ ->
    $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
        $('.search_focus')[0].value = e.target.dataset.value
        return
  
time = 0

timer  = () ->
    setInterval ->
        time++
    ,500
    return
    
timerReset = () ->
    time = 0

timer()

$(window).on 'load', ->
    if $('div').hasClass 'alert-activate'
        url = window.location.protocol + '//' + location.hostname + '/account_activations/tutorial'
        s = 'active'
        console.log(url)
        $.ajax(
            url: url,
            type: 'GET',
            data: ''
                ).done (response) ->
            $('#modal1').modal
                backdrop: false
            console.log($('#modal1'))
            
            changeModal = (beforeModal, afterModal) ->
                    $('#' + beforeModal).modal 'hide'
                    $('#' + afterModal).modal
                        backdrop: false
                    return
            
            $('.modal_switch').on 'click', ->
                    after = $(this).attr('data-target')
                    before = $(this).attr('data-source')
                    changeModal before, after
                return
    return
    
