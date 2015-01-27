require "auctionet/items"
require "auctionet/stats/version"

module Auctionet
  module Stats
    def item_with_recent_bid
      Items.new(Client.items).get_item_with_recent_bid
    end
  end
end
