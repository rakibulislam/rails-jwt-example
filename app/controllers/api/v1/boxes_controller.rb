class Api::V1::BoxesController < ApplicationController

  def create
    begin
      authorize_request!(params[:user_id])
      box = Box.create(box_params)
        render(
          root: false,
          status: :created,
          json: box,
          serializer: Api::V1::BoxSerializer
        )
    rescue ActiveRecord::RecordNotFound
      resource_not_found
    rescue NotAuthorizedError
      forbidden_resource
    rescue NotAuthenticatedError
      user_not_authenticated
    rescue AuthenticationTimeoutError
      authentication_timeout
    end
  end

  private

  def box_params
    params.permit(:id, :name, :phone, :email, :address, :unit, :city, :zip, :user_id,
      :business_hours_attributes => [:day, :open_time, :close_time, :box_id])
  end
end
