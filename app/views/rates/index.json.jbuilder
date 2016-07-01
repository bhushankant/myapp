json.array!(@rates) do |rate|
  json.extract! rate, :id, :name
  json.url rate_url(rate, format: :json)
end
