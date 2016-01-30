require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    def setup
        @category = Category.create(name: "sports")
    end
    
    test "should get categories index" do
        get :index #you get the index, and you ASSERT that it's success
        assert_response :success
    end

    test "should get new" do 
        get :new #you get to 'new' page, and you ASSERT that it's a success
        assert_response :success
    end    

    test "should get show" do
        get(:show, {'id' => @category.id}) #should be able to show categories
        assert_response :success
    end
    
end    