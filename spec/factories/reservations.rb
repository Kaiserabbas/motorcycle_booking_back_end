FactoryBot.define do
  factory :reservation do
    duration { '9.99' }
    total { '9.99' }
    user { nil }
    motorcycle { nil }
  end
end
