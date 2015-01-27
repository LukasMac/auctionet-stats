require 'spec_helper'
require 'auctionet/client'

describe Auctionet::Client do
  describe '.items' do
    it 'should return parsed JSON response' do
      allow(Auctionet::Client).to receive(:open) {
        double('read', read: '{"items": [{"id": 1, "bids": [{"timestamp": 200}]}]}')
      }

      parsed_response = [ { "id" => 1, "bids" => [ "timestamp" => 200 ] } ]
      expect(Auctionet::Client.items).to eq parsed_response
    end
  end
end
