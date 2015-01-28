module Auctionet
  class Item
    def initialize(item)
      @item = item
    end

    def recent_bid_timestamp
      return 0 if @item["bids"].empty?

      recent_bid["timestamp"]
    end

    def id
      @item["id"]
    end

    def bids
      @item["bids"]
    end

    def currency
      @item["currency"]
    end

    def recent_bid_amount
      return 0 if @item["bids"].empty?

      recent_bid["amount"]
    end

    private

    def recent_bid
      @item["bids"].max_by { |bid| bid["timestamp"] }
    end
  end
end
