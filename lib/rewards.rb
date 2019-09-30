require 'rewards/version'
require 'rewards/parser'
require 'rewards/calculator'

require 'sinatra'

post 'process' do
  halt(404, { message:'file Not Found'}.to_json) unless params[:file]

  parsed = Rewards::Parser.new(params[:file][:tempfile]).call
  calculator = Rewards::Calculator.new(parsed.tree).call

  calculator.results.to_json
end
