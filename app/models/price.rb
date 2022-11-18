class Price < ApplicationRecord
  validates :date, uniqueness: { scope: :symbol, message: "should happen once per symbol" }

  scope :last_thirty, ->(symbol) { 
    where(symbol: symbol).order(date: :desc).limit(30)
  }

  def calculate_variation(previous_price)
    if price < previous_price
      ((price.to_f - previous_price.to_f) / previous_price.to_f * 100).round(2)
    else
      ((previous_price.to_f - price.to_f) / previous_price.to_f * -100).round(2)
    end
  end
end
