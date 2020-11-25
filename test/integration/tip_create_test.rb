require 'test_helper'

class TipCreateTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:michael)
        @other = users(:archer)
        @shelf = @user.shelves.find_by(name: "shelf_1")
        @refered_tip = tips(:tdd)
        
    end

    test "un successful create by invalid parameter" do
        log_in_as(@user)
        get new_user_tip_path(@user)
        content = ""
        shelf_id = nil
        detail = ""
        reason1 = ""
        reason2 = ""
        assert_no_difference 'Tip.count' do
            assert_no_difference 'Reason.count' do
                post user_tips_path(@user) , params: {
                                        tip:{ 
                                            content: content,
                                            shelf_id: shelf_id,
                                            refer_id: nil,
                                            parent_id: nil,
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
        assert_template 'tips/new'
        assert_select 'div#error_explanation'
    end

    test "un successful create by other user" do
        log_in_as(@other)
        content = "content"
        shelf_id = @shelf.id
        detail = "detail"
        reason1 = "reason1"
        reason2 = "reason2"
        assert_no_difference 'Tip.count' do
            assert_no_difference 'Reason.count' do
                post user_tips_path(@user) , params: {
                                        tip:{ 
                                            content: content,
                                            shelf_id: shelf_id,
                                            refer_id: nil,
                                            parent_id: nil,
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
        
        assert_redirected_to root_path
    end

    test "successful create a new tip" do
        log_in_as(@user)
        get new_user_tip_path(@user)
        content = "content"
        shelf_id = @shelf.id
        detail = "detail"
        reason1 = "reason1"
        reason2 = "reason2"
        assert_difference 'Tip.count', 1 do
            assert_difference 'Reason.count', 2 do
                post user_tips_path(@user) , params: {
                                        tip:{ 
                                            content: content,
                                            shelf_id: shelf_id,
                                            refer_id: nil,
                                            parent_id: nil,
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
        assert_not flash.empty?
        assert_redirected_to @user
        posted_tip = @user.tips.find_by(content: content)
        assert_equal content, posted_tip.content
        assert_equal shelf_id, posted_tip.shelf_id
        assert_nil posted_tip.refer_id
        assert_nil posted_tip.parent_id
        assert_equal detail, posted_tip.detail
        assert_equal reason1, posted_tip.reasons[0].content
        assert_equal reason2, posted_tip.reasons[1].content
        
        get user_path(@user)
        assert_select "span.tip_content", text: "content"
        assert_select 'ol.reason_content > li', text: "reason1"
        assert_select 'ol.reason_content > li',  text: "reason2"
    end
    
    test "refer new tip" do
        log_in_as(@user)
        get user_tip_refer_path(@user,@refered_tip)
        content = @refered_tip.content
        shelf_id = @shelf.id
        detail = "detail"
        reason1 = @refered_tip.reasons[0].content
        refer_id = @refered_tip.id
        assert_difference 'Tip.count', 1 do
            assert_difference 'Reason.count', 1 do
                post user_tips_path(@user) , params: {
                                        tip:{ 
                                            content: content,
                                            shelf_id: shelf_id,
                                            refer_id: refer_id,
                                            parent_id: nil,
                                            detail: detail,
                                            reasons_attributes: [
                                                {
                                                    content: reason1
                                                }
                                            ]
                                        }
                }
            end 
        end
        assert_not flash.empty?
        assert_redirected_to @user
        posted_tip = @user.tips.find_by(content: content)
        assert_equal content, posted_tip.content
        assert_equal shelf_id, posted_tip.shelf_id
        assert_equal refer_id,posted_tip.refer_id
        assert_nil posted_tip.parent_id
        assert_equal detail, posted_tip.detail
        assert_equal reason1, posted_tip.reasons[0].content
        
        get user_path(@user)
        assert_select "span.tip_content", text: content
        assert_select 'ol.reason_content > li', text: reason1
    end
    
    
end
