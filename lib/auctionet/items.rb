module Auctionet
  class Items
    def initialize(items)
      @items = items.map { |item| Item.new(item) }
    end

    def get_item_with_recent_bid
      @items.max_by { |item| item.recent_bid_timestamp }
    end
  end
end
