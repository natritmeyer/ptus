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
  
  it "should still allow puts to work"do
     puts "hello"
     @captured_output.close_write
     @captured_output.rewind
     @captured_output.read.should include "hello"
   end
   
  it "should print the string that is sent to it" do
    ptus "hello"
    @captured_output.close_write
    @captured_output.rewind
    @captured_output.read.should include "hello"
  end
  
  it "should print a message saying where the ptus was found" do
    ptus "hello"
    @captured_output.close_write
    @captured_output.rewind
    @captured_output.read.should match /Change 'ptus' to 'puts' here: .*spec\/ptus_spec.rb:29/
  end
end