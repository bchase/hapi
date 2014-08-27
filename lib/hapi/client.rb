require 'uri'

module Hapi
  class Client
    def initialize
      @host        = URI.parse @@host
      @collections = @@collections
      define_collection_classes
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

    def define_collection_classes
      @collections.each do |col_sym|
        self.class.parent.const_set \
          collection_class_name(col_sym), 
          new_collection_class
      end
    end

    def collection_class_name(col_sym)
      col_sym.to_s.classify
    end

    def new_collection_class
      client = self

      Class.new Hapi::REST::Collection do
        define_singleton_method :client do
          client
        end
      end
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
