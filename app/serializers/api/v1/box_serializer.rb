class Api::V1::BoxSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :phone, :address, :unit, :city, :state, :zip

    has_one :user, serializer: Api::V1::UserSerializer

end
