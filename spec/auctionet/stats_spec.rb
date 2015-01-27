require 'spec_helper'
require 'auctionet/stats'
require 'auctionet/item'

include Auctionet::Stats

describe Auctionet::Stats do
  describe '#item_with_recent_bid' do
    it 'should return Item class instance' do
      expect(item_with_recent_bid).to be_instance_of(Auctionet::Item)
    end
  end
end
