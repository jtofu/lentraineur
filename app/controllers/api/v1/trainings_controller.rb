class Api::V1::TrainingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
    @related_trainings = @traiing.find_related_tags
  end

  def create
    @user = current_user
    @training = Training.new(training_params)
    @training.user = @user
    if @training.save
      render :show, status: :created
    else
      render_error
    end
  end

  def tagged
  if params[:tag].present?
    @trainings = Training.tagged_with(params[:tag])
  else
    @trainings = Training.all
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
    params.require(:training).permit(:title, :description, :price_per_hour, :location, :min_start_time, :max_end_time, tag_list: [])
  end

  def render_error
    render json: { errors: @training.errors.full_messages },
    status: :unprocessable_entity
  end
end
