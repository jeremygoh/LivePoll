json.array!(@vote_as) do |vote_a|
  json.extract! vote_a, :id, :user_id, :question_id
  json.url vote_a_url(vote_a, format: :json)
end
