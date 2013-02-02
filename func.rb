require_relative 'client'

def create_client
  puts
  print "Client name: ".color(:red)
  name = gets.chomp.capitalize
  print "Balance: ".color(:red)
  balance = gets.to_f.round(2)
  Client.new(name, balance)
  puts "\n\nA new client was created!"
  gets
end
