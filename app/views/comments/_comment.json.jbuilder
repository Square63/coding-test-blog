json.extract! comment, :id, :description, :author_name, :post_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
