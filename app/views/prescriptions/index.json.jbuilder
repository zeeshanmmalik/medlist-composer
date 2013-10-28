json.array!(@prescriptions) do |prescription|
  json.extract! prescription, :patient_id, :pharmacist_id, :physician, :base_template_id
  json.url prescription_url(prescription, format: :json)
end
