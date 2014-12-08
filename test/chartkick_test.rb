require "test_helper"
require 'date'

class TestChartkick < Minitest::Test
  include Chartkick::Helper

  # TODO actual tests

  def setup
    @data = [[34, 42], [56, 49]] 
  end

  def test_line_chart
    assert line_chart(@data)
  end

  def test_pie_chart
    assert pie_chart(@data)
  end

  def test_column_chart
    assert column_chart(@data)
  end

  def test_timeline_chart
    date_one = Date.new(2014,10,3)
    date_two = Date.new(2014,11,3)
    three_column_data = [['name', date_one, date_two]]
    four_column_data = [['name','comment', date_one, date_two]]
    assert column_chart(three_column_data)
    assert column_chart(four_column_data)
  end
  
  def test_options_not_mutated
    options = {id: "boom"}
    line_chart @data, options
    assert_equal "boom", options[:id]
  end

end
