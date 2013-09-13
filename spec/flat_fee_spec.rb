require 'spec_helper'
require 'flat_fee'

describe "Flat Fee" do

	it "unconditionally applies a penalty" do
		fee = FlatFee.new(5, "Online banking fee")
		fee.apply.should eql 5
	end

	it "has a description" do
		fee = FlatFee.new(5, "Online banking fee")
		fee.description.should eql "Online banking fee"
	end

end