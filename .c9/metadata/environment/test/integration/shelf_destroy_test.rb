{"changed":true,"filter":false,"title":"shelf_destroy_test.rb","tooltip":"/test/integration/shelf_destroy_test.rb","value":"require 'test_helper'\n\nclass ShelfDestroyTest < ActionDispatch::IntegrationTest\n\n    def setup\n        @user = users(:michael)\n        @other = users(:archer)\n        @shelf = @user.shelves.find_by(name: \"shelf_1\")\n        @tips = @user.tips.where(shelf_id: @shelf.id)\n    end\n    \n    test \"un successful destroy shelf by other user\" do\n        log_in_as(@other)\n        get edit_user_shelf_path(@user,@shelf)\n        assert_no_difference 'Shelf.count' do\n            delete user_shelf_path(@user,@shelf) \n        end\n        assert_redirected_to root_path\n    end\n    \n    test \"successful destroy shelf\" do\n        log_in_as(@user)\n        get edit_user_shelf_path(@user,@shelf)\n        assert_difference 'Shelf.count', -1 do\n            assert_difference '@tips.count', - @tips.count do\n                delete user_shelf_path(@user,@shelf) \n            end\n        end\n        \n        assert_not flash.empty?\n        assert_redirected_to @user\n        get user_path(@user)\n    end\n    \nend\n","undoManager":{"mark":-2,"position":100,"stack":[[{"start":{"row":10,"column":45},"end":{"row":10,"column":46},"action":"insert","lines":["r"],"id":15}],[{"start":{"row":10,"column":46},"end":{"row":10,"column":47},"action":"insert","lines":[" "],"id":16},{"start":{"row":10,"column":47},"end":{"row":10,"column":48},"action":"insert","lines":["u"]},{"start":{"row":10,"column":48},"end":{"row":10,"column":49},"action":"insert","lines":["s"]},{"start":{"row":10,"column":49},"end":{"row":10,"column":50},"action":"insert","lines":["e"]},{"start":{"row":10,"column":50},"end":{"row":10,"column":51},"action":"insert","lines":["r"]}],[{"start":{"row":5,"column":31},"end":{"row":6,"column":0},"action":"insert","lines":["",""],"id":17},{"start":{"row":6,"column":0},"end":{"row":6,"column":8},"action":"insert","lines":["        "]},{"start":{"row":6,"column":8},"end":{"row":6,"column":9},"action":"insert","lines":["@"]},{"start":{"row":6,"column":9},"end":{"row":6,"column":10},"action":"insert","lines":["u"]}],[{"start":{"row":6,"column":9},"end":{"row":6,"column":10},"action":"remove","lines":["u"],"id":18},{"start":{"row":6,"column":8},"end":{"row":6,"column":9},"action":"remove","lines":["@"]}],[{"start":{"row":6,"column":8},"end":{"row":6,"column":9},"action":"insert","lines":["@"],"id":19},{"start":{"row":6,"column":9},"end":{"row":6,"column":10},"action":"insert","lines":["o"]},{"start":{"row":6,"column":10},"end":{"row":6,"column":11},"action":"insert","lines":["t"]},{"start":{"row":6,"column":11},"end":{"row":6,"column":12},"action":"insert","lines":["h"]},{"start":{"row":6,"column":12},"end":{"row":6,"column":13},"action":"insert","lines":["e"]},{"start":{"row":6,"column":13},"end":{"row":6,"column":14},"action":"insert","lines":["r"]}],[{"start":{"row":6,"column":14},"end":{"row":6,"column":15},"action":"insert","lines":[" "],"id":20},{"start":{"row":6,"column":15},"end":{"row":6,"column":16},"action":"insert","lines":["="]}],[{"start":{"row":6,"column":16},"end":{"row":6,"column":17},"action":"insert","lines":[" "],"id":21},{"start":{"row":6,"column":17},"end":{"row":6,"column":18},"action":"insert","lines":["u"]},{"start":{"row":6,"column":18},"end":{"row":6,"column":19},"action":"insert","lines":["s"]},{"start":{"row":6,"column":19},"end":{"row":6,"column":20},"action":"insert","lines":["e"]},{"start":{"row":6,"column":20},"end":{"row":6,"column":21},"action":"insert","lines":["r"]},{"start":{"row":6,"column":21},"end":{"row":6,"column":22},"action":"insert","lines":["s"]}],[{"start":{"row":6,"column":17},"end":{"row":6,"column":22},"action":"remove","lines":["users"],"id":22},{"start":{"row":6,"column":17},"end":{"row":6,"column":22},"action":"insert","lines":["users"]}],[{"start":{"row":6,"column":22},"end":{"row":6,"column":24},"action":"insert","lines":["()"],"id":23}],[{"start":{"row":6,"column":23},"end":{"row":6,"column":24},"action":"insert","lines":[":"],"id":24},{"start":{"row":6,"column":24},"end":{"row":6,"column":25},"action":"insert","lines":["a"]},{"start":{"row":6,"column":25},"end":{"row":6,"column":26},"action":"insert","lines":["r"]}],[{"start":{"row":6,"column":26},"end":{"row":6,"column":27},"action":"insert","lines":["c"],"id":25},{"start":{"row":6,"column":27},"end":{"row":6,"column":28},"action":"insert","lines":["h"]},{"start":{"row":6,"column":28},"end":{"row":6,"column":29},"action":"insert","lines":["e"]},{"start":{"row":6,"column":29},"end":{"row":6,"column":30},"action":"insert","lines":["r"]}],[{"start":{"row":13,"column":0},"end":{"row":13,"column":17},"action":"remove","lines":["        name = \"\""],"id":26},{"start":{"row":12,"column":46},"end":{"row":13,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":8,"column":8},"end":{"row":8,"column":24},"action":"remove","lines":["log_in_as(@user)"],"id":27}],[{"start":{"row":11,"column":55},"end":{"row":12,"column":0},"action":"insert","lines":["",""],"id":28},{"start":{"row":12,"column":0},"end":{"row":12,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":12,"column":8},"end":{"row":12,"column":24},"action":"insert","lines":["log_in_as(@user)"],"id":29}],[{"start":{"row":12,"column":21},"end":{"row":12,"column":22},"action":"remove","lines":["e"],"id":30},{"start":{"row":12,"column":20},"end":{"row":12,"column":21},"action":"remove","lines":["s"]},{"start":{"row":12,"column":19},"end":{"row":12,"column":20},"action":"remove","lines":["u"]}],[{"start":{"row":12,"column":19},"end":{"row":12,"column":20},"action":"insert","lines":["o"],"id":31},{"start":{"row":12,"column":20},"end":{"row":12,"column":21},"action":"insert","lines":["t"]},{"start":{"row":12,"column":21},"end":{"row":12,"column":22},"action":"insert","lines":["h"]},{"start":{"row":12,"column":22},"end":{"row":12,"column":23},"action":"insert","lines":["e"]},{"start":{"row":12,"column":23},"end":{"row":12,"column":24},"action":"insert","lines":["r"]}],[{"start":{"row":12,"column":24},"end":{"row":12,"column":25},"action":"remove","lines":["r"],"id":32}],[{"start":{"row":15,"column":17},"end":{"row":15,"column":18},"action":"remove","lines":[" "],"id":33},{"start":{"row":15,"column":17},"end":{"row":16,"column":0},"action":"insert","lines":["",""]},{"start":{"row":16,"column":0},"end":{"row":16,"column":12},"action":"insert","lines":["            "]}],[{"start":{"row":16,"column":8},"end":{"row":16,"column":12},"action":"remove","lines":["    "],"id":34},{"start":{"row":16,"column":4},"end":{"row":16,"column":8},"action":"remove","lines":["    "]},{"start":{"row":16,"column":0},"end":{"row":16,"column":4},"action":"remove","lines":["    "]},{"start":{"row":15,"column":17},"end":{"row":16,"column":0},"action":"remove","lines":["",""]},{"start":{"row":15,"column":16},"end":{"row":15,"column":17},"action":"remove","lines":["h"]},{"start":{"row":15,"column":15},"end":{"row":15,"column":16},"action":"remove","lines":["c"]},{"start":{"row":15,"column":14},"end":{"row":15,"column":15},"action":"remove","lines":["t"]},{"start":{"row":15,"column":13},"end":{"row":15,"column":14},"action":"remove","lines":["a"]},{"start":{"row":15,"column":12},"end":{"row":15,"column":13},"action":"remove","lines":["p"]}],[{"start":{"row":15,"column":12},"end":{"row":15,"column":13},"action":"insert","lines":["d"],"id":35},{"start":{"row":15,"column":13},"end":{"row":15,"column":14},"action":"insert","lines":["e"]},{"start":{"row":15,"column":14},"end":{"row":15,"column":15},"action":"insert","lines":["l"]},{"start":{"row":15,"column":15},"end":{"row":15,"column":16},"action":"insert","lines":["e"]},{"start":{"row":15,"column":16},"end":{"row":15,"column":17},"action":"insert","lines":["t"]},{"start":{"row":15,"column":17},"end":{"row":15,"column":18},"action":"insert","lines":["e"]}],[{"start":{"row":15,"column":18},"end":{"row":15,"column":19},"action":"insert","lines":[" "],"id":36}],[{"start":{"row":13,"column":16},"end":{"row":13,"column":17},"action":"remove","lines":["_"],"id":37},{"start":{"row":13,"column":15},"end":{"row":13,"column":16},"action":"remove","lines":["t"]},{"start":{"row":13,"column":14},"end":{"row":13,"column":15},"action":"remove","lines":["i"]},{"start":{"row":13,"column":13},"end":{"row":13,"column":14},"action":"remove","lines":["d"]},{"start":{"row":13,"column":12},"end":{"row":13,"column":13},"action":"remove","lines":["e"]}],[{"start":{"row":15,"column":49},"end":{"row":15,"column":83},"action":"remove","lines":[", params: { shelf:{name: name}   }"],"id":38}],[{"start":{"row":19,"column":7},"end":{"row":20,"column":0},"action":"insert","lines":["",""],"id":39},{"start":{"row":20,"column":0},"end":{"row":20,"column":4},"action":"insert","lines":["    "]},{"start":{"row":20,"column":4},"end":{"row":21,"column":0},"action":"insert","lines":["",""]},{"start":{"row":21,"column":0},"end":{"row":21,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":17,"column":8},"end":{"row":18,"column":45},"action":"remove","lines":["assert_template 'shelves/edit'","        assert_select 'div#error_explanation'"],"id":40},{"start":{"row":17,"column":8},"end":{"row":17,"column":38},"action":"insert","lines":["assert_redirected_to root_path"]}],[{"start":{"row":20,"column":4},"end":{"row":21,"column":0},"action":"insert","lines":["",""],"id":41},{"start":{"row":21,"column":0},"end":{"row":21,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":20,"column":4},"end":{"row":27,"column":7},"action":"insert","lines":["test \"un successful destroy shelf by other user\" do","        log_in_as(@other)","        get user_shelf_path(@user,@shelf)","        assert_no_difference 'Shelf.count' do","            delete user_shelf_path(@user,@shelf) ","        end","        assert_redirected_to root_path","    end"],"id":42}],[{"start":{"row":21,"column":19},"end":{"row":21,"column":24},"action":"remove","lines":["other"],"id":43},{"start":{"row":21,"column":19},"end":{"row":21,"column":20},"action":"insert","lines":["u"]},{"start":{"row":21,"column":20},"end":{"row":21,"column":21},"action":"insert","lines":["s"]},{"start":{"row":21,"column":21},"end":{"row":21,"column":22},"action":"insert","lines":["e"]},{"start":{"row":21,"column":22},"end":{"row":21,"column":23},"action":"insert","lines":["r"]}],[{"start":{"row":13,"column":12},"end":{"row":13,"column":13},"action":"insert","lines":["e"],"id":44},{"start":{"row":13,"column":13},"end":{"row":13,"column":14},"action":"insert","lines":["d"]},{"start":{"row":13,"column":14},"end":{"row":13,"column":15},"action":"insert","lines":["i"]},{"start":{"row":13,"column":15},"end":{"row":13,"column":16},"action":"insert","lines":["t"]},{"start":{"row":13,"column":16},"end":{"row":13,"column":17},"action":"insert","lines":["_"]}],[{"start":{"row":22,"column":12},"end":{"row":22,"column":13},"action":"insert","lines":["e"],"id":45},{"start":{"row":22,"column":13},"end":{"row":22,"column":14},"action":"insert","lines":["d"]},{"start":{"row":22,"column":14},"end":{"row":22,"column":15},"action":"insert","lines":["i"]},{"start":{"row":22,"column":15},"end":{"row":22,"column":16},"action":"insert","lines":["t"]},{"start":{"row":22,"column":16},"end":{"row":22,"column":17},"action":"insert","lines":["_"]}],[{"start":{"row":20,"column":12},"end":{"row":20,"column":13},"action":"remove","lines":[" "],"id":46}],[{"start":{"row":20,"column":11},"end":{"row":20,"column":12},"action":"remove","lines":["n"],"id":47}],[{"start":{"row":20,"column":10},"end":{"row":20,"column":11},"action":"remove","lines":["u"],"id":48}],[{"start":{"row":20,"column":34},"end":{"row":20,"column":48},"action":"remove","lines":[" by other user"],"id":49}],[{"start":{"row":23,"column":17},"end":{"row":23,"column":18},"action":"remove","lines":["_"],"id":50}],[{"start":{"row":23,"column":16},"end":{"row":23,"column":17},"action":"remove","lines":["o"],"id":51}],[{"start":{"row":23,"column":15},"end":{"row":23,"column":16},"action":"remove","lines":["n"],"id":52}],[{"start":{"row":23,"column":39},"end":{"row":23,"column":40},"action":"insert","lines":[","],"id":53}],[{"start":{"row":23,"column":40},"end":{"row":23,"column":41},"action":"insert","lines":[" "],"id":54},{"start":{"row":23,"column":41},"end":{"row":23,"column":42},"action":"insert","lines":["-"]},{"start":{"row":23,"column":42},"end":{"row":23,"column":43},"action":"insert","lines":["1"]}],[{"start":{"row":25,"column":11},"end":{"row":26,"column":38},"action":"remove","lines":["","        assert_redirected_to root_path"],"id":55}],[{"start":{"row":25,"column":11},"end":{"row":26,"column":0},"action":"insert","lines":["",""],"id":56},{"start":{"row":26,"column":0},"end":{"row":26,"column":8},"action":"insert","lines":["        "]},{"start":{"row":26,"column":8},"end":{"row":27,"column":0},"action":"insert","lines":["",""]},{"start":{"row":27,"column":0},"end":{"row":27,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":27,"column":8},"end":{"row":30,"column":28},"action":"insert","lines":["assert_not flash.empty?","        assert_redirected_to @user","        active_tips_count = @user.tips.where(delete_flg: false).count","        get user_path(@user)"],"id":57}],[{"start":{"row":22,"column":46},"end":{"row":23,"column":0},"action":"insert","lines":["",""],"id":58},{"start":{"row":23,"column":0},"end":{"row":23,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":23,"column":8},"end":{"row":23,"column":9},"action":"insert","lines":["@"],"id":59}],[{"start":{"row":23,"column":8},"end":{"row":23,"column":9},"action":"remove","lines":["@"],"id":60},{"start":{"row":23,"column":4},"end":{"row":23,"column":8},"action":"remove","lines":["    "]},{"start":{"row":23,"column":0},"end":{"row":23,"column":4},"action":"remove","lines":["    "]},{"start":{"row":22,"column":46},"end":{"row":23,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":6,"column":31},"end":{"row":7,"column":0},"action":"insert","lines":["",""],"id":61},{"start":{"row":7,"column":0},"end":{"row":7,"column":8},"action":"insert","lines":["        "]},{"start":{"row":7,"column":8},"end":{"row":7,"column":9},"action":"insert","lines":["@"]},{"start":{"row":7,"column":9},"end":{"row":7,"column":10},"action":"insert","lines":["t"]},{"start":{"row":7,"column":10},"end":{"row":7,"column":11},"action":"insert","lines":["i"]},{"start":{"row":7,"column":11},"end":{"row":7,"column":12},"action":"insert","lines":["p"]},{"start":{"row":7,"column":12},"end":{"row":7,"column":13},"action":"insert","lines":["s"]}],[{"start":{"row":7,"column":13},"end":{"row":7,"column":14},"action":"insert","lines":[" "],"id":62},{"start":{"row":7,"column":14},"end":{"row":7,"column":15},"action":"insert","lines":["="]}],[{"start":{"row":7,"column":15},"end":{"row":7,"column":16},"action":"insert","lines":[" "],"id":63},{"start":{"row":7,"column":16},"end":{"row":7,"column":17},"action":"insert","lines":["@"]}],[{"start":{"row":7,"column":17},"end":{"row":7,"column":18},"action":"insert","lines":["u"],"id":64},{"start":{"row":7,"column":18},"end":{"row":7,"column":19},"action":"insert","lines":["s"]},{"start":{"row":7,"column":19},"end":{"row":7,"column":20},"action":"insert","lines":["e"]},{"start":{"row":7,"column":20},"end":{"row":7,"column":21},"action":"insert","lines":["r"]},{"start":{"row":7,"column":21},"end":{"row":7,"column":22},"action":"insert","lines":["."]}],[{"start":{"row":7,"column":22},"end":{"row":7,"column":23},"action":"insert","lines":["t"],"id":65},{"start":{"row":7,"column":23},"end":{"row":7,"column":24},"action":"insert","lines":["i"]},{"start":{"row":7,"column":24},"end":{"row":7,"column":25},"action":"insert","lines":["s"]}],[{"start":{"row":7,"column":24},"end":{"row":7,"column":25},"action":"remove","lines":["s"],"id":66}],[{"start":{"row":7,"column":24},"end":{"row":7,"column":25},"action":"insert","lines":["p"],"id":67},{"start":{"row":7,"column":25},"end":{"row":7,"column":26},"action":"insert","lines":["s"]}],[{"start":{"row":7,"column":26},"end":{"row":7,"column":28},"action":"insert","lines":["()"],"id":68}],[{"start":{"row":7,"column":27},"end":{"row":7,"column":28},"action":"insert","lines":["@"],"id":69}],[{"start":{"row":7,"column":27},"end":{"row":7,"column":28},"action":"remove","lines":["@"],"id":70}],[{"start":{"row":7,"column":27},"end":{"row":7,"column":28},"action":"remove","lines":[")"],"id":71},{"start":{"row":7,"column":26},"end":{"row":7,"column":27},"action":"remove","lines":["("]}],[{"start":{"row":7,"column":26},"end":{"row":7,"column":27},"action":"insert","lines":["."],"id":72},{"start":{"row":7,"column":27},"end":{"row":7,"column":28},"action":"insert","lines":["w"]},{"start":{"row":7,"column":28},"end":{"row":7,"column":29},"action":"insert","lines":["h"]},{"start":{"row":7,"column":29},"end":{"row":7,"column":30},"action":"insert","lines":["e"]},{"start":{"row":7,"column":30},"end":{"row":7,"column":31},"action":"insert","lines":["r"]},{"start":{"row":7,"column":31},"end":{"row":7,"column":32},"action":"insert","lines":["e"]}],[{"start":{"row":7,"column":32},"end":{"row":7,"column":34},"action":"insert","lines":["()"],"id":73}],[{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"insert","lines":["n"],"id":74},{"start":{"row":7,"column":34},"end":{"row":7,"column":35},"action":"insert","lines":["a"]},{"start":{"row":7,"column":35},"end":{"row":7,"column":36},"action":"insert","lines":["m"]},{"start":{"row":7,"column":36},"end":{"row":7,"column":37},"action":"insert","lines":["e"]},{"start":{"row":7,"column":37},"end":{"row":7,"column":38},"action":"insert","lines":[":"]}],[{"start":{"row":7,"column":37},"end":{"row":7,"column":38},"action":"remove","lines":[":"],"id":75},{"start":{"row":7,"column":36},"end":{"row":7,"column":37},"action":"remove","lines":["e"]},{"start":{"row":7,"column":35},"end":{"row":7,"column":36},"action":"remove","lines":["m"]},{"start":{"row":7,"column":34},"end":{"row":7,"column":35},"action":"remove","lines":["a"]},{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"remove","lines":["n"]}],[{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"insert","lines":["i"],"id":76},{"start":{"row":7,"column":34},"end":{"row":7,"column":35},"action":"insert","lines":["d"]}],[{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"insert","lines":["s"],"id":77},{"start":{"row":7,"column":34},"end":{"row":7,"column":35},"action":"insert","lines":["h"]},{"start":{"row":7,"column":35},"end":{"row":7,"column":36},"action":"insert","lines":["e"]},{"start":{"row":7,"column":36},"end":{"row":7,"column":37},"action":"insert","lines":["l"]},{"start":{"row":7,"column":37},"end":{"row":7,"column":38},"action":"insert","lines":["f"]},{"start":{"row":7,"column":38},"end":{"row":7,"column":39},"action":"insert","lines":["_"]}],[{"start":{"row":7,"column":41},"end":{"row":7,"column":42},"action":"insert","lines":[" "],"id":78}],[{"start":{"row":7,"column":41},"end":{"row":7,"column":42},"action":"remove","lines":[" "],"id":79}],[{"start":{"row":7,"column":41},"end":{"row":7,"column":42},"action":"insert","lines":[":"],"id":80}],[{"start":{"row":7,"column":42},"end":{"row":7,"column":43},"action":"insert","lines":[" "],"id":81},{"start":{"row":7,"column":43},"end":{"row":7,"column":44},"action":"insert","lines":["@"]},{"start":{"row":7,"column":44},"end":{"row":7,"column":45},"action":"insert","lines":["s"]}],[{"start":{"row":7,"column":45},"end":{"row":7,"column":46},"action":"insert","lines":["h"],"id":82},{"start":{"row":7,"column":46},"end":{"row":7,"column":47},"action":"insert","lines":["e"]},{"start":{"row":7,"column":47},"end":{"row":7,"column":48},"action":"insert","lines":["l"]},{"start":{"row":7,"column":48},"end":{"row":7,"column":49},"action":"insert","lines":["f"]},{"start":{"row":7,"column":49},"end":{"row":7,"column":50},"action":"insert","lines":["."]},{"start":{"row":7,"column":50},"end":{"row":7,"column":51},"action":"insert","lines":["i"]}],[{"start":{"row":7,"column":51},"end":{"row":7,"column":52},"action":"insert","lines":["d"],"id":83}],[{"start":{"row":7,"column":0},"end":{"row":8,"column":0},"action":"remove","lines":["        @tips = @user.tips.where(shelf_id: @shelf.id)",""],"id":84},{"start":{"row":8,"column":0},"end":{"row":9,"column":0},"action":"insert","lines":["        @tips = @user.tips.where(shelf_id: @shelf.id)",""]}],[{"start":{"row":9,"column":4},"end":{"row":9,"column":8},"action":"remove","lines":["    "],"id":85},{"start":{"row":9,"column":0},"end":{"row":9,"column":4},"action":"remove","lines":["    "]},{"start":{"row":8,"column":53},"end":{"row":9,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":23,"column":46},"end":{"row":24,"column":0},"action":"insert","lines":["",""],"id":86},{"start":{"row":24,"column":0},"end":{"row":24,"column":12},"action":"insert","lines":["            "]}],[{"start":{"row":24,"column":0},"end":{"row":25,"column":0},"action":"insert","lines":["        assert_difference 'Shelf.count', -1 do",""],"id":87}],[{"start":{"row":28,"column":0},"end":{"row":29,"column":0},"action":"insert","lines":["        end",""],"id":88}],[{"start":{"row":27,"column":8},"end":{"row":27,"column":12},"action":"insert","lines":["    "],"id":89}],[{"start":{"row":24,"column":8},"end":{"row":24,"column":12},"action":"insert","lines":["    "],"id":90}],[{"start":{"row":26,"column":12},"end":{"row":26,"column":16},"action":"insert","lines":["    "],"id":91}],[{"start":{"row":25,"column":12},"end":{"row":25,"column":16},"action":"insert","lines":["    "],"id":92}],[{"start":{"row":26,"column":0},"end":{"row":27,"column":0},"action":"remove","lines":["                delete user_shelf_path(@user,@shelf) ",""],"id":93},{"start":{"row":25,"column":0},"end":{"row":26,"column":0},"action":"insert","lines":["                delete user_shelf_path(@user,@shelf) ",""]}],[{"start":{"row":26,"column":12},"end":{"row":26,"column":16},"action":"remove","lines":["    "],"id":94},{"start":{"row":26,"column":8},"end":{"row":26,"column":12},"action":"remove","lines":["    "]},{"start":{"row":26,"column":4},"end":{"row":26,"column":8},"action":"remove","lines":["    "]},{"start":{"row":26,"column":0},"end":{"row":26,"column":4},"action":"remove","lines":["    "]},{"start":{"row":25,"column":53},"end":{"row":26,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":24,"column":31},"end":{"row":24,"column":36},"action":"remove","lines":["Shelf"],"id":95},{"start":{"row":24,"column":31},"end":{"row":24,"column":32},"action":"insert","lines":["t"]},{"start":{"row":24,"column":32},"end":{"row":24,"column":33},"action":"insert","lines":["i"]},{"start":{"row":24,"column":33},"end":{"row":24,"column":34},"action":"insert","lines":["p"]},{"start":{"row":24,"column":34},"end":{"row":24,"column":35},"action":"insert","lines":["s"]}],[{"start":{"row":24,"column":35},"end":{"row":24,"column":36},"action":"remove","lines":["."],"id":96},{"start":{"row":24,"column":34},"end":{"row":24,"column":35},"action":"remove","lines":["s"]},{"start":{"row":24,"column":33},"end":{"row":24,"column":34},"action":"remove","lines":["p"]},{"start":{"row":24,"column":32},"end":{"row":24,"column":33},"action":"remove","lines":["i"]},{"start":{"row":24,"column":31},"end":{"row":24,"column":32},"action":"remove","lines":["t"]}],[{"start":{"row":24,"column":31},"end":{"row":24,"column":32},"action":"insert","lines":["@"],"id":97},{"start":{"row":24,"column":32},"end":{"row":24,"column":33},"action":"insert","lines":["t"]},{"start":{"row":24,"column":33},"end":{"row":24,"column":34},"action":"insert","lines":["i"]},{"start":{"row":24,"column":34},"end":{"row":24,"column":35},"action":"insert","lines":["p"]},{"start":{"row":24,"column":35},"end":{"row":24,"column":36},"action":"insert","lines":["s"]}],[{"start":{"row":24,"column":36},"end":{"row":24,"column":37},"action":"insert","lines":["."],"id":98}],[{"start":{"row":24,"column":46},"end":{"row":24,"column":47},"action":"remove","lines":["1"],"id":99},{"start":{"row":24,"column":45},"end":{"row":24,"column":46},"action":"remove","lines":["-"]}],[{"start":{"row":24,"column":45},"end":{"row":24,"column":46},"action":"insert","lines":["@"],"id":100},{"start":{"row":24,"column":46},"end":{"row":24,"column":47},"action":"insert","lines":["t"]},{"start":{"row":24,"column":47},"end":{"row":24,"column":48},"action":"insert","lines":["i"]},{"start":{"row":24,"column":48},"end":{"row":24,"column":49},"action":"insert","lines":["p"]},{"start":{"row":24,"column":49},"end":{"row":24,"column":50},"action":"insert","lines":["s"]},{"start":{"row":24,"column":50},"end":{"row":24,"column":51},"action":"insert","lines":["."]},{"start":{"row":24,"column":51},"end":{"row":24,"column":52},"action":"insert","lines":["c"]}],[{"start":{"row":24,"column":52},"end":{"row":24,"column":53},"action":"insert","lines":["o"],"id":101},{"start":{"row":24,"column":53},"end":{"row":24,"column":54},"action":"insert","lines":["u"]},{"start":{"row":24,"column":54},"end":{"row":24,"column":55},"action":"insert","lines":["n"]},{"start":{"row":24,"column":55},"end":{"row":24,"column":56},"action":"insert","lines":["t"]}],[{"start":{"row":24,"column":45},"end":{"row":24,"column":46},"action":"insert","lines":["-"],"id":102}],[{"start":{"row":24,"column":46},"end":{"row":24,"column":47},"action":"insert","lines":[" "],"id":103}],[{"start":{"row":24,"column":46},"end":{"row":24,"column":47},"action":"remove","lines":[" "],"id":104}],[{"start":{"row":24,"column":45},"end":{"row":24,"column":46},"action":"remove","lines":["-"],"id":105}],[{"start":{"row":22,"column":46},"end":{"row":23,"column":0},"action":"insert","lines":["",""],"id":106},{"start":{"row":23,"column":0},"end":{"row":23,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":23,"column":8},"end":{"row":23,"column":9},"action":"insert","lines":["u"],"id":107}],[{"start":{"row":23,"column":8},"end":{"row":23,"column":9},"action":"remove","lines":["u"],"id":108}],[{"start":{"row":23,"column":8},"end":{"row":23,"column":9},"action":"insert","lines":["n"],"id":109},{"start":{"row":23,"column":9},"end":{"row":23,"column":10},"action":"insert","lines":["u"]},{"start":{"row":23,"column":10},"end":{"row":23,"column":11},"action":"insert","lines":["m"]},{"start":{"row":23,"column":11},"end":{"row":23,"column":12},"action":"insert","lines":["_"]}],[{"start":{"row":23,"column":11},"end":{"row":23,"column":12},"action":"remove","lines":["_"],"id":110},{"start":{"row":23,"column":10},"end":{"row":23,"column":11},"action":"remove","lines":["m"]},{"start":{"row":23,"column":9},"end":{"row":23,"column":10},"action":"remove","lines":["u"]},{"start":{"row":23,"column":8},"end":{"row":23,"column":9},"action":"remove","lines":["n"]}],[{"start":{"row":23,"column":8},"end":{"row":23,"column":9},"action":"insert","lines":["c"],"id":111},{"start":{"row":23,"column":9},"end":{"row":23,"column":10},"action":"insert","lines":["o"]},{"start":{"row":23,"column":10},"end":{"row":23,"column":11},"action":"insert","lines":["u"]},{"start":{"row":23,"column":11},"end":{"row":23,"column":12},"action":"insert","lines":["n"]},{"start":{"row":23,"column":12},"end":{"row":23,"column":13},"action":"insert","lines":["t"]}],[{"start":{"row":23,"column":12},"end":{"row":23,"column":13},"action":"remove","lines":["t"],"id":112},{"start":{"row":23,"column":11},"end":{"row":23,"column":12},"action":"remove","lines":["n"]},{"start":{"row":23,"column":10},"end":{"row":23,"column":11},"action":"remove","lines":["u"]},{"start":{"row":23,"column":9},"end":{"row":23,"column":10},"action":"remove","lines":["o"]},{"start":{"row":23,"column":8},"end":{"row":23,"column":9},"action":"remove","lines":["c"]},{"start":{"row":23,"column":4},"end":{"row":23,"column":8},"action":"remove","lines":["    "]},{"start":{"row":23,"column":0},"end":{"row":23,"column":4},"action":"remove","lines":["    "]},{"start":{"row":22,"column":46},"end":{"row":23,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":24,"column":45},"end":{"row":24,"column":46},"action":"insert","lines":["-"],"id":113}],[{"start":{"row":24,"column":46},"end":{"row":24,"column":47},"action":"insert","lines":[" "],"id":114}],[{"start":{"row":30,"column":34},"end":{"row":31,"column":69},"action":"remove","lines":["","        active_tips_count = @user.tips.where(delete_flg: false).count"],"id":115}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":12,"column":25},"end":{"row":12,"column":25},"isBackwards":false},"options":{"tabSize":4,"useSoftTabs":true,"guessTabSize":false,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1606226211581}
