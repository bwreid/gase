require_relative 'spec_helper'
require_relative '../stock'

describe Stock do
  let(:stock) {Stock.new("AAPL", 500, 10)}
  describe "#current" do
    it "should just check the current value of the stock" do
      value = YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade
      expect(stock.current).to eq value
    end

  end

end
