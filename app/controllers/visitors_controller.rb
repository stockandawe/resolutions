class VisitorsController < ApplicationController
  def index
    if current_user
      redirect_to user_path(current_user.id)
    else
      @events = Event.all.order("created_at DESC").limit(15)
    end
  end
end
