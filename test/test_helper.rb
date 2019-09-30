$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "rewards"
require "rewards/parser"
require "rewards/calculator"

require "minitest/autorun"
require 'minitest/byebug'
