{"filter":false,"title":"static_pages.coffee","tooltip":"/app/assets/javascripts/static_pages.coffee","undoManager":{"mark":18,"position":18,"stack":[[{"start":{"row":0,"column":0},"end":{"row":3,"column":0},"action":"remove","lines":["# Place all the behaviors and hooks related to the matching controller here.","# All this logic will automatically be available in application.js.","# You can use CoffeeScript in this file: http://coffeescript.org/",""],"id":2},{"start":{"row":0,"column":0},"end":{"row":38,"column":0},"action":"insert","lines":["# Place all the behaviors and hooks related to the matching controller here.","# All this logic will automatically be available in application.js.","# You can use CoffeeScript in this file: http://coffeescript.org/","$(window).scroll ->","    hoge = $('.profile')","    user_id = $('.profile').data('id')","    url = '/users/' + String(user_id)","    #console.log(url)","    if document.URL.match(url)","        total = $(document).height()","        position = $(window).scrollTop() + $(window).height()","        if position >= total && time > 5","            s = $('.tips').children('li').length + 20","            #console.log(s)","            url = document.URL + '/tips/auto_load'","            $.ajax(","                url: url,","                type: 'GET',","                data: {","                    num: s,","                    user_id: user_id","                }","            )","            timerReset()","    return","  ","time = 0","","timer  = () ->","    setInterval ->","        time++","    ,100","    return","    ","timerReset = () ->","    time = 0","","timer()",""]}],[{"start":{"row":8,"column":30},"end":{"row":9,"column":0},"action":"insert","lines":["",""],"id":3},{"start":{"row":9,"column":0},"end":{"row":9,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":9,"column":8},"end":{"row":11,"column":26},"action":"insert","lines":["url = window.location.protocol + '//' + location.hostname + '/users'","    #console.log(url)","    if document.URL == url"],"id":4}],[{"start":{"row":4,"column":0},"end":{"row":8,"column":30},"action":"remove","lines":["    hoge = $('.profile')","    user_id = $('.profile').data('id')","    url = '/users/' + String(user_id)","    #console.log(url)","    if document.URL.match(url)"],"id":5}],[{"start":{"row":4,"column":0},"end":{"row":5,"column":0},"action":"remove","lines":["",""],"id":6},{"start":{"row":4,"column":0},"end":{"row":4,"column":4},"action":"remove","lines":["    "]}],[{"start":{"row":5,"column":0},"end":{"row":5,"column":21},"action":"remove","lines":["    #console.log(url)"],"id":7},{"start":{"row":4,"column":72},"end":{"row":5,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":4,"column":70},"end":{"row":4,"column":71},"action":"remove","lines":["s"],"id":8},{"start":{"row":4,"column":69},"end":{"row":4,"column":70},"action":"remove","lines":["r"]},{"start":{"row":4,"column":68},"end":{"row":4,"column":69},"action":"remove","lines":["e"]},{"start":{"row":4,"column":67},"end":{"row":4,"column":68},"action":"remove","lines":["s"]},{"start":{"row":4,"column":66},"end":{"row":4,"column":67},"action":"remove","lines":["u"]}],[{"start":{"row":9,"column":52},"end":{"row":9,"column":53},"action":"remove","lines":["0"],"id":9},{"start":{"row":9,"column":51},"end":{"row":9,"column":52},"action":"remove","lines":["2"]},{"start":{"row":9,"column":50},"end":{"row":9,"column":51},"action":"remove","lines":[" "]},{"start":{"row":9,"column":49},"end":{"row":9,"column":50},"action":"remove","lines":["+"]},{"start":{"row":9,"column":48},"end":{"row":9,"column":49},"action":"remove","lines":[" "]}],[{"start":{"row":10,"column":26},"end":{"row":10,"column":27},"action":"remove","lines":[")"],"id":10},{"start":{"row":10,"column":25},"end":{"row":10,"column":26},"action":"remove","lines":["s"]},{"start":{"row":10,"column":24},"end":{"row":10,"column":25},"action":"remove","lines":["("]},{"start":{"row":10,"column":23},"end":{"row":10,"column":24},"action":"remove","lines":["g"]},{"start":{"row":10,"column":22},"end":{"row":10,"column":23},"action":"remove","lines":["o"]},{"start":{"row":10,"column":21},"end":{"row":10,"column":22},"action":"remove","lines":["l"]},{"start":{"row":10,"column":20},"end":{"row":10,"column":21},"action":"remove","lines":["."]},{"start":{"row":10,"column":19},"end":{"row":10,"column":20},"action":"remove","lines":["e"]},{"start":{"row":10,"column":18},"end":{"row":10,"column":19},"action":"remove","lines":["l"]},{"start":{"row":10,"column":17},"end":{"row":10,"column":18},"action":"remove","lines":["o"]},{"start":{"row":10,"column":16},"end":{"row":10,"column":17},"action":"remove","lines":["s"]}],[{"start":{"row":10,"column":15},"end":{"row":10,"column":16},"action":"remove","lines":["n"],"id":11},{"start":{"row":10,"column":14},"end":{"row":10,"column":15},"action":"remove","lines":["o"]},{"start":{"row":10,"column":13},"end":{"row":10,"column":14},"action":"remove","lines":["c"]},{"start":{"row":10,"column":12},"end":{"row":10,"column":13},"action":"remove","lines":["#"]},{"start":{"row":10,"column":8},"end":{"row":10,"column":12},"action":"remove","lines":["    "]},{"start":{"row":10,"column":4},"end":{"row":10,"column":8},"action":"remove","lines":["    "]},{"start":{"row":10,"column":0},"end":{"row":10,"column":4},"action":"remove","lines":["    "]},{"start":{"row":9,"column":48},"end":{"row":10,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":10,"column":39},"end":{"row":10,"column":40},"action":"remove","lines":["/"],"id":12},{"start":{"row":10,"column":38},"end":{"row":10,"column":39},"action":"remove","lines":["s"]},{"start":{"row":10,"column":37},"end":{"row":10,"column":38},"action":"remove","lines":["p"]},{"start":{"row":10,"column":36},"end":{"row":10,"column":37},"action":"remove","lines":["i"]},{"start":{"row":10,"column":35},"end":{"row":10,"column":36},"action":"remove","lines":["t"]}],[{"start":{"row":16,"column":35},"end":{"row":16,"column":36},"action":"remove","lines":["d"],"id":13},{"start":{"row":16,"column":34},"end":{"row":16,"column":35},"action":"remove","lines":["i"]},{"start":{"row":16,"column":33},"end":{"row":16,"column":34},"action":"remove","lines":["_"]},{"start":{"row":16,"column":32},"end":{"row":16,"column":33},"action":"remove","lines":["r"]},{"start":{"row":16,"column":31},"end":{"row":16,"column":32},"action":"remove","lines":["e"]},{"start":{"row":16,"column":30},"end":{"row":16,"column":31},"action":"remove","lines":["s"]},{"start":{"row":16,"column":29},"end":{"row":16,"column":30},"action":"remove","lines":["u"]},{"start":{"row":16,"column":28},"end":{"row":16,"column":29},"action":"remove","lines":[" "]},{"start":{"row":16,"column":27},"end":{"row":16,"column":28},"action":"remove","lines":[":"]},{"start":{"row":16,"column":26},"end":{"row":16,"column":27},"action":"remove","lines":["d"]},{"start":{"row":16,"column":25},"end":{"row":16,"column":26},"action":"remove","lines":["i"]},{"start":{"row":16,"column":24},"end":{"row":16,"column":25},"action":"remove","lines":["_"]},{"start":{"row":16,"column":23},"end":{"row":16,"column":24},"action":"remove","lines":["r"]},{"start":{"row":16,"column":22},"end":{"row":16,"column":23},"action":"remove","lines":["e"]},{"start":{"row":16,"column":21},"end":{"row":16,"column":22},"action":"remove","lines":["s"]},{"start":{"row":16,"column":20},"end":{"row":16,"column":21},"action":"remove","lines":["u"]},{"start":{"row":16,"column":16},"end":{"row":16,"column":20},"action":"remove","lines":["    "]},{"start":{"row":16,"column":12},"end":{"row":16,"column":16},"action":"remove","lines":["    "]},{"start":{"row":16,"column":8},"end":{"row":16,"column":12},"action":"remove","lines":["    "]}],[{"start":{"row":15,"column":26},"end":{"row":15,"column":27},"action":"remove","lines":[","],"id":16}],[{"start":{"row":16,"column":4},"end":{"row":16,"column":8},"action":"remove","lines":["    "],"id":17},{"start":{"row":16,"column":0},"end":{"row":16,"column":4},"action":"remove","lines":["    "]},{"start":{"row":15,"column":26},"end":{"row":16,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":15,"column":26},"end":{"row":15,"column":27},"action":"insert","lines":[","],"id":18}],[{"start":{"row":15,"column":27},"end":{"row":16,"column":0},"action":"insert","lines":["",""],"id":19},{"start":{"row":16,"column":0},"end":{"row":16,"column":20},"action":"insert","lines":["                    "]}],[{"start":{"row":16,"column":20},"end":{"row":16,"column":36},"action":"insert","lines":["user_id: user_id"],"id":20}],[{"start":{"row":4,"column":67},"end":{"row":5,"column":0},"action":"insert","lines":["",""],"id":21},{"start":{"row":5,"column":0},"end":{"row":5,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":5,"column":4},"end":{"row":5,"column":38},"action":"insert","lines":["user_id = $('.profile').data('id')"],"id":22}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":7,"column":36},"end":{"row":7,"column":36},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1598000276389,"hash":"244d4c113eb14ec8ea8d78897054ce947af13030"}