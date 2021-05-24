class UsersController < ApplicationController
  def index
    @users = User.all.order(:points)
  end
end
