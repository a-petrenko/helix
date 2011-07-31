class PagesController < ApplicationController
  def home
    @users = Account.all
  end

  def about

  end

  def faq

  end

  def signin

  end

end
