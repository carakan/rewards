# frozen_string_literal: true

require 'test_helper'
require 'rack/test'

class RewardsTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_upload_file_and_parse
    path = File.expand_path('./fixtures/file.txt', __dir__)
    file = Rack::Test::UploadedFile.new(path, 'text/plain')
    post '/process', file: file, headers: { 'content-type': 'multipart/form-data' }

    assert last_response.ok?
  end
end
