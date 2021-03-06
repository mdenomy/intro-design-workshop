require 'spec_helper'
require 'flat_fee'

describe "Flat Fee" do

	it "unconditionally applies a penalty" do
		fee = FlatFee.new(5, "Online banking fee")
		fee.calculate.should eql 5
	end

	it "has a description" do
		fee = FlatFee.new(5, "Online banking fee")
		fee.description.should eql "Online banking fee"
	end

	it "does nothing with the account" do
		account = double
		fee = FlatFee.new(5, "Online banking fee")
		fee.calculate(account).should eql 5
	end

end
