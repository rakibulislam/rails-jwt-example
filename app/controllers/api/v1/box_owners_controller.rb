class Api::V1::BoxOwnersController < ApplicationController


  def create
    box = Box.create(box_params)

    render(
      root: false,
      status: :created,
      json: box,
      serializer: Api::V1::BoxSerializer
    )
  end

  def update
    box = Box.find(params[:id])
    box.update(box_params)
    render(
      root: false,
      status: :ok,
      json: box,
      serializer: Api::V1::BoxSerializer
    )
  end

  def index
    user = User.find(params[:user_id])
    render(
      root: false,
      status: :ok,
      json: user.boxes,
      each_serializer: Api::V1::BoxSerializer
    )
  end

  def show
    user = User.find(params[:user_id])
    box = user.boxes.find(params[:id])
    render(
      root: false,
      status: :ok,
      json: box,
      serializer: Api::V1::BoxSerializer
    )
  end

  def destroy
    user = User.find(params[:user_id])
    box = user.boxes.find(params[:id])
    box.destroy
    render(
      root: false,
      status: :ok,
      json: {message: "Removed"},
    )
  end

  private

  def box_params
    params.permit(:id, :name, :phone, :email, :address, :unit, :city, :state, :zip, :user_id)
  end
end
