class ClubsController < ApplicationController
  before_action :user_signed_in
  before_action :load_club, only: :show

  def index
    @clubs = current_user.clubs.actives.newest.page(params[:page]).per Settings.club_per_page
    @organizations = current_user.user_organizations.actives
  end

  def show
    @events = @club.events.newest.page(params[:page]).per Settings.per_page
    @time_line_events = @events.by_current_year.group_by_quarter
    @user_club = UserClub.new
  end

  def load_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:danger] = t("not_found")
    end
  end
end
