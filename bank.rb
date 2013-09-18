require_relative 'lib/flat_fee'
require_relative 'lib/minimum_balance_fee'
require_relative 'lib/checking_account'

def account_factory(type=nil)
	case type
	when :student
		CheckingAccount.new([MinimumBalanceFee.new(5, 250), FlatFee.new(10, "Online banking fee"), FlatFee.new(3, "Maintenance fee")])
	when :big_spender
		CheckingAccount.new(MinimumBalanceFee.new(10, 5000))
	else
		CheckingAccount.new([MinimumBalanceFee.new(5, 500), FlatFee.new(5, "Maintenance fee")])
	end
end

def describe(name, account)
	initial_balance = account.balance
	account.apply_fees
	puts "#{name} opened an account with $#{initial_balance} and after fees were applied the balance is $#{account.balance}"
end

puts "----------------------------------------------------------"
mr_1_percent = account_factory(:big_spender)
mr_1_percent.deposit(10000)
describe("Mr. One Percent", mr_1_percent)

joe_student = account_factory(:student)
joe_student.deposit(100)
describe("Joe Student", joe_student)

jane_doe = account_factory
jane_doe.deposit(750)
describe("Jane Doe", jane_doe)
puts "----------------------------------------------------------"

