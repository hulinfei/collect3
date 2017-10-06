json.extract! article, :id, :title, :content, :from, :url, :read_number, :created_at, :updated_at
json.url article_url(article, format: :json)