class Api::V1::MovementSerializer < ActiveModel::Serializer
    attributes :name, :description, :value, :ranking, :ranking_value, :user_id
end
