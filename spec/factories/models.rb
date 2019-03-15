FactoryBot.define do
  factory :week do
    week_start { nil }
    week_end { nil }
  end

  factory :coffeeshop_coffee do
    coffeeshop { nil }
    coffee { nil }
    identifier { nil }
  end

  factory :coffee do
    name { nil }
  end

  factory :coffeeshop do
    name { nil }
  end

  factory :employee do
    coffeeshop { nil }
    name { nil }
  end

  factory :transaction do
    coffeeshop { nil }
    employee { nil }
    coffee { nil }
    sold_at { "2018-12-06 16:52:57" }
  end
end
