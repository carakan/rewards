# frozen_string_literal: true

require 'minitest/autorun'

class ParserTest < Minitest::Test
  def test_sort_file_correctly
    file = File.expand_path('../fixtures/file.txt', __dir__)
    parser = ::Rewards::Parser.new(File.open(file))
    parser.call
    assert parser.tree.to_json ===
           '{"name":"ROOT","content":null,"json_class":"Tree::TreeNode","children":[{"name":"A","content":false,"json_class":"Tree::TreeNode","children":[{"name":"B","content":true,"json_class":"Tree::TreeNode","children":[{"name":"C","content":true,"json_class":"Tree::TreeNode","children":[{"name":"D","content":true,"json_class":"Tree::TreeNode"}]}]}]}]}'
    assert parser.tree.to_h ==
           {
             'ROOT' => {
               ['A', false] => { ['B', true] => { ['C', true] => { ['D', true] => {} } } }
             }
           }
  end
end
