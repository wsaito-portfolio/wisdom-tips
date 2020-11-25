require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @other = users(:archer)
  end
  
  test "un successful edit by invalid parameter" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user),params: { user:{name:"",
                          email:"foo@invalid",
                          password:"foo",
                          password_confirmation:"bar"}}
    assert_template 'users/edit'
    assert_select "div.alert","The form contains 4 errors."
  end
  
  test "un successful edit by other user" do
    log_in_as(@other)
    name = "foo"
    email = "foo@bar.com"
    detail_id = @user.user_detail.id
    patch user_path(@user),params: { user:{name:name,
                            email:email,
                            password:"",
                            password_confirmation:"",
                            user_detail_attributes:{id: detail_id,
                            profile_description:"edit"}
      }
    }
    assert_redirected_to root_path
  end
  
  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "foo"
    email = "foo@bar.com"
    detail_id = @user.user_detail.id
    patch user_path(@user),params: { user:{name:name,
                            email:email,
                            password:"",
                            password_confirmation:"",
                            user_detail_attributes:{id: detail_id,
                            profile_description:"edit"}
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,@user.name
    assert_equal email,@user.email
  end
  
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "foo"
    email = "foo@bar.com"
    detail_id = @user.user_detail.id
    patch user_path(@user),params: { user:{name: name,
                          email: email,
                          password: "",
                          password_confirmation: "",
                          user_detail_attributes:{id: detail_id,
                            profile_description:"edit"}
        }
    }
    
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,@user.name
    assert_equal email,@user.email
    get edit_user_path(@user)
    assert_template 'users/edit'
  end
  
  
end
