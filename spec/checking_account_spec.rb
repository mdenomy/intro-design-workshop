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

	describe "Checks for sufficient funds" do

		INITIAL_BALANCE = 100

		before(:each) do
			@account.deposit(INITIAL_BALANCE)
		end 

		it "returns true if sufficient funds" do
			@account.process_check(INITIAL_BALANCE).should be_true
		end

		it "returns false if insufficient funds" do
			@account.process_check(INITIAL_BALANCE + 1).should be_false
		end
	end

end
