require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout links without logged in" do
    get root_path
    assert_template "static_pages/home"

    # ヘッダー
    assert_select "header" do
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", help_path
      assert_select "a[href=?]", login_path
    end

    # フッター
    assert_select "footer" do
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path
    end
  end

  test "layout links with logged in" do
    log_in_as(@user)

    get root_path
    assert_template "static_pages/home"

    # ヘッダー
    assert_select "header" do
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", help_path
      assert_select "a[href=?]", users_path
      assert_select "a[href=?]", user_path(@user)
      assert_select "a[href=?]", logout_path
    end

    # フッター
    assert_select "footer" do
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path
    end
  end
end
