class Api::V1::BoxSerializer < ActiveModel::Serializer
    attributes :name, :email, :phone, :address, :unit, :city, :state, :zip

    has_many :business_hours

    has_one :user, serializer: Api::V1::UserSerializer
end
