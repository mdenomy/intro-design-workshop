require 'minimum_balance_fee'

class CheckingAccount

	LOW_BALANCE_FEE = 5
	DEFAULT_MINIMUM_BALANCE = 500
	STUDENT_MINIMUM_BALANCE = 100
	BIG_SPENDER_MINIMUM_BALANCE = 1000

	def initialize(level = nil)
		@balance = 0
		case level
		when :student
			@low_balance_fee = MinimumBalanceFee.new(LOW_BALANCE_FEE, STUDENT_MINIMUM_BALANCE)
		when :big_spender
			@low_balance_fee = MinimumBalanceFee.new(LOW_BALANCE_FEE, BIG_SPENDER_MINIMUM_BALANCE)
		else
			@low_balance_fee = MinimumBalanceFee.new(LOW_BALANCE_FEE, DEFAULT_MINIMUM_BALANCE)
		end
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