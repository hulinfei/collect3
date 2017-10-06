class Photo
  include Mongoid::Document
  #文章标题
  field :title, type: String
  #文章内容
  field :content, type: String
  #文章来源
  field :from, type: String
  #来源地址
  field :url, type: 
  #阅读次数
  field :readNumber, type: Integer
end
