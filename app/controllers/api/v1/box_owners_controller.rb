class Api::V1::BoxOwnersController < ApplicationController

  # before_action :authorize_request, only: [:show, :index]

  def create
    @box = Box.create(box_params)
    puts "@box: #{@box.inspect}"
    puts "@box.images: #{@box.images.inspect}"

    render(
      root: false,
      status: :created,
      json: @box,
      serializer: Api::V1::BoxSerializer
    )

    # @box = Box.new(box_params)
    # @box.images.build(params[:images_attributes][0])
    # @box.save
    # @box = Box.new({
    #   "name": params[:name],
    #   "phone": params[:phone],
    #   "email": params[:email],
    #   "address": params[:address],
    #   "city": params[:city],
    #   "state": params[:state],
    #   "zip": params[:zip]
    # })

    # @box.images.new({
    #   image: params["images_attributes"][0][:image]
    # })

    # render(
    #   root: false,
    #   status: :created,
    #   json: @box,
    #   serializer: Api::V1::BoxSerializer
    # )
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
    params.permit(:id, :box_owner, :name, :phone, :email, :address, :unit, :city, :state, :zip, :user_id, :images_attributes => [:image])
  end
end
