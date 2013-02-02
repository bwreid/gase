require_relative 'spec_helper'
require_relative '../portfolio'
require_relative '../client'

describe Client do
  let(:client) {Client.new('Joe', 400_000)}

  describe ".new" do
    it "create client" do
      expect(client).to_not eq nil
    end
    it "has no portfolios" do
      expect(client.portfolios.count).to eq 0
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
    client.create_portfolio('TeChnOlogy')
    puts client.portfolios
    expect(client.portfolios[:technology].name).to eq "Technology"
    end
  end

  describe "#balance" do
   it "check to make sure client's portfolio does indeed equal 0 " do
    client.create_portfolio('AARP')
    client.portfolios[:aarp].balance = 500
    puts client.portfolios
    expect(client.portfolios[:aarp].balance).to eq 500
    end
  end
end
