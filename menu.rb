require 'rainbow'

def main_menu
  puts `clear`
  print "*".color(:red) * 100 + "\n"
  puts "Welcome to the General Assembly Stock Exchange Simulation Program".center(100) + "\n\n"

  if $client_list.length > 0
    print "OUR CLIENTS: ".color(:red)
    short_list = []
    $client_list.values.each do |client_obj|
      short_list << client_obj.name
    end
    puts short_list.sort.join(", ")
    puts
    print "*".color(:red) * 100 + "\n\n"
  end

  puts "Please choose an option from below:\n\n"
  puts "(C)reate a new client".color(:red)
  puts "(M)anage your existing account".color(:red)
  puts "(Q)uit".color(:red) + "\n\n"
  print ">> ".color(:red)
  gets.chomp.downcase
end

def client_menu(client)

  puts `clear`
  print "*".color(:blue) * 100 + "\n"
  puts "Welcome to your terminal, #{client.name}".center(100) + "\n\n"
  puts "Your balance: $#{client.balance}".center(100)

  client_listings(client.portfolios)
  puts

  print "*".color(:blue) * 100 + "\n\n"
  puts "Please choose an option from below:\n\n"
  puts "(C)reate a new portfolio".color(:blue)
  puts "(P)ortfolio stats".color(:blue)
  puts "(F)ind a current stock price".color(:blue)
  puts "(B)uy a Stock".color(:blue)
  puts "(S)ell a Stock".color(:blue)
  puts "(Q)uit".color(:blue) + "\n\n"
  print ">> ".color(:blue)

end
