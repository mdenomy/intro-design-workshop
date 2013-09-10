describe "Test suite" do
	it "should pass" do
		"foo".should eql "foo"
	end

	it "should fail" do
		"foo".should eql "bar"
	end
end