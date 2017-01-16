class TimeLineHomesController < ApplicationController
  before_action :user_signed_in
  def index
    @clubs = current_user.clubs
  end
end
