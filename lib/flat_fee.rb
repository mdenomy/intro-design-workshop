class FlatFee

	def initialize(penalty, description)
		@penalty = penalty
		@description = description
	end

	def apply
		@penalty
	end

	def description
		@description
	end
end