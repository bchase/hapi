require 'fetching'

module Hapi
  module JSON
    def self.parse(json)
      Fetching.from_json json
    end
  end
end
