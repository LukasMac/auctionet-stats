require 'json'

module Auctionet
  class Client
    def self.items
      data = open("https://auctionet.com/api/v2/items.json").read
      json_data = JSON.parse data
      json_data['items']
    end
  end
end
