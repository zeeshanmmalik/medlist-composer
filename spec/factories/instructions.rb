# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :instruction do
    line "MyString"
    instructionable_id 1
    instructionable_type "MyString"
  end
end
