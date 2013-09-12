class CheckingAccount

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
		@balance -= 5 if @balance < 500
	end

	private 

	def insufficient_funds?(amount)
		amount > balance
	end

end