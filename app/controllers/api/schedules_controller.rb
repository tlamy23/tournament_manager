class Api::SchedulesController < ActionController::Base
  respond_to :json

  def index
    @schedules = Schedule.select([:id, :description, :date])
    respond_with json: @schedules
  end
end
