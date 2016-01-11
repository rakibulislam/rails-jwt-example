class Api::V1::UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :phone, :email, :home_gym, :overall_ranking, :overall_ranking_value, :gender, :is_box_owner, :is_crossfitter
    has_many :badges, serializer: Api::V1::BadgeSerializer
    has_many :boxes, serializer: Api::V1::UserBoxSerializer


    def include_boxes?
      is_box_owner
    end

    def include_badges?
      is_crossfitter
    end

end
