require 'spec_helper'

describe Auctionet::Stats do
  let(:items) do
    [
      { "id" => 1, "currency" => "SEK", "bids" => [ "timestamp" => 200 ] },
      { "id" => 2, "currency" => "EUR", "bids" => [ "timestamp" => 300 ] },
    ]
  end
  let(:auctionet_stats) { Auctionet::Stats.new }

  before do
    allow(Auctionet::Client).to receive(:items) { items }
  end

  describe "#item_with_recent_bid" do
    it "should return Item class instance" do
      expect(auctionet_stats.item_with_recent_bid).to be_instance_of(Auctionet::Item)
    end

    it "should return the correct item" do
      expect(auctionet_stats.item_with_recent_bid.id).to eq 2
    end
  end

  describe "#sek_over_eur_domination" do
    it "should return 50" do
      expect(auctionet_stats.sek_over_eur_domination).to eq 50
    end
  end

  describe "#take_items" do
    it "should take two items" do
      expect(auctionet_stats.take_items(2).size).to eq 2
    end
  end
end
