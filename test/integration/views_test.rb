require 'test_helper'
include SessionsHelper
class ViewsTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(first_name: 'first_name', last_name: 'last_name', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
  end

#La page d'accueil affiche-t-elle les bons liens ?
  test 'Homepage gives the link to club page if logged_in?' do
    get root_path
    assert_select 'a', 'Club' if logged_in?
  end
  test 'Homepage gives the link to login page if !logged_in?' do
    get root_path
    assert_select 'a', 'Se connecter'
  end


end
