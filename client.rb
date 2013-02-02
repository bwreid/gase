require_relative 'Portfolio'
require_relative 'Stock'

class Client
  attr_accessor :name, :balance, :portfolios
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
  end

  def to_s
    "#{@name} has $#{@balance} cash on hand and #{portfolios.count} portfolios."
  end

  def create_portfolio(name)
    @portfolios[name.downcase.to_sym] = Portfolio.new(name.capitalize)
  end

  def buy(stock, initial_value, num_stocks, portfolio)
    if (@portfolios.count != 0) && ((num_stocks * initial_value) <= @balance)
      @balance -= (num_stocks * initial_value)
      @portfolios[portfolio.downcase.to_sym].stocks[stock.upcase.to_sym] = Stock.new(stock, initial_value, num_stocks)
    else
      print "Sorry. Something went wrong."
    end
  end

  def sell(stock, num_stocks, portfolio)
    if @portfolios[portfolio.downcase.to_sym].stocks[stock.upcase.to_sym].num_stocks > num_stocks
      @portfolios[portfolio.downcase.to_sym].stocks[stock.upcase.to_sym].num_stocks -= num_stocks
      @balance += (@portfolios[portfolio.downcase.to_sym].stocks[stock.upcase.to_sym].current * num_stocks)
    else
      puts "Sorry. Something went wrong."
    end
  end

end
