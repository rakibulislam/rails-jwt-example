class Api::V1::BoxesController < ApplicationController

  def index
    render(
      root: false,
      status: :ok,
      json: Box.all,
      each_serializer: Api::V1::BoxSerializer
    )
  end

  def show
    box = Box.find(params[:id])
    render(
      root: false,
      status: :ok,
      json: box,
      serializer: Api::V1::BoxSerializer
    )
  end

  private

  # def box_params
  #   params.permit(:id, :name, :phone, :email, :address, :unit, :city, :zip, :user_id)
  # end
end
