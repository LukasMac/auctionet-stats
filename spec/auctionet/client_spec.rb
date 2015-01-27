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

    it 'should return empty hash if API request failed' do
      allow(Auctionet::Client).to receive(:open).and_raise("error")

      expect(Auctionet::Client.items).to eq({})
    end
  end
end
