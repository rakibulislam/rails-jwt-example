class MovementSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :value, :ranking, :ranking_value, :user_id
end
