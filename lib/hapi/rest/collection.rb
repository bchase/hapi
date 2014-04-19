module Hapi::REST
  class Collection
    def service
      @@service
    end

    def self.path_name
      name.pluralize.underscore
    end

    def self.path
      "/#{path_name}"
    end

    def self.url
      service.url + path
    end
  end
end
