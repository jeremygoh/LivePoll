json.array!(@poll_centres) do |poll_centre|
  json.extract! poll_centre, :id, :title
  json.url poll_centre_url(poll_centre, format: :json)
end
