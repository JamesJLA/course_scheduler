class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = if params[:search].present?
               User.where("email LIKE ?", "%#{params[:search]}%")
    else
               User.none
    end.limit(20)
  end

  def show
    @user = User.find(params[:id])
    @enrollments = @user.enrollments.includes(:course)
  end
end
