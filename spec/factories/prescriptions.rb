# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prescription do
    patient nil
    pharmacist nil
    physician "MyString"
    base_template_id 1
  end
end
