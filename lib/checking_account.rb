class CheckingAccount

	def initialize(fees = nil)
		@balance = 0
		@fees = *fees
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
		@fees.each { |fee| @balance -= fee.calculate(self)} if @fees
	end

	private 

	def insufficient_funds?(amount)
		amount > balance
	end

end
