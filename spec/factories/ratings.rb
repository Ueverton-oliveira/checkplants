FactoryBot.define do
  factory :rating do
    store { nil }
    value { 1 }
    opinion { "MyString" }
    user_name { "MyString" }
  end
end
