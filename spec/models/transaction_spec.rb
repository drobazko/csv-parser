require 'rails_helper'

describe Transaction, type: :model do
  subject(:transaction) { FactoryBot.build :transaction }

  it { is_expected.to respond_to(:coffeeshop) }
  it { is_expected.to respond_to(:employee) }
  it { is_expected.to respond_to(:coffee) }
end
