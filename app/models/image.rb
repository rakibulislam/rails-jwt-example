class Image < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  before_save :set_image

  belongs_to :box

  def set_image
      StringIO.open(Base64.decode64(image)) do |data|
        data.class.class_eval { attr_accessor :original_filename, :content_type }
        data.original_filename = "#{id}.jpg"
        data.content_type = "image/png"
        self.image = data
      end
  end
end
