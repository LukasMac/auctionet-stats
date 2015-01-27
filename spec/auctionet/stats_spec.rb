require 'spec_helper'
require 'auctionet/stats'
require 'auctionet/item'
require 'auctionet/client'

include Auctionet::Stats

describe Auctionet::Stats do
  describe '#item_with_recent_bid' do
    let (:items) {
      [ { "id" => 2, "bids" => [ "timestamp" => 200 ] } ]
    }

    before do
      allow(Auctionet::Client).to receive(:items) { items }
    end

    it 'should return Item class instance' do
      expect(item_with_recent_bid).to be_instance_of(Auctionet::Item)
    end

    it 'should return the correct item' do
      expect(item_with_recent_bid.id).to eq 2
    end
  end
end
