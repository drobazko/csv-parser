require 'rails_helper'

describe Employee, type: :model do
  subject(:employee) { FactoryBot.build :employee }

  it { is_expected.to respond_to(:coffeeshop) }
end
