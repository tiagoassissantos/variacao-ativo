class Asset::Dto
  attr_reader :symbol, :date, :price

  def initialize(symbol, date, price)
    @symbol = symbol
    @date = date
    @price = price
  end
end