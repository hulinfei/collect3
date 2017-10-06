class Label
  include Mongoid::Document
  include Mongoid::Timestamps
  # 标签名
  field :name, type: String
  # 标签使用次数
  field :number, type: Integer

  has_and_belongs_to_many :articles

end
