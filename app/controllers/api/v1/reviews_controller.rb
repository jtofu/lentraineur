class Api::V1::ReviewsController < Api::V1::BaseController
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def review_params
    params.require(:training).permit(:content, :rating, :booking_id)
  end

  def render_error
    render json: { errors: @review.errors.full_messages },
    status: :unprocessable_entity
  end
end
