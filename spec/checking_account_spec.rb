require 'spec_helper'
require 'checking_account'

describe "CheckingAccount" do 

	before(:each) do
		@account = CheckingAccount.new
	end

	it "has an initial balance of 0" do
		@account.balance.should eql 0
	end

	it 'takes deposits' do
		@account.deposit(100)
		@account.balance.should eql 100
	end

	it "processes checks" do
		@account.deposit(100)
		@account.process_check(60)
		@account.balance.should eql 40
	end

	it "returns true if sufficient funds" do
		@account.deposit(100)
		@account.process_check(100).should be true
	end

	it "returns false if insufficient funds" do
		@account.deposit(100)
		@account.process_check(101).should be false
	end

end
