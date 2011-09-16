require 'stringio'
require 'ptus'

describe "ptus" do
  before(:each) do
    @test_string = "Hello"
    @captured_output = StringIO.new
    $stdout = @captured_output
  end
  
  after(:each) do
    $stdout = STDOUT
  end
  
  def output
    @captured_output.close_write
    @captured_output.rewind
    @captured_output.read
  end
  
  it "should still allow puts to work"do
     puts @test_string
     output.should include @test_string
   end
   
  it "should print the string that is sent to it" do
    ptus @test_string
    output.should include @test_string
  end
  
  it "should print a message saying where the ptus was found" do
    ptus @test_string
    output.should match /Change 'ptus' to 'puts' here: .*spec\/ptus_spec.rb:\d+/
  end
end