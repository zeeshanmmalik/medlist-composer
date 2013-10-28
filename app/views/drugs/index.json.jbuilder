json.array!(@drugs) do |drug|
  json.extract! drug, :generic_name, :strength, :brand_name, :purpose, :instruction_id, :am_check, :am_time, :noon_check, :noon_time, :supper_check, :supper_time, :bedtime_check, :bedtime_time
  json.url drug_url(drug, format: :json)
end
