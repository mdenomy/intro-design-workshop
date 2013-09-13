require 'minimum_balance_fee'

class CheckingAccount

	LOW_BALANCE_FEE = 5
	MINIMUM_BALANCES = { default: 500, student: 100, big_spender: 1000}

	def initialize(level = :default)
		@balance = 0
		@low_balance_fee = MinimumBalanceFee.new(LOW_BALANCE_FEE, MINIMUM_BALANCES[level])
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