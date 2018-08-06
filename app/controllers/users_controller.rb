class UsersController < ApplicationController
  def new
    @post = User.new
  end

  def create
    @post = User.create(first_name: params[:user][:first_name],last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @post.valid?
      log_in @post
      redirect_to root_url, success: "Vous êtes inscrit"
    else
      redirect_to new_user_path, danger: "Respectez les conditions d'inscription"
    end
  end

  def edit
    @post = User.find(params[:id])
  end

  def update
    @post = User.find(params[:id])
    @post.update!(first_name: params[:user][:first_name],last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @post.update_attributes(user_params)
      redirect_to root_url , success: "Profil modifié"
    else
      redirect_to edit_user_path, danger: "Vous ne pouvez pas changer comme cela"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url, success: "Profil supprimé"
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end
end
