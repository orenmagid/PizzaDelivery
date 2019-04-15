FactoryBot.define do
  factory :user, class: User do
    sequence(:first_name) { |n| "User #{n}" }
    sequence(:last_name) { |n| "User #{n}" }
    sequence(:username) { |n| "username-#{n}" }
    sequence(:email) { |n| "username-#{n}@email.com" }
    sequence(:password) { |n| "password#{n}" }

    address
  end
end
