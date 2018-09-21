require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name:"news")
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get categories new" do
    get new_category_path
    assert_response :success
  end

  test "should get categories show" do
    get get show_category_path(@category)
    assert_response :success
  end


end
