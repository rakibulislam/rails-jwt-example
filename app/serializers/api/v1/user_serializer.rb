class Api::V1::UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :phone, :email, :home_gym, :overall_ranking, :gender
    has_many :badges, serializer: Api::V1::BadgeSerializer
end
