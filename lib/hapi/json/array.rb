module Hapi::JSON
  class Array < Array
    def initialize(*args, &block)
      array = args.first
      array.map! {|item|
        if item.is_a? Hash
          Hapi::JSON::Object.new item 
        else
          item
        end
      }

      super
    end
  end
end
