FactoryBot.define do
  factory :address, class: Address do
    location { '2475 Virginia Avenue NW, Washington, DC 20037' }
    user_id { 2 }
  end
end
