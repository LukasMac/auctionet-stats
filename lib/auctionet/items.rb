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
      currency_items_count = @items.count { |item| item.currency == currency }
      over_currency_items_count = @items.count { |item| item.currency == over_currency }

      100 * currency_items_count / (currency_items_count + over_currency_items_count).to_f
    end

    def take(number)
      @items.take(number)
    end
  end
end
