require 'rails_helper'

describe Coffeeshop, type: :model do
  subject(:coffeeshop) { FactoryBot.build :coffeeshop }

  it { is_expected.to respond_to(:coffeeshop_coffees) }
  it { is_expected.to respond_to(:coffees) }
end
