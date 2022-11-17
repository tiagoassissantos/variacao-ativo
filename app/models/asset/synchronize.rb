class Asset::Synchronize
  def self.run(symbol)
    response = Asset::Get.new.from_yahoo_finance(symbol)
    return if response.status != 200
    
    mapper = Asset::Map.new(response.body)
    mapper.map
    asset_data = mapper.asset_data

    asset_data.each do |record|
      Price.create(symbol: record.symbol, date: record.date, price: record.price)
    end
  end
end