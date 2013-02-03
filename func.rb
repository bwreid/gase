require_relative 'client'

def create_client
  puts
  print "Client name: ".color(:red)
  name = gets.chomp.capitalize
  print "Balance: ".color(:red)
  balance = gets.to_f.round(2)
  $client_list[name.downcase.to_sym] = Client.new(name, balance)
  puts "\n\nA new client was created!"
  gets
end

def client_listings(clients_portfolios)

  if clients_portfolios.count > 0
    puts "PORTFOLIOS & STOCKS".color(:blue)
    clients_portfolios.keys.each do |this|
      print clients_portfolios[this].name + " Portfolio: "
      clients_portfolios[this].stocks.each_key do |each|
        (clients_portfolios[this].stocks[each].num_stocks == 0) ? clients_portfolios[this].stocks.delete(this) : print("#{clients_portfolios[this].stocks[each].name} ")
      end
      puts " "
    end
  end
end

def portfolio_totals(client, portfolios)
  # binding.pry
  portfolios.keys.each do |this|

    p_value = 0
    puts
    this_portfolio = portfolios[this]
    print this_portfolio.name + ": "

    this_portfolio.stocks.keys.each do |x|
      stock = this_portfolio.stocks[x]
      value = stock.current * stock.num_stocks
      p_value += value
      print("#{stock.name}".color(:red) + ": $#{value} | ") if p_value != 0
    end

    puts "($#{p_value})"
  end

end
