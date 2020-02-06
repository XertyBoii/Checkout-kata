require 'pry'

class Checkout
  class Discounter

    def self.discount(item, count, price)
      new.discount(item, count, price)
    end

    def discount(item, count, price)
      0
    end

    private

    def discounts
      # this method could be replaced by a DB connection
      {
        apple: :two_for_one,
        pear: :two_for_one,
        banana: :half_price,
      }
    end
  end
end
