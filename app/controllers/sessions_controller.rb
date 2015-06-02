class SessionsController < ApplicationController
  def index
      @user = User.new
  end

  def create
      puts "*****************"
      puts "we are in create session"
    @user = User.where(email: params[:email]).first
    binding.pry
    if @user && @user.authenticate(params[:users][:password_digest])
      session[:id] = @user.id
      puts "*****************"
      redirect_to "user_path"
    else
      @errors="your login credentials failed"
    end
  end

end
