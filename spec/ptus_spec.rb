require 'stringio'
require 'ptus'

describe "ptus" do
  before(:each) do
    @test_string = "Hello"
    @captured_output = StringIO.new
    @captured_error = StringIO.new
    $stdout = @captured_output
    $stderr = @captured_error
  end

  after(:each) do
    $stdout = STDOUT
    $stderr = STDERR
  end

  def output
    close_and_read(@captured_output)
  end

  def error
    close_and_read(@captured_error)
  end

  def close_and_read(stream)
    stream.close_write
    stream.rewind
    stream.read
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
    error.should match /Change 'ptus' to 'puts' here: .*spec\/ptus_spec.rb:\d+/
  end
end