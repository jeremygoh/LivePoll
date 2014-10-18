json.array!(@vote_bs) do |vote_b|
  json.extract! vote_b, :id, :user_id, :question_id
  json.url vote_b_url(vote_b, format: :json)
end
