require 'json'

module Auctionet
  class Client
    def self.items
      begin
        data = open(ENV['AUCTIONET_ITEMS_URL']).read
        json_data = JSON.parse data
        json_data['items']
      rescue => e
        {}
      end
    end
  end
end
