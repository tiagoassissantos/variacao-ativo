require "test_helper"

class GetAssetTest < ActiveSupport::TestCase
  setup do
    @service = Asset::Get.new
    @petr4_json = File.read("test/fixtures/files/petr4.json")
  end

  test 'should get yahoo finance asset' do
    response = @service.get_asset('PETR4.SA')
    assert_equal response.status, 200
    assert_not_nil response.body
  end

  test 'should parse response body in JSON' do
    json_response = @service.parse_response(@petr4_json)
    assert_equal(json_response['chart']['result'][0]['indicators']['quote'][0]['open'][12], 27.25)
  end

  test 'should return empty JSON when request error' do
    json_response = @service.parse_response(@petr4_json)
    assert_equal(json_response, {})
  end
end