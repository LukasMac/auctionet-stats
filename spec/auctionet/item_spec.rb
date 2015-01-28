require 'spec_helper'
require 'auctionet/item'

describe Auctionet::Item do
  let(:item_hash) do
    {
      "id" => 1,
      "currency" => "SEK",
      "bids" => [
        { "amount" => 50, "timestamp" => 200 },
        { "amount" => 100, "timestamp" => 300 },
      ]
    }
  end
  let(:item_with_no_bids_hash) do
    {
      "id" => 1,
      "bids" => [ ],
    }
  end
  let(:item) { Auctionet::Item.new(item_hash) }
  let(:item_with_no_bids) { Auctionet::Item.new(item_with_no_bids_hash) }

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
      expect(item_with_no_bids.recent_bid_timestamp).to eq 0
    end
  end

  describe "#bids" do
    it "should return items bids" do
      expect(item.bids).to eq( [
        { "amount" => 50, "timestamp" => 200 },
        { "amount" => 100, "timestamp" => 300 },
      ] )
    end
  end

  describe "#currency" do
    it "should return item currency" do
      expect(item.currency).to eq "SEK"
    end
  end

  describe "#recent_bid_amount" do
    it "should return recent bid amount" do
      expect(item.recent_bid_amount).to eq 100
    end

    it "should return 0 if item has no bids" do
      expect(item_with_no_bids.recent_bid_amount).to eq 0
    end
  end
end
