class Checkout
  class Discounter

    attr_reader :item, :count, :price
    private :item, :count, :price

    def initialize(item, count, price)
      @item = item
      @count = count
      @price = price
    end

    def self.discount(item, count, price)
      new(item, count, price).discount
    end

    def discount
      if should_discount?
        discounted_price
      else
        price * count
      end
    end

    private

    def should_discount?
      case discounts.fetch(item, nil)
      when :two_for_one
        count >= 2 # at least 2
      when :half_price
        true #always half price, no requirements
      when :restricted_half_price
        true # even when restricted it should still discount always
      when :three_for_two
        count >= 3 # at least 3
      else
        false
      end
    end

    def discounted_price
      case discounts.fetch(item, nil)
      when :two_for_one
        price * (count / 2)
      when :half_price
        (price / 2) * count
      when :restricted_half_price
        price * (count - 1) + (price / 2)
      when :three_for_two
        (price * count) - (price * (count / 3))
      end
    end

    def discounts
      # this method could be replaced by a DB connection
      {
        apple: :two_for_one,
        pear: :two_for_one,
        banana: :half_price,
        pineapple: :restricted_half_price,
        mango: :three_for_two,
      }
    end
  end
end
