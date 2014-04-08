require 'minitest/autorun'
require 'minitest/redgreen'
require 'stringio'

class TestMinitestRedgreen < Minitest::Test
  def setup
    @iostream = StringIO.new
  end

  def test_passing
    Minitest::Redgreen.new(@iostream).print('.')
    @iostream.rewind
    output = @iostream.read
    assert_equal "\e[32m.\e[0m", output, "'#{output.inspect}' should be a green '.'"
  end

  def test_failing
    Minitest::Redgreen.new(@iostream).print('F')
    @iostream.rewind
    output = @iostream.read
    assert_equal "\e[31mF\e[0m", output, "'#{output.inspect}' should be a red 'F'"
  end

  def test_erring
    Minitest::Redgreen.new(@iostream).print('E')
    @iostream.rewind
    output = @iostream.read
    assert_equal "\e[35mE\e[0m", output, "'#{output.inspect}' should be a magenta 'E'"
  end

  def test_skipping
    Minitest::Redgreen.new(@iostream).print('S')
    @iostream.rewind
    output = @iostream.read
    assert_equal "\e[33mS\e[0m", output, "'#{output.inspect}' should be a yellow 'S'"
  end
end
