{"filter":false,"title":"relationship_test.rb","tooltip":"/test/models/relationship_test.rb","undoManager":{"mark":4,"position":4,"stack":[[{"start":{"row":3,"column":2},"end":{"row":5,"column":7},"action":"remove","lines":["# test \"the truth\" do","  #   assert true","  # end"],"id":2},{"start":{"row":3,"column":2},"end":{"row":25,"column":3},"action":"insert","lines":["require 'test_helper'","","class RelationshipTest < ActiveSupport::TestCase","","  def setup","    @relationship = Relationship.new(follower_id: users(:michael).id,","                                     followed_id: users(:archer).id)","  end","","  test \"should be valid\" do","    assert @relationship.valid?","  end","","  test \"should require a follower_id\" do","    @relationship.follower_id = nil","    assert_not @relationship.valid?","  end","","  test \"should require a followed_id\" do","    @relationship.followed_id = nil","    assert_not @relationship.valid?","  end","end"]}],[{"start":{"row":4,"column":0},"end":{"row":6,"column":0},"action":"remove","lines":["","class RelationshipTest < ActiveSupport::TestCase",""],"id":3}],[{"start":{"row":6,"column":69},"end":{"row":7,"column":37},"action":"remove","lines":["","                                     "],"id":4}],[{"start":{"row":3,"column":0},"end":{"row":4,"column":0},"action":"remove","lines":["  require 'test_helper'",""],"id":5}],[{"start":{"row":21,"column":3},"end":{"row":22,"column":3},"action":"remove","lines":["","end"],"id":6}]]},"ace":{"folds":[],"scrolltop":27,"scrollleft":0,"selection":{"start":{"row":14,"column":35},"end":{"row":14,"column":35},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":0,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1591612326907,"hash":"1b9e2046f392cc0973de58cc30e3f9f3535691c8"}