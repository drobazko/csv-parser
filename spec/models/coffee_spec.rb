require 'rails_helper'

describe Coffee, type: :model do
  subject(:coffee) { FactoryBot.build :coffee }

  it { is_expected.to respond_to(:coffeeshop_coffees) }
  it { is_expected.to respond_to(:coffeeshops) }
end
