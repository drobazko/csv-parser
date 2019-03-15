class Coffee < ApplicationRecord
  has_many :coffeeshop_coffees
  has_many :coffeeshops, through: :coffeeshop_coffees
end
