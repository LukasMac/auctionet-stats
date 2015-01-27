module Auctionet
  class Item
    def initialize(item)
      @item = item
    end

    def recent_bid_timestamp
      recent_bid = @item["bids"].max_by { |bid| bid["timestamp"] }
      recent_bid["timestamp"]
    end

    def id
      @item["id"]
    end
  end
end
