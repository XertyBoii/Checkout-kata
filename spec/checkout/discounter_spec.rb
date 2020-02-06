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

      let(:count) { 2 }

      it 'returns the price of one apple' do
        expect(discount).to eq(10)
      end
    end

    context 'when a half_price discount applies' do
      let(:item) { :banana }

      it 'returns half the price of one banana' do
        expect(discount).to eq(5)
      end
    end

    context 'when a three_for_two discount applies' do
      let(:item) { :pineapple }
      let(:count) { 3 }

      it 'returns the price of two pineapples' do
        expect(discount).to eq(20)
      end
    end

    context 'when a three_for_two discount applies but we have four items' do
      let(:item) { :pineapple }
      let(:count) { 4 }

      it 'returns the price of three pineapples' do
        expect(discount).to eq(30)
      end
    end

  end
end
