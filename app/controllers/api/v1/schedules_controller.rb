class Api::V1::SchedulesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_training

  def index
    @schedules = @training.schedules
  end

  def show

  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.training = @training
    unless @schedule.save
      render_error
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    unless @schedule = Schedule.update(schedule_params)
      render_error
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time)
  end

  def render_error
    render json: { errors: @schedule.errors.full_messages },
    status: :unprocessable_entity
  end

  def set_training
    @training = Training.find(params[:training_id])
  end
end
