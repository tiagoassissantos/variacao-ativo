require "test_helper"

class GetAssetTest < ActiveSupport::TestCase
  setup do
    @asset_get = Asset::Get.new
  end

  test 'should get yahoo finance asset' do
    response = @asset_get.from_yahoo_finance('PETR4.SA')
    assert_equal response.status, 200
    assert_not_nil response.body
  end

  test 'should return 404 from yahoo finance if asset not found' do
    response = @asset_get.from_yahoo_finance('ABCD4')
    assert_equal response.status, 404
  end
end