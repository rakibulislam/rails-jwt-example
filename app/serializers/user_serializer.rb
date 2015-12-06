class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :phone, :email, :home_gym, :overall_ranking
    has_many :movements
end
