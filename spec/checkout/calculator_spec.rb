require 'spec_helper'
require 'checkout/calculator'

RSpec.describe Checkout::Calculator do
  describe '#price' do

    subject(:price) { calculator.price }

    let(:calculator) { Checkout::Calculator.new(items, pricing_rules) }

    let(:items) do
      [
        :apple,
        :orange,
        :pear
      ]
    end

    let(:pricing_rules) do
      {
        apple: 10,
        orange: 20,
        pear: 15,
      }
    end

    context 'when no discount should be applied' do
      it 'returns standard price' do
        expect(price).to eq(45)
      end
    end

  end
end
