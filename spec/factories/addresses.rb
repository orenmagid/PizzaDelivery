FactoryBot.define do
  factory :address, class: Address do
    sequence(:location) { |_n| '2475 Virginia Ave NW, Washington, DC 20037' }
    sequence(:user_id, &:to_s)
  end
end
