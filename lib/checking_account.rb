class CheckingAccount

	LOW_BALANCE_FEE = 5
	MINIMUM_BALANCE = 500

	def initialize
		@balance = 0
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
		apply_low_balance_fee
	end

	private 

	def insufficient_funds?(amount)
		amount > balance
	end

	def apply_low_balance_fee
		@balance -= LOW_BALANCE_FEE if @balance < MINIMUM_BALANCE
	end

end