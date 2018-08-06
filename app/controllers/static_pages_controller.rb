class StaticPagesController < ApplicationController
  def home
  end

  def list_users
    unless logged_in?
      redirect_to login_path , warning: "Hey, connecte-toi d'abord !"
    end
  end
end
