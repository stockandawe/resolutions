class EventsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    @events = Event.all
    # render json: @events
  end
end
