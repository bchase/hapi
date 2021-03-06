module Hapi::REST
  class Collection < Hapi::JSON::Object
    def self.service
      @@service
    end

    def self.path_name
      name.pluralize.underscore
    end

    # def self.format
    #   'json'
    # end

    def self.path(params=nil)
      # "/#{path_name}.#{format}"
      path  = "/#{path_name}"
      path += "?#{hash_to_query_params(params)}" if params
      path
    end

    def self.url
      service.url + path
    end

    def self.index(params=nil)
      json  = service.get path(params)
      # TODO 
      #   use Hapi::JSON::Array
      #   parse JSON there in .initialize
      array = JSON.parse json
      array.map {|item| new item}
    end

  protected
    def self.hash_to_query_params(hash)
      return '' unless hash.present?
      hash.to_a.map {|arr| 
        "#{arr[0]}=#{arr[1]}"
      }.join('&')
    end
  end
end
