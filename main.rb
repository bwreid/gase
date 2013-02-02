require 'pry'

require_relative 'func'
require_relative 'menu'

response = menu

while response != 'q'
  if response == 'c'
    create_client
  end
  # MANAGE ACCOUNT

    # CHECK STATS

    # CHECK STOCK

    # CREATE NEW PORTFOLIO

    # BUY STOCK

    # SELL STOCK

  response = menu
end
