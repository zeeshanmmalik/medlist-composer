# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drug do
    generic_name "MyString"
    strength "MyString"
    brand_name "MyString"
    purpose "MyString"
    instruction nil
    am_check "MyString"
    am_time "MyString"
    noon_check "MyString"
    noon_time "MyString"
    supper_check "MyString"
    supper_time "MyString"
    bedtime_check "MyString"
    bedtime_time "MyString"
  end
end
