require "test_helper"

class PriceTest < ActiveSupport::TestCase
  test "should not save if register already exists" do
    params = {symbol: 'PETR4.SA', date: Date.strptime('1666353600', '%s'), price: 123.45}
    Price.create(params)
    price = Price.create(params)

    assert_nil(price.id)
  end
end
