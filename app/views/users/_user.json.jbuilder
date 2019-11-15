json.extract! user, :id, :name, :about_me, :created_at, :updated_at
json.url user_url(user, format: :json)
