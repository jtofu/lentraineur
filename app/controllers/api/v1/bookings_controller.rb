class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_schedule, only: [:create]
  def index
    # find user
    @user = current_user
    @bookings = current_user.bookings
    # find user bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    # @training = Training.find(params[:training_id])
    # @schedules = @training.schedules

    @booking = Booking.new(booking_params)
    @booking.schedule = @schedule
    # @booking.user = current_user
    # @booking.total_price = @training.price_per_hour * 2
    if @booking.save
      render :show, status: :created
    else
      rendor_error
    end

    def update
      @booking = Booking.find(params[:id])
      if @booking.update
        render :show
      else
        render_error
      end
    end

  end

private

  def booking_params
    params.require(:booking).permit(:user_id, :start_time, :end_time, :total_price)
  end

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def render_error
    render json: { errors: @booking.errors.full_messages },status: :unprocessable_entity
  end
end
