class Api::V1::ReviewsController < Api::V1::BaseController
  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
     @training = Training.find(params[:id])
    if @training.update(training_params)
      render :show
    else
      render_error
    end
  end

  private

   def training_params
    params.require(:training).permit(:title, :description, :price_per_hour, :location, :min_start_time, :max_end_time, :user_id)
  end

  def render_error
    render json: { errors: @training.errors.full_messages },
    status: :unprocessable_entity
  end
end
