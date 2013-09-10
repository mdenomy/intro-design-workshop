require 'spec_helper'
require 'checking_account'

describe "CheckingAccount" do 

	it "has an initial balance of 0" do
		account = CheckingAccount.new
		account.balance.should eql 0
	end

end
