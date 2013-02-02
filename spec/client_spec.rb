require_relative 'spec_helper'
require_relative '../gase'

describe Client do
  let(:client) {Client.new('Joe')}

  describe ".new" do
    it "create client" do
      expect(client).to_not eq nil
    end
    it "has no portfolios" do
      expect(client.portfolio.count).to eq 0
    end
  end
  #test client exists

  describe "#new" do
    it "has a name" do
      expect(client.name).to eq 'Joe'
    end
  end
  #test name exists

  describe "#create_portfolio" do
  it "create a portfolio" do
    client.create_portfolio('AARP', 500)
    expect(client.portfolio['Joe']).to eq 500
    end
  end

  describe "#balance" do
   it "test" do
    portfolio.create_portfolio('AARP', 500)
    portfolio.balance('AARP', 500)
    expect(portfolio.balance['AARP']).to eq 500
    end
  end
end
