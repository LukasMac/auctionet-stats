require 'spec_helper'
require 'auctionet/stats'
require 'auctionet/item'
require 'auctionet/client'

include Auctionet::Stats

describe Auctionet::Stats do
  let (:items) do
    [
      { "id" => 1, "currency" => "SEK", "bids" => [ "timestamp" => 200 ] },
      { "id" => 2, "currency" => "EUR", "bids" => [ "timestamp" => 300 ] },
    ]
  end

  before do
    allow(Auctionet::Client).to receive(:items) { items }
  end

  describe "#item_with_recent_bid" do
    it "should return Item class instance" do
      expect(item_with_recent_bid).to be_instance_of(Auctionet::Item)
    end

    it "should return the correct item" do
      expect(item_with_recent_bid.id).to eq 2
    end
  end

  describe "#sek_over_eur_domination" do
    it "should return 50" do
      expect(sek_over_eur_domination).to eq 50
    end
  end
end
