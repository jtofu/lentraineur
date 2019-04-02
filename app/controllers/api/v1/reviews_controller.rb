class Api::V1::ReviewsController < Api::V1::BaseController

  def index
    @booking = booking.find(params[:id])
    @reviews = @booking.reviews

  def create
    @booking = booking.find(params[:id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end

  def render_error
    render json: { errors: @review.errors.full_messages },
    status: :unprocessable_entity
  end
end
