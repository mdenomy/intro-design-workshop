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

	describe 'Apply fees' do

		it 'applies $5 fee if balance is below $500' do
			account = CheckingAccount.new( MinimumBalanceFee.new(5, 500))
			account.deposit(499)
			account.apply_fees
			account.balance.should eql 494
		end

		it 'student account minimum password is $100' do
			minimum_balance_fee = MinimumBalanceFee.new(5, 100)
			account_in_good_standing = CheckingAccount.new(minimum_balance_fee)
			account_in_good_standing.deposit(100)
			account_in_good_standing.apply_fees
			account_in_good_standing.balance.should eql 100

			low_balance_student_account = CheckingAccount.new(minimum_balance_fee)
			low_balance_student_account.deposit(99)
			low_balance_student_account.apply_fees
			low_balance_student_account.balance.should eql 94
		end

		it 'big spender account minimum password is $1000' do
			minimum_balance_fee = MinimumBalanceFee.new(5, 1000)
			account_in_good_standing = CheckingAccount.new(minimum_balance_fee)
			account_in_good_standing.deposit(1000)
			account_in_good_standing.apply_fees
			account_in_good_standing.balance.should eql 1000

			low_balance_student_account = CheckingAccount.new(minimum_balance_fee)
			low_balance_student_account.deposit(999)
			low_balance_student_account.apply_fees
			low_balance_student_account.balance.should eql 994
		end

	end

end
