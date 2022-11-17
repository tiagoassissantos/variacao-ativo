class Asset::Map
  attr_reader :asset_data, :response_body

  def initialize(response_body)
    @response_body = parse_response(response_body)
  end

  def map
    @asset_data = []
    symbol = @response_body['chart']['result'][0]['meta']['symbol']
    dates = @response_body['chart']['result'][0]['timestamp']
    open_prices = @response_body['chart']['result'][0]['indicators']['quote'][0]['open']

    dates.each_with_index {|date, index|
      asset_dto = Asset::Dto.new(symbol, Date.strptime(date.to_s, '%s'), open_prices[index])
      @asset_data.push asset_dto
    }
  end

  protected
  def parse_response(response_body)
    JSON.parse(response_body)
  end
end