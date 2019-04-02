class Api::V1::ReviewsController < Api::V1::BaseController

  def index
    @booking = Booking.find(params[:booking_id])
    @reviews = Review.all
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    unless @review.save
      render_error
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def render_error
    render json: { errors: @review.errors.full_messages },
    status: :unprocessable_entity
  end
end
