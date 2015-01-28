module Auctionet
  module Stats
    def item_with_recent_bid
      Items.new(Client.items).get_item_with_recent_bid
    end

    def sek_over_eur_domination
      Items.new(Client.items).currency_domination("SEK", "EUR")
    end

    def take_items(number)
      Items.new(Client.items).take(number)
    end
  end
end
