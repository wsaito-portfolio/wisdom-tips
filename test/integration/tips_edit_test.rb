require 'test_helper'

class TipsEditTest < ActionDispatch::IntegrationTest

    def setup 
        @user = users(:michael)
        @other = users(:archer)
        @tip = tips(:tdd)
        @shelf = @user.shelves.last
        @other_tip = tips(:archers_tip)
    end

    test "un successful edit by invalid parameter" do
        log_in_as(@user)
        content = ""
        shelf_id = nil
        child_id = @tip.id
        detail = ""
        reason1 = ""
        reason2 = ""
        assert_no_difference 'Tip.count' do
            assert_no_difference 'Tip.where(delete_flg: true).count' do
                assert_no_difference 'Tip.where(child_id:' + child_id.to_s + ').count' do
                    patch user_tip_path(@user,@other_tip)  , params: {
                                                tip:{ 
                                                    content: content,
                                                    shelf_id: shelf_id,
                                                    refer_id: nil,
                                                    child_id: child_id,
                                                    detail: detail,
                                                    reasons_attributes: [
                                                        {
                                                            content: reason1
                                                        },
                                                        {
                                                            content: reason2
                                                        }
                                                    ]
                                                }
                        }
                end
            end
        end
    end
    
     test "un successful edit by other user" do
        log_in_as(@other)
        content = "content"
        shelf_id = @shelf.id
        child_id = @tip.id
        detail = "detail"
        reason1 = "reason1"
        reason2 = "reason2"
        assert_no_difference 'Tip.count'  do
            assert_no_difference 'Tip.where(delete_flg: true).count' do
                assert_no_difference 'Tip.where(child_id:' + child_id.to_s + ').count' do
                    
                    patch user_tip_path(@user,@tip)  , params: {
                                                tip:{ 
                                                    content: content,
                                                    shelf_id: shelf_id,
                                                    refer_id: nil,
                                                    child_id: child_id,
                                                    detail: detail,
                                                    reasons_attributes: [
                                                        {
                                                            content: reason1
                                                        },
                                                        {
                                                            content: reason2
                                                        }
                                                    ]
                                                }
                        }
                end
            end
        end
        
        assert_redirected_to root_path
    end
    
    test "successful edit" do
        log_in_as(@user)
        content = "content"
        shelf_id = @shelf.id
        child_id = @tip.id
        detail = "detail"
        reason1 = "reason1"
        reason2 = "reason2"
        assert_difference 'Tip.count' ,1 do
            assert_difference 'Tip.where(delete_flg: true).count',1 do
                assert_difference 'Tip.where(child_id:' + child_id.to_s + ').count',1 do
                    
                    patch user_tip_path(@user,@tip)  , params: {
                                                tip:{ 
                                                    content: content,
                                                    shelf_id: shelf_id,
                                                    refer_id: nil,
                                                    child_id: child_id,
                                                    detail: detail,
                                                    reasons_attributes: [
                                                        {
                                                            content: reason1
                                                        },
                                                        {
                                                            content: reason2
                                                        }
                                                    ]
                                                }
                        }
                end
            end
        end
        new_tip = @user.tips.order(created_at: :asc).limit(1)[0]
        assert_equal content , new_tip.content
        assert_equal shelf_id , new_tip.shelf_id
        assert_equal child_id , new_tip.child_id
        assert_equal detail , new_tip.detail
        assert_equal reason1 , new_tip.reasons[0].content
        assert_equal reason2 , new_tip.reasons[1].content
    end

end
