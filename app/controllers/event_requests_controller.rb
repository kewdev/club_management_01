class EventRequestsController < ApplicationController
  def new
    @categories = CategoryRequest.all
    @clubs = Club.all
  end

  def create
    if create_event
      request = Request.new request_params @event
      if request.save
        flash[:success] = t("success_create")
      else
        flash_error request
      end
    else
      flash_error @event
    end
    redirect_to root_url
  end

  private
  def request_params target
    params.require(:event_requests).permit(:category_request_id,
      :organization_id, :name_club, :name_event, :content,
      :expense, :date_start, :duration, :location).merge! user_id: current_user.id,
        target: target
  end

  def event_params
    params[:name] = params[:event_requests][:name_event]
    params[:description] = params[:event_requests][:content]
    params[:expense] = params[:event_requests][:expense]
    params[:date_start] = params[:event_requests][:date_start]
    params[:duration] =  params[:event_requests][:duration]
    params[:location] =  params[:event_requests][:location]
    params[:club_id] =  params[:event_requests][:club_id]
    params.permit :name, :club_id, :description, :expense, :date_start,
      :location, :duration
  end

  def create_event
    @event = Event.new event_params
    @event.save
  end

  def load_request
    @request = Request.find_by_id params[:id]
    unless @request
      flash_error @request
      redirect_to root_url
    end
  end
end
