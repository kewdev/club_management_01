class EventsController < ApplicationController
  before_action :load_club, :load_event, only: :show
  def show
  end

  private
  def load_club
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t("not_found")
    end
  end

  def load_event
    @event = Event.find_by id: params[:id]
    unless @event
      flash[:danger] = t("not_found")
    end
  end
end
