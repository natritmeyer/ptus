require 'stringio'
require 'ptus'

describe "ptus" do
  before(:each) do
    @captured_output = StringIO.new
    $stdout = @captured_output
  end
  
  after(:each) do
    $stdout = STDOUT
  end
  
  it "should still allow puts to work"
  it "should print the string that is sent to it" do end
  it "should print a message saying where the ptus was found" do end
end