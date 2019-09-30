# frozen_string_literal: true

require 'bundler/setup'
require 'rewards/version'
require 'rewards/parser'
require 'rewards/calculator'
require 'sinatra'

post '/process' do
  halt(404, { message: 'file Not Found' }.to_json) unless params[:file]

  parser = Rewards::Parser.new(params[:file][:tempfile])
  parser.call
  calculator = Rewards::Calculator.new(parser.tree)
  calculator.call

  calculator.results.to_json
end

get '/process' do
  erb :upload
end

__END__

@@upload
<form action='/process' enctype="multipart/form-data" method='POST'>
    <input name="file" type="file" />
    <input type="submit" value="process" />
</form>
