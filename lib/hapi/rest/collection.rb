module Hapi::REST
  class Collection < Hapi::JSON::Object
    def self.service
      @@service
    end

    def self.path_name
      name.pluralize.underscore
    end

    def self.format
      'json'
    end

    def self.path
      "/#{path_name}.#{format}"
    end

    def self.url
      service.url + path
    end

    def self.index
      json  = RestClient.get url
      array = JSON.parse json
      array.map {|item| new item}
    end
  end
end
