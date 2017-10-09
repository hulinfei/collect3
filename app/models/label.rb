class Label
  include Mongoid::Document
  include Mongoid::Timestamps

   paginates_per 3

  # 标签名
  field :name, type: String
  # 标签使用次数
  field :number, type: Integer
  #禁用
   field :forbid, type: Boolean, default: false

  has_and_belongs_to_many :articles

end
