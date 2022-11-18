class AssetsController < ApplicationController
  def index
    prices = Price.last_thirty(params['symbol'])
    if prices.empty?
      render status: :not_found
      return
    end
    prices_array = Asset::Map.new.from_active_record(prices)
    render json: prices_array, status: :ok
  end
end
