class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # 用户名
  field :username, type: String
  # 用户密码
  field :password, type: String
  
  has_many :articles
end
