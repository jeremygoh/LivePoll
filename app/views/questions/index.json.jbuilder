json.array!(@questions) do |question|
  json.extract! question, :id, :text, :option_a, :option_b, :option_c, :option_d, :started, :finished, :answer
  json.url question_url(question, format: :json)
end
