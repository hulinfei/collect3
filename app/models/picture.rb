class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  # 图片
  mount_uploader :image, AvatarUploader

  belongs_to :article
end
