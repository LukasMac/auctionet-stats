require 'spec_helper'
require 'auctionet/items'

describe Auctionet::Items do
  let(:item_hash) do
    {
      "id" => 1,
      "bids" => [
        { "timestamp" => 200 },
        { "timestamp" => 300 },
      ]
    }
  end
  let(:item_with_recent_bid_hash) do
    {
      "id" => 2,
      "bids" => [
        { "timestamp" => 300 },
        { "timestamp" => 301 },
      ]
    }
  end
  let(:item_with_no_bids_hash) do
    {
      "id" => 2,
      "bids" => [ ],
    }
  end

  describe "#get_item_with_recent_bid" do
    it "should return item that has recent bid" do
      items = Auctionet::Items.new([ item_hash, item_with_recent_bid_hash ])
      expect(items.get_item_with_recent_bid.id).to eq 2
    end

    it "should return nil if there is no item with bids" do
      items = Auctionet::Items.new([ item_with_no_bids_hash ])
      expect(items.get_item_with_recent_bid).to be_nil
    end
  end
end
