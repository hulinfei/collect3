 class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  # include Mongoid::Tags

  paginates_per 3
  # 文章标题
  field :title, type: String
  # 文章内容
  field :content, type: String
  # 文章来源
  field :from, type: String
  # 来源地址
  field :url, type: String
  # 阅读次数
  field :read_number, type: Integer

  validates_presence_of :title, message: "标题不能为空"
  validates_presence_of :url, message: "来源不能为空"

  has_and_belongs_to_many :labels
  has_many :pictures
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

end
