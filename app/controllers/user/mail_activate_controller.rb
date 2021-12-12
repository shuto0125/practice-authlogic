class User::MailActivateController < ApplicationController

  def create
    @user = User.find_using_perishable_token(params[:activate_code], 1.week)
    raise ActiveRecord::RecordNotFound unless @user

    if @user.activate!
      flash[:notice] = "Your account has been activated!"
      UserSession.create(@user, false) # Log user in manually
      redirect_to "/"
    end
  end

end