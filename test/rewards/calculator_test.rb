# frozen_string_literal: true

require 'tree'
require 'minitest/autorun'

class CalculatorTest < Minitest::Test
  def test_calculations
    @tree =
      Tree::TreeNode.from_hash(
        'ROOT' => { ['A', false] => { ['B', true] => { ['C', true] => { ['D', true] => {} } } } }
      )
    calculator = Rewards::Calculator.new(@tree)
    calculator.call
    assert calculator.results == { 'C' => 1, 'B' => 1.5, 'A' => 1.75 }
  end
end
