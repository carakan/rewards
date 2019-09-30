# frozen_string_literal: true

module Rewards
  class Calculator
    attr_reader :tree, :weight
    attr_accessor :results

    def initialize(tree, weight = 1)
      @tree = tree
      @weight = weight
      @results = {}
    end

    def call
      tree.children.each do |node|
        calculate(node)
      end
    end

    private

    def calculate(node)
      if node.has_children?
        node.children.each do |child|
          calculate(child)
          evaluate(node, weight) if child.content
        end
      end
    end

    def evaluate(node, gratification)
      unless node.is_root?
        results[node.name] = 0 if results[node.name].nil?
        results[node.name] += gratification
        evaluate(node.parent, gratification / 2.0)
      end
    end
  end
end
