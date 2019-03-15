require 'rails_helper'

describe CoffeeshopCoffee, type: :model do
  subject(:coffeeshop_coffee) { FactoryBot.build :coffeeshop_coffee }

  it { is_expected.to respond_to(:coffeeshop) }
  it { is_expected.to respond_to(:coffee) }
end
