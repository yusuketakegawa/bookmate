class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end


end

