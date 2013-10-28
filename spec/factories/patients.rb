# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    first_name "MyString"
    last_name "MyString"
    mrn "MyString"
    date_of_birth "2013-10-28"
    program "MyString"
    admission_date "2013-10-28 06:50:42"
    discharge_date "2013-10-28 06:50:42"
    pharmacist_id 1
  end
end
