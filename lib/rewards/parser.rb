# frozen_string_literal: true

require 'tree'

module Rewards
  class Parser
    attr_reader :file, :tree

    def initialize(file)
      @file = file
      @tree = Tree::TreeNode.new('ROOT', nil)
    end

    def call
      commands = lines
      commands.each do |command|
        case command[1]
        when 'recommends'
          node = find(command[0])
          if node.nil?
            node = Tree::TreeNode.new(command[0], false)
            tree << node
          end
          child = find(command[2])
          if child.nil?
            node << Tree::TreeNode.new(command[2], false)
          end
        when 'accepts'
          node = find(command[0])
          node.content = true if node
        else
          puts 'no command available'
        end
      end
    end

    # sort lines and parse the files
    def lines
      file.readlines.sort.map { |line| line.split(' ')[2..-1] }
    end

    private
    def find(content)
      tree.find { |node| node.name == content }
    end
  end
end
