class SessionsController < ApplicationController

#  def create
#    raise request.env["omniauth.auth"].to_yaml
#  end

  def create
    auth = request.env["omniauth.auth"]
    user = nil
    account = Account.where(provider: auth['provider'], uid: auth['uid']).first #|| Account.create_with_omniauth(auth)
    if account
      user = account.user
    else
      account = Account.create_with_omniauth(auth)
#      email = get_email(auth)
#      user = User.where(email: email).first
      user = User.create_with_omniauth(auth) #unless user
      account.user = user
      account.save
      user.save
    end
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Signed out!'
  end

  def new
    redirect_to signin_path
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
