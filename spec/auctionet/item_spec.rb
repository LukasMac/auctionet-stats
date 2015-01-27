require 'spec_helper'
require 'auctionet/item'

describe Auctionet::Item do
  let(:item) do
    Auctionet::Item.new({
      "id" => 1,
      "bids" => [
        { "timestamp" => 200 },
        { "timestamp" => 300 },
      ]
    })
  end

  describe '#id' do
    it 'should return correct item id' do
      expect(item.id).to eq 1
    end
  end

  describe '#recent_bid_timestamp' do
    it 'should return most recent bid timestamp' do
      expect(item.recent_bid_timestamp).to eq 300
    end
  end
end
