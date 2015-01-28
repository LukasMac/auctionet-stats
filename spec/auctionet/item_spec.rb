require 'spec_helper'
require 'auctionet/item'

describe Auctionet::Item do
  let(:item_hash) do
    {
      "id" => 1,
      "bids" => [
        { "timestamp" => 200 },
        { "timestamp" => 300 },
      ]
    }
  end
  let(:item_with_no_bids_hash) do
    {
      "id" => 1,
      "bids" => [ ],
    }
  end
  let(:item) do
    Auctionet::Item.new(item_hash)
  end

  describe "#id" do
    it "should return correct item id" do
      expect(item.id).to eq 1
    end
  end

  describe "#recent_bid_timestamp" do
    it "should return most recent bid timestamp" do
      expect(item.recent_bid_timestamp).to eq 300
    end

    it "should return 0 if item has no bids" do
      item_with_no_bids = Auctionet::Item.new(item_with_no_bids_hash)
      expect(item_with_no_bids.recent_bid_timestamp).to eq 0
    end
  end

  describe "#bids" do
    it "should return items bids" do
      expect(item.bids).to eq( [
        { "timestamp" => 200 },
        { "timestamp" => 300 },
      ] )
    end
  end
end
