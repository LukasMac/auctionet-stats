module Auctionet
  class Items
    def initialize(items)
      @items = items.map { |item| Item.new(item) }
    end

    def get_item_with_recent_bid
      item_with_recent_bid = @items.max_by { |item| item.recent_bid_timestamp }

      if item_with_recent_bid.bids.empty?
        nil
      else
        item_with_recent_bid
      end
    end

    def currency_domination(currency, over_currency)
      50
    end
  end
end
