class MinimumBalanceFee

	def initialize(penalty, minimum_balance)
		@penalty = penalty
		@minimum_balance = minimum_balance
	end

	def calculate(account)
		return 0 if account.balance >= @minimum_balance
		@penalty
	end

end
