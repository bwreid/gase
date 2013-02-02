require 'rainbow'

def menu
  puts `clear`
  print "*".color(:red) * 100 + "\n"
  puts "Welcome to the General Assembly Stock Exchange Simulation Program".center(100) + "\n\n"
  puts "Please choose an option from below:\n\n"
  puts "(C)reate a new client".color(:red)
  puts "(M)anage your existing account".color(:red) + "\n\n"
  print ">> ".color(:red)
  gets.chomp.downcase
  gets
end