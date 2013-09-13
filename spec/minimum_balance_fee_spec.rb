require 'spec_helper'
require 'minimum_balance_fee'

describe "Minimum Balance Fee" do 

	it "applies penalty if below minimum" do
		account = double(:balance => 499)
		fee = MinimumBalanceFee.new(5, 500)
		fee.apply(account).should eql 5
	end

	it "applies no penalty if below minimum" do
		account = double(:balance => 500)
		fee = MinimumBalanceFee.new(5, 500)
		fee.apply(account).should eql 0
	end

end
