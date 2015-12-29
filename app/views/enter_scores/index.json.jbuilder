json.array!(@enter_scores) do |enter_score|
  json.extract! enter_score, :id
  json.url enter_score_url(enter_score, format: :json)
end
