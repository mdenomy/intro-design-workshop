class FlatFee

	def initialize(penalty, description)
		@penalty = penalty
		@description = description
	end

	def calculate(account=nil)
		@penalty
	end

	def description
		@description
	end
end
