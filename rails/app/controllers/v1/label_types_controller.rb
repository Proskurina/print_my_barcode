class V1::LabelTypesController < ApplicationController

  def index
    render json: LabelType.all
  end

  def show
    render json: current_resource
  end

  def create
    @label_type = LabelType.new(label_type_params)
    if @label_type.save
      render json: @label_type
    else
      render json: { errors: @label_type.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @label_type = current_resource
    if @label_type.update_attributes(label_type_params)
      render json: @label_type
    else
      render json: { errors: @label_type.errors.full_messages}, status: :unprocessable_entity
    end
  end

private

  def current_resource
    @current_resource ||= LabelType.find(params[:id]) if params[:id]
  end

  def label_type_params
    params.require(:label_type).permit(:name, :feed_value, :fine_adjustment,:pitch_length, :print_width,:print_length)
  end
  
end