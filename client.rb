require_relative 'portfolio'

class Client
  attr_accessor :name, :balance, :portfolios
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
  end

  # def portfolios (name, balance)
  #   @portfolios[name] = balance
  # end

  # def stocks (name, balance)
  #   @stocks[]
  # end

end



  # def to_s
  #   "#{@name} has a balance of #{@balance} for #{@portfolios}"
  # end
  # end






