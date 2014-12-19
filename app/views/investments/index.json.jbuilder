json.array!(@investments) do |investment|
  json.extract! investment, :id, :description
  json.url investment_url(investment, format: :json)
end
