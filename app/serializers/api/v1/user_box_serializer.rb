class Api::V1::UserBoxSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :phone, :address, :unit, :city, :state, :zip

end
