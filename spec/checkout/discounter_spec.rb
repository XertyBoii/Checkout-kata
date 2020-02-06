require 'spec_helper'
require 'checkout/discounter'

RSpec.describe Checkout::Discounter do
  describe '#discount' do

    subject(:discount) { Checkout::Discounter.discount(item, count, price) }

    let(:item) { :apple }
    let(:count) { 1 }
    let(:price) { 10 }

    context 'when no discount applies' do
      it 'returns standard price' do
        expect(discount).to eq(10)
      end
    end

    context 'when a two_for_one discount applies' do

      let(:items) do
        [
          :apple,
          :apple
        ]
      end

      it 'returns the price of one apple' do
        expect(discount).to eq(10)
      end
    end

  end
end
