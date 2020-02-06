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
      counted_items.sum do |item, count|
        Discounter.discount(item, count, pricing_rules.fetch(item))
      end
    end

    private

    def counted_items
      items.group_by(&:itself).map { |k,v| [k, v.length] }.to_h
    end

  end
end
