require "test_helper"

class Asset::MapTest < ActiveSupport::TestCase
  setup do
    @petr4_json = File.read("test/fixtures/files/petr4.json")
    @mapper = Asset::Map.new(@petr4_json)
  end

  test 'should parse response body in JSON' do
    json_response = @mapper.send(:parse_response, @petr4_json)
    assert_equal(json_response['chart']['result'][0]['indicators']['quote'][0]['open'][5], 36.5)
  end

  test 'should map from response json to object' do
    @mapper.map
    assert_not_nil(@mapper.asset_data)
    assert_equal(21, @mapper.asset_data.size)

    asset_dto = @mapper.asset_data[5]
    assert_equal('PETR4.SA', asset_dto.symbol)
    assert_equal(36.5, asset_dto.price)
    assert_equal('2022-10-24', asset_dto.date.to_s)
  end
end