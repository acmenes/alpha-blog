require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    def setup
        @category = Category.create(name: "sports")
        @user = User.create(username: "Admin", 
        email: "admin@admin.com", password: "admin",
        admin: true)
    end
    
    test "should get categories index" do
        get :index #you get the index, and you ASSERT that it's success
        assert_response :success
    end

    test "should get new" do 
        session[:user_id] = @user.id
        get :new #you get to 'new' page, and you ASSERT that it's a success
        assert_response :success
    end    

    test "should get show" do
        get(:show, {'id' => @category.id}) #should be able to show categories
        assert_response :success
    end
    
    test "should redirect create when admin not logged in" do
        assert_no_difference 'Category.count' do
            post :create, category: { name: "sports" }
        end
        assert_redirected_to categories_path
    end
end    