class Asset::Get
  def from_yahoo_finance(asset)
    uri = "https://query2.finance.yahoo.com/v8/finance/chart/#{asset}?range=1mo&interval=1d"
    response = Faraday.get(uri)
    response
  end
end