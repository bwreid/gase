require_relative 'spec_helper'
require_relative '../client'
require_relative '../portfolio'

describe Client do
  let(:client) { Client.new('X', 400) }

  describe ".new" do

    it "creates a new object" do
      expect(client).to_not eq nil
    end

    it "does NOT have a balance of zero" do
      expect(client.balance).to be > 0
    end

    it "does not have any portfolios" do
      expect(client.portfolios.count).to eq 0
    end

    it "can hold portfolios" do
      client.portfolios[:technology] = Portfolio.new('Technology')
      expect(client.portfolios.count).to eq 1
    end

  end

  describe "#create_portfolio" do
    it "should allow the Client to name and create a new portfolio" do
      client.create_portfolio('Technology')
      expect(client.portfolios[:technology].name).to eq "Technology"
    end
  end

  describe "#buy" do
    it "should allow the client to buy a stock and choose which portfolio to put it into" do
      client.create_portfolio('Technology')
      client.buy("AALP", 400, 1000, "Technology")
      expect(client.portfolios[:technology].stocks.count).to eq 1
      expect(client.portfolios[:technology].stocks[:AALP].bought_at).to eq 400
      expect(client.balance).to eq 0
    end

    it "should ignore the client when s/he tries to put a stock in a non-existent portfolio" do
      client.buy("AALP", 400, 1000, "Technology")
      expect(client.portfolios[:technology]).to eq nil
    end
  end

  describe "#sell" do
    it "should sell the requested stocks at the new value" do
      client.create_portfolio("Technology")
      client.portfolios[:technology].stocks[:AAPL] = Stock.new("AAPL", 10, 10)
      client.sell("AAPL", 5, "Technology")
      expect(client.portfolios[:technology].stocks[:AAPL].num_stocks).to eq 5
      expect(client.balance).to be > 400_000
    end

    it "should ignore Client if they don't have the required amount of stocks" do
      client.create_portfolio("Technology")
      client.portfolios[:technology].stocks[:AAPL] = Stock.new("AAPL", 10, 10)
      client.sell("AAPL", 20, "Technology")
      expect(client.portfolios[:technology].stocks[:AAPL].num_stocks).to eq 10
      expect(client.balance).to eq 400_000
    end
  end
end
