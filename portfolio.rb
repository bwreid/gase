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


end
