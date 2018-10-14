class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email].downcase)
    if !@user
      @user = User.new(email: params[:email])
      render :welcome
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :welcome
    end
  end

  def destroy
    session.delete :user_id
    redirect_to :welcome
  end
end
