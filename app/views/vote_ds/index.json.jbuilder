json.array!(@vote_ds) do |vote_d|
  json.extract! vote_d, :id, :user_id, :question_id
  json.url vote_d_url(vote_d, format: :json)
end
