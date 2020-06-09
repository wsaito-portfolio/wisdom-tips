{"filter":false,"title":"schema.rb","tooltip":"/db/schema.rb","undoManager":{"mark":0,"position":0,"stack":[[{"start":{"row":14,"column":16},"end":{"row":40,"column":67},"action":"remove","lines":["microposts\", force: :cascade do |t|","    t.text \"content\"","    t.integer \"user_id\"","    t.datetime \"created_at\", null: false","    t.datetime \"updated_at\", null: false","    t.string \"picture\"","    t.index [\"user_id\", \"created_at\"], name: \"index_microposts_on_user_id_and_created_at\"","    t.index [\"user_id\"], name: \"index_microposts_on_user_id\"","  end","","  create_table \"reasons\", force: :cascade do |t|","    t.string \"content\"","    t.integer \"tip_id\"","    t.datetime \"created_at\", null: false","    t.datetime \"updated_at\", null: false","    t.index [\"tip_id\", \"created_at\"], name: \"index_reasons_on_tip_id_and_created_at\"","    t.index [\"tip_id\"], name: \"index_reasons_on_tip_id\"","  end","","  create_table \"relationships\", force: :cascade do |t|","    t.integer \"follower_id\"","    t.integer \"followed_id\"","    t.datetime \"created_at\", null: false","    t.datetime \"updated_at\", null: false","    t.index [\"followed_id\"], name: \"index_relationships_on_followed_id\"","    t.index [\"follower_id\", \"followed_id\"], name: \"index_relationships_on_follower_id_and_followed_id\", unique: true","    t.index [\"follower_id\"], name: \"index_relationships_on_follower"],"id":2,"ignore":true},{"start":{"row":14,"column":16},"end":{"row":20,"column":51},"action":"insert","lines":["reasons\", force: :cascade do |t|","    t.string \"content\"","    t.integer \"tip_id\"","    t.datetime \"created_at\", null: false","    t.datetime \"updated_at\", null: false","    t.index [\"tip_id\", \"created_at\"], name: \"index_reasons_on_tip_id_and_created_at\"","    t.index [\"tip_id\"], name: \"index_reasons_on_tip"]},{"start":{"row":25,"column":0},"end":{"row":26,"column":0},"action":"insert","lines":["    t.integer \"user_id\"",""]},{"start":{"row":28,"column":0},"end":{"row":29,"column":0},"action":"insert","lines":["    t.index [\"user_id\"], name: \"index_shelves_on_user_id\"",""]},{"start":{"row":35,"column":40},"end":{"row":37,"column":56},"action":"insert","lines":["","    t.integer \"shelf_id\"","    t.index [\"shelf_id\"], name: \"index_tips_on_shelf_id\""]}]]},"ace":{"folds":[],"scrolltop":182,"scrollleft":0,"selection":{"start":{"row":16,"column":22},"end":{"row":16,"column":22},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":10,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1591184497694,"hash":"bb4f2dfb65283af734b9c828308d09c5bceca531"}