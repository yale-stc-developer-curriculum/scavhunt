json.array!(@teams) do |team|
  json.extract! team, :id, :name, :start, :members
  json.url team_url(team, format: :json)
end
