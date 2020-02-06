require_relative 'checkout/calculator'

class Checkout
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    Calculator.price(basket, prices)
  end

  private

  def basket
    @basket ||= Array.new
  end

end
