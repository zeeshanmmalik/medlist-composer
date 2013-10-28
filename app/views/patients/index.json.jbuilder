json.array!(@patients) do |patient|
  json.extract! patient, :first_name, :last_name, :mrn, :date_of_birth, :program, :admission_date, :discharge_date, :pharmacist_id
  json.url patient_url(patient, format: :json)
end
