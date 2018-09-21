require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username:"Wladek", email:"wlodek@wp.pl", password:"pass", admin:true)
  end

  test "get new category form and create category" do
    sign_in_as(@user, "pass")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: "news"}}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "news", response.body
  end

  test "invalid category submission results in failure" do
    sign_in_as(@user, "pass")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: " "}}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select '.panel-body'
  end

end
