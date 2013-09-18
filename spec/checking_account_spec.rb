require 'spec_helper'
require 'checking_account'
require 'minimum_balance_fee'
require 'flat_fee'

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

	describe 'Apply fees' do

		it 'applies minimum balance fee' do
			account = CheckingAccount.new( MinimumBalanceFee.new(5, 500))
			account.deposit(499)
			account.apply_fees
			account.balance.should eql 494
		end

		it 'applies multiple fees' do
			fees = [MinimumBalanceFee.new(5, 500), FlatFee.new(2, "Monthly service charge"), FlatFee.new(10, "Online banking fee")]
			account = CheckingAccount.new(fees)
			account.deposit(499)
			account.apply_fees
			account.balance.should eql 482
		end
	end

end
