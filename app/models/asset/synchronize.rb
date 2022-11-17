class Asset::Synchronize
  def self.run(symbol)
    response = Asset::Get.new.from_yahoo_finance(symbol)
    # aqui precisa verificar o status de response
    
    mapper = Asset::Map.new(response.body)
    mapper.map
    asset_data = mapper.asset_data

    
  end
end