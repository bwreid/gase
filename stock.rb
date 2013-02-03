require 'YahooFinance'

class Stock
  attr_accessor :name, :bought_at, :num_stocks

  def initialize(name, bought_at, num_stocks)
    @name = name
    @bought_at = bought_at.to_f
    @num_stocks = num_stocks.to_i
  end

  def to_s
    "You have #{@num_stocks} shares of #{@name}."
  end

  def current
    YahooFinance::get_quotes(YahooFinance::StandardQuote, "#{@name}")["#{@name}"].lastTrade
  end
end