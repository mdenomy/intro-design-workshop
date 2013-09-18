require 'spec_helper'
require 'minimum_balance_fee'

describe "Minimum Balance Fee" do 

	it "there is a penalty if below minimum" do
		account = double(:balance => 499)
		fee = MinimumBalanceFee.new(5, 500)
		fee.calculate(account).should eql 5
	end

	it "no penalty if greater or equal minimum" do
		account = double(:balance => 500)
		fee = MinimumBalanceFee.new(5, 500)
		fee.calculate(account).should eql 0
	end

end
