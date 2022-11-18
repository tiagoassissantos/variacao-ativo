require "test_helper"

class PriceTest < ActiveSupport::TestCase
  test "should not save if register already exists" do
    params = {symbol: 'PETR4.SA', date: Date.strptime('1666353600', '%s'), price: 123.45}
    Price.create(params)
    price = Price.create(params)

    assert_nil(price.id)
  end

  test "should calculate d-1 variation -50%" do
    price = Price.new symbol: 'PETR4.SA', date: Date.strptime('1666353600', '%s'), price: 1
    variation = price.calculate_variation(2)
    assert_equal -50.0, variation
  end

  test "should calculate d-1 variation -1%" do
    price = Price.new symbol: 'PETR4.SA', date: Date.strptime('1666353600', '%s'), price: 0.99
    variation = price.calculate_variation(1)
    assert_equal -1.to_f, variation
  end

  test "should calculate d-1 variation -19%" do
    price = Price.new symbol: 'PETR4.SA', date: Date.strptime('1666353600', '%s'), price: 0.81
    variation = price.calculate_variation(1)
    assert_equal -19.to_f, variation
  end

  test "should calculate d-1 variation 100%" do
    price = Price.new symbol: 'PETR4.SA', date: Date.strptime('1666353600', '%s'), price: 2
    variation = price.calculate_variation(1)
    assert_equal 100.to_f, variation
  end

  test "should calculate d-1 variation 50%" do
    price = Price.new symbol: 'PETR4.SA', date: Date.strptime('1666353600', '%s'), price: 1.5
    variation = price.calculate_variation(1)
    assert_equal 50, variation
  end

  test "should calculate d-1 variation 1%" do
    price = Price.new symbol: 'PETR4.SA', date: Date.strptime('1666353600', '%s'), price: 1.01
    variation = price.calculate_variation(1)
    assert_equal 1.to_f, variation
  end
end
