require "auctionet/items"
require "auctionet/stats/version"

module Auctionet
  module Stats
    def item_with_recent_bid
      Auctionet::Items.new.get_item_with_recent_bid
    end
  end
end
