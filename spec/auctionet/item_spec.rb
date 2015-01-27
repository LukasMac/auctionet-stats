require 'spec_helper'
require 'auctionet/item'

describe Auctionet::Item do
  let(:item) do
    Auctionet::Item.new({
      "id" => 1,
      "bids" => [
        { "timestamp" => 123 },
        { "timestamp" => 124 },
      ]
    })
  end

  describe '#id' do
    it 'should return correct item id' do
      expect(item.id).to eq 1
    end
  end
end
