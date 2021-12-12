class User::PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you"
      redirect_to "/"
    else
      flash.now[:error] = "No user was found with email address #{params[:email]}"
      render :new
    end
  end

  def edit
  end

  def update
    @user.password = params[:password]
    @user.password_confirmation = params[:password]

    # 更新後、自動ログインさせたくないのであれば下記を使う
    # if @user.save_without_session_maintenance
    if @user.save
      flash[:success] = "Your password was successfully updated"
      redirect_to "/"
    else
      render :edit
    end
  end


  private

  def load_user_using_perishable_token
    @user = User.find_by_perishable_token(params[:id])
    unless @user
      flash[:error] = "We're sorry, but we could not locate your account"
      redirect_to "/"
    end
  end
end