# require 'fetching'
# Fetching.from_json json

require 'hapi/json/array'
require 'hapi/json/object'

module Hapi
  module JSON
    def self.parse(json)
      json = ActiveSupport::JSON.decode json

      if json.respond_to? :keys
        Hapi::JSON::Object.new json
      else
        Hapi::JSON::Array.new json
      end
    end
  end
end
