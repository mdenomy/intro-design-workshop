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
		return false if amount > balance
		@balance -= amount
		true
	end

end