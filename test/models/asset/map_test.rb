require "test_helper"

class Asset::MapTest < ActiveSupport::TestCase
  setup do
    @petr4_json = File.read("test/fixtures/files/petr4.json")
    @mapper = Asset::Map.new
  end

  test 'should parse response body in JSON' do
    json_response = @mapper.send(:parse_response, @petr4_json)
    assert_equal(json_response['chart']['result'][0]['indicators']['quote'][0]['open'][5], 36.5)
  end

  test 'should map from response json to object' do
    asset_data = @mapper.to_dto(@petr4_json)
    assert_not_nil(asset_data)
    assert_equal(21, asset_data.size)

    asset_dto = asset_data[5]
    assert_equal('PETR4.SA', asset_dto.symbol)
    assert_equal(36.5, asset_dto.price)
    assert_equal('2022-10-24', asset_dto.date.to_s)
  end

  test 'should map from active record to price_dto' do
    prices = Price.last_thirty('VALE3.SA')

    prices_array = @mapper.from_active_record(prices)
    assert_not_nil(prices_array)
    assert_equal(30, prices_array.size)

    price_dto = prices_array[0]
    assert_equal('VALE3.SA', price_dto.symbol)
    assert_equal(1, price_dto.day)
    assert_equal(0, price_dto.d1_variation)

    price_dto = prices_array[1]
    assert_equal(2, price_dto.day)
    assert_equal(1.31, price_dto.d1_variation)
    assert_equal(1.31, price_dto.total_variation)
  end
end