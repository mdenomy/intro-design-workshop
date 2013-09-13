require 'minimum_balance_fee'

class CheckingAccount

	LOW_BALANCE_FEE = 5
	MINIMUM_BALANCE = 500

	def initialize
		@balance = 0
		@low_balance_fee = MinimumBalanceFee.new(LOW_BALANCE_FEE, MINIMUM_BALANCE)
	end

	def balance
		@balance
	end

	def deposit(amount)
		@balance += amount
	end

	def process_check(amount)
		return false if insufficient_funds?(amount)
		@balance -= amount
	end

	def apply_fees
		@balance -= @low_balance_fee.apply(self)
	end

	private 

	def insufficient_funds?(amount)
		amount > balance
	end

end