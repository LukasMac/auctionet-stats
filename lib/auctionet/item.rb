module Auctionet
  class Item
    def initialize(item)
      @item = item
    end

    def recent_bid_timestamp

    end

    def id
      @item["id"]
    end
  end
end
