require_relative 'spec_helper'
require_relative '../portfolio'

describe Portfolio do
  let(:portfolio) { Portfolio.new('Technology')}

  describe ".new" do
    it "creates a new portfolio" do
      expect(portfolio).to_not eq nil
    end

    it "checks to make sure balance is 0" do
      expect(portfolio.balance).to eq 0
    end

    it "checks to make sure stocks are empty" do
      expect(portfolio.stocks.count).to eq 0
    end

    it "can you put a stock into the hash" do
      # ADD STOCK TO PORTFOLIO
      portfolio.stocks["AARP"] = 500
      expect(portfolio.stocks.count).to eq 1
    end

  end


end