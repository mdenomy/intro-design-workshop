require 'minimum_balance_fee'

class CheckingAccount

	def initialize(low_balance_fee = nil)
		@balance = 0
		@low_balance_fee = low_balance_fee
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
		@balance -= @low_balance_fee.apply(self) if @low_balance_fee
	end

	private 

	def insufficient_funds?(amount)
		amount > balance
	end

end