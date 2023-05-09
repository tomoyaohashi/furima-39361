FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.user_name}
    email {Faker::Internet.free_email}
    password {'abc123'}
    password_confirmation {'abc123'}
    surname {'田なカ'}
    name {'太ろウ'}
    surnamekana {'タナカ'}
    namekana {'タロウ'}
    birthday {Faker::Date.birthday}
  end
end