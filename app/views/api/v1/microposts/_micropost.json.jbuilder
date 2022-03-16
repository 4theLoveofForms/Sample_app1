json.id micropost.id
json.user do
  json.id micropost.user.id
  json.name micropost.user.name
end
json.content micropost.content
json.created_at micropost.created_at
