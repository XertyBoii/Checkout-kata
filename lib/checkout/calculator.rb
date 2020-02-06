require_relative 'discounter'

class Checkout
  class Calculator

    attr_reader :items, :pricing_rules
    private :items, :pricing_rules

    def initialize(items, pricing_rules)
      @items = items
      @pricing_rules = pricing_rules
    end

    def price
      undiscounted_price
    end

    private

    def undiscounted_price
      items.sum do |item|
        pricing_rules.fetch(item, 0)
      end
    end
  end
end
