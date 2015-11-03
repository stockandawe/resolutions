class ResolutionsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @resolution = Resolution.new(secure_params)

    respond_to do |format|
      if @resolution.save
        current_user.events.create(action: "resolved", eventable: @resolution)
        format.html { redirect_to resolutions_path, notice: 'Resolution was successfully added.' }
        format.js   {}
        format.json { render :show, status: :created, location: @resolution }
      else
        format.html { render :new }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def secure_params
    params.require(:resolution).permit(:user_id, :title)
  end

end
