class Asset::PriceDto
  attr_reader :day, :symbol, :date, :price, :d1_variation, :total_variation

  def initialize(day, symbol, date, price, d1_variation, total_variation)
    @day = day
    @symbol = symbol
    @date = date
    @price = price
    @d1_variation = d1_variation
    @total_variation = total_variation
  end
end