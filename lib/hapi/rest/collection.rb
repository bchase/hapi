module Hapi::REST
  class Collection
    def self.service
      client.service
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
      array = Hapi::JSON.parse json
    end

    self.singleton_class.send :alias_method, :all, :index
    self.singleton_class.send :alias_method, :list, :index

  protected
    def self.hash_to_query_params(hash)
      # TODO AS Hash#to_param
      return '' unless hash.present?
      hash.to_a.map {|arr| 
        "#{arr[0]}=#{arr[1]}"
      }.join('&')
    end
  end
end
