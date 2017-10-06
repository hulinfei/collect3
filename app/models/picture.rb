class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  # 图片地址
  field :address, type: String

  belongs_to :article
end
