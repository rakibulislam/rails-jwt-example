class Api::V1::KlassesController < ApplicationController


  def create
  end

  def update
  end

  def index
  end

  def show
  end

  private

  def box_params
    params.permit(:id, :name, :phone, :email, :address, :unit, :city, :zip, :user_id)
  end
end
