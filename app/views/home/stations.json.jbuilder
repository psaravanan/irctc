json.array!(@stations) do |station|
  json.extract! station, :id, :name, :code
  json.url contact_u_url(station, format: :json)
end
