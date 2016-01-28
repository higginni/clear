json.array!(@scores) do |score|
  json.extract! score, :id, :strokes, :course
  json.url score_url(score, format: :json)
end
