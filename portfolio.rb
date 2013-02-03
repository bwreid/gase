class  Portfolio
  attr_accessor :name, :balance, :stocks
  def initialize(name)
    @name = name
    @balance = 0
    @stocks = {}
  end

  def to_s
    "The #{@name} Portfolio is worth #{balance}."
  end

  def value
    @balance = 0
    @balance = @stocks.keys do |key|
      balance += (@stocks[key].current * @stocks[key].num_stocks)
    end
  end

  def delete_empty
    @stocks.keys do |check|
      @stocks.delete[check] if @stocks[check].num_stocks == 0
    end
  end
end