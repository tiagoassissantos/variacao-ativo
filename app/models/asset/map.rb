class Asset::Map

  def to_dto(response_body)
    response_body = parse_response(response_body)

    asset_data = []
    symbol = response_body['chart']['result'][0]['meta']['symbol']
    dates = response_body['chart']['result'][0]['timestamp']
    open_prices = response_body['chart']['result'][0]['indicators']['quote'][0]['open']

    dates.each_with_index {|date, index|
      asset_dto = Asset::Dto.new(symbol, Date.strptime(date.to_s, '%s'), open_prices[index])
      asset_data.push asset_dto
    }

    asset_data
  end

  def from_active_record(prices)
    prices_array = price_to_array(prices).reverse

    prices_with_variation = []
    start_price = prices_array[0].price
    previous_price = start_price

    prices_array.each_with_index do |price, index|
      price_dto = Asset::PriceDto.new(index+1, price.symbol, price.date, price.price, price.calculate_variation(previous_price), price.calculate_variation(start_price))
      prices_with_variation.push price_dto
      previous_price = price.price
    end

    prices_with_variation
  end

  protected
  def parse_response(response_body)
    JSON.parse(response_body)
  end

  def price_to_array(prices)
    prices_array = []
    prices.each do |price|
      prices_array.push price
    end
    prices_array
  end
end