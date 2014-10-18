json.array!(@vote_cs) do |vote_c|
  json.extract! vote_c, :id, :user_id, :question_id
  json.url vote_c_url(vote_c, format: :json)
end
