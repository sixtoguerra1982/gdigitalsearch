class UsersController < ApplicationController
  def index
    if params[:email].present?
      @users = User.where('email = ?', params[:email])
    else
      @users = User.all
    end
  end
end
