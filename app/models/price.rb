class Price < ApplicationRecord
  validates :date, uniqueness: { scope: :symbol, message: "should happen once per symbol" }
end
