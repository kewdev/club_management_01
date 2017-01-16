class UsersController < ApplicationController
  before_action :load_user, only: :show

  def show
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t("can_not_found_user")
      redirect_to root_url
    end
  end
end
