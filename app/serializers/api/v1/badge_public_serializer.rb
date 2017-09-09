class Api::V1::BadgePublicSerializer < ActiveModel::Serializer
    attributes :name, :description
end
