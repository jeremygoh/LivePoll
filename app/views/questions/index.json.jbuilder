json.array!(@questions) do |question|
  json.extract! question, :id, :text, :option_a, :option_b, :option_c, :option_d, :started, :finished, :poll_centre_id
  json.url question_url(question, format: :json)
end
