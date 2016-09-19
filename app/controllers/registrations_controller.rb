class RegistrationsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    username = Faker::Name.first_name + "" + Faker::Name.last_name
    current_usernames = User.all.pluck[:username]
    while current_usernames.include?username
      username = Faker::Name.first_name + "" + Faker::Name.last_name
    end
    user = User.new(username:username)
    if user.save
      session[:user_id] = user.id
      redirect_to chatrooms_path
    else
      redirect_to signup_path, flash[:notice] = user.errors.messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
