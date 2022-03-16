json.pagination do
  json.current_page @microposts.current_page
  json.per_page @microposts.per_page
  json.total_entries @microposts.total_entries
end

json.microposts @microposts, partial: 'api/v1/microposts/micropost', as: :micropost
