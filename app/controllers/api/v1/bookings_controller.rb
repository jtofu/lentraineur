class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

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
    @training = Training.find(params[:training_id])
    @booking = Booking.new(params_bookings)

    if @booking.save
      render :show, status: :created
    else
      rendor_error
    end

    def update
      if @booking.update
        render :show
      else
        render_error
      end
    end

  end

private

  def params_bookings
    params.require(:booking).permit(:user_id, :training_id, :reviews, :start_time, :end_time, :total_price)
  end

  def render_error
    render json: { errors: @booking.errors.full_messages },status: :unprocessable_entity
  end
end
