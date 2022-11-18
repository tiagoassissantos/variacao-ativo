class Asset::Synchronize
  def self.run(symbol)
    response = Asset::Get.new.from_yahoo_finance(symbol)
    return if response.status != 200
    
    mapper = Asset::Map.new
    asset_data = mapper.to_dto(response.body)

    asset_data.each do |record|
      Price.create(symbol: record.symbol, date: record.date, price: record.price)
    end
  end
end