class SessionsController < ApplicationController

  def create
    @user = Team.find(user_params[:team_id]).users.find_by(username: user_params[:username])
    @errormsg = "wrong username or password"
    if @user.authenticate(user_params[:password])
      render json: @user, :except => [:created_at, :updated_at, :password_digest]
    else
      render json: @errormsg, status: :unprocessable_entity
    end
  end

  def destroy
    @user = nil
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :team_id)
  end
end
