json.array!(@pharmacists) do |pharmacist|
  json.extract! pharmacist, :first_name, :last_name
  json.url pharmacist_url(pharmacist, format: :json)
end
