require 'uri'

module Hapi
  class Client
    def initialize
      @host        = URI.parse @@host
      @collections = @@collections
      @collections.each do |col_sym|
        class_name = col_sym.to_s.classify
        klass      = Class.new Hapi::REST::Collection

        self.class.parent.const_set class_name, klass
      end
    end

    attr_reader :host, :collections

    def method_missing(method, *args, &block)
      if collections.include? method
        index method
      else
        super
      end
    end

    def self.host(host=nil)
      @@host = host
    end

    def self.collections(*cols)
      @@collections = cols
    end

  private

    def index(resource_sym)
      url = host + resource_sym.to_s
      `curl #{url}`
    end
  end
end














# module Hapi
#   class Client
#     def initialize(host, &block)
#       @host = host
#       yield self
#     end
#
#     attr_reader :host, :collections
#
#     def has_collections(collection_syms)
#       @collections = collection_syms
#     end
#   end
# end
