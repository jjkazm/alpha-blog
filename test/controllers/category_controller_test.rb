require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name:"news")
    @user = User.create(username:"Wladek", email:"wlodek@wp.pl", password:"pass", admin:true)
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get categories new" do
    sign_in_as(@user, "pass")
    get new_category_path
    assert_response :success
  end

  test "should get categories show" do
    get categories_path(@category)
    assert_response :success
  end

  test "should redirect if not logged as admin" do
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: {name: "news" }}
    end
    assert_redirected_to categories_path
  end


end
