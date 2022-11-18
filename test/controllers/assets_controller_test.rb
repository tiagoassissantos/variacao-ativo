require "test_helper"

class AssetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/assets?symbol=VALE3.SA'
    assert_response :success
  end

  test "should get index with json body" do
    get '/assets?symbol=VALE3.SA'
    prices_json = response.parsed_body
    assert_equal 30, prices_json.size
  
    assert_equal 1, prices_json[0]['day']
    assert_equal 1.31, prices_json[1]['d1_variation']
    assert_equal 1.31, prices_json[1]['total_variation']
  end
end
