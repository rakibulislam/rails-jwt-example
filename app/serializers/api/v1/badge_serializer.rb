class Api::V1::BadgeSerializer < ActiveModel::Serializer
    attributes :name, :description, :value, :ranking, :ranking_value, :user_id
end
