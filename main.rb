require 'pry'

require_relative 'func'
require_relative 'menu'

$client_list = {:bryan => Client.new('Bryan', 400_000)}
$client_list[:bryan].portfolios[:tech] = Portfolio.new("Tech")
$client_list[:bryan].portfolios[:banks] = Portfolio.new("Banks")
$client_list[:bryan].portfolios[:banks].stocks[:BOVA] = Stock.new("BOVA", 2, 100)

response = main_menu

while response != 'q'
  if response == 'c'
    create_client
  end

  if response == 'm'
    puts "What's the client's name?"
    name = gets.chomp.downcase.to_sym
    if $client_list[name]

      client = $client_list[name]
      portfolios = client.portfolios # START WITH THIS!

      while response != 'q'

        client_menu(client)

        if response == 'c' # CREATE A NEW PORTFOLIO
          print "Name of portfolio: ".color(:blue)
          name = gets.chomp
          client.create_portfolio(name)
          puts "Your portfolio has been created."
        end

        if response == 'p' # CHECK PORTFOLIO STATISTICS
          portfolio_totals(client, portfolios)
        end

        if response =='f' # CHECK FOR A CURRENT STOCK PRICE
          print "What stock to check? ".color(:blue)
          check_stock = gets.chomp.upcase
          current_value = gen_stock_check(check_stock)
          puts "The price of #{check_stock} is $#{current_value}."
        end

        if response == 'b' # BUY STOCK
          print "Choose the portfolio where this stock will go. "
          portfolio = gets.chomp.downcase.to_sym
          print "What stock would you like to buy? ".color(:blue)
          check_stock = gets.chomp.upcase
          current_value = gen_stock_check(check_stock)
          puts "The price of #{check_stock} is currently $#{current_value}."
          print "How many shares would you like to buy? ".color(:blue)
          shares = gets.chomp.to_i
          puts client.buy(check_stock, current_value, shares, portfolio)
        end


        if response == 's' # SELL STOCK
          print "What portfolio are you selling from? "
          portfolio = gets.chomp.downcase.to_sym
          print "What stock would you like to sell? ".color(:blue)
          stock = gets.chomp.upcase
          current_value = gen_stock_check(stock)
          puts "You would make $#{current_value - portfolios[portfolio].stocks[stock.to_sym].bought_at} off of each share. You have #{portfolios[portfolio].stocks[stock.to_sym].num_stocks} shares."
          print "How many shares would you like to sell? ".color(:blue)
          shares = gets.chomp.to_i
          value = client.sell(stock, shares, portfolio)
          puts "Thank you! You're cash balance is now: " + "#{value}.".color(:yellow)
        end

        response = gets.chomp.downcase

      end
    end
  end
  response = main_menu
end
