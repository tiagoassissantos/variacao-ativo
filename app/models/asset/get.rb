class Asset::Get
  def from_yahoo_finance(asset)
    uri = "https://query2.finance.yahoo.com/v8/finance/chart/#{asset}?range=1mo&interval=1d"
    response = Faraday.get(uri)
    parse_response(response)
  end

  def parse_response(response)
    return {} if response.status != 200
    JSON.parse(response)
  end
end