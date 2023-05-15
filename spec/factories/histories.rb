FactoryBot.define do
  factory :history do
    association :user
    association :item
    association :buy
  end
end
