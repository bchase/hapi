module Hapi::JSON
  class Array < Array
    def initialize(*args, &block)
      array = args.first
      if array.any?{|item| item.is_a? Hash}
        array.map! {|item|
          if item.is_a? Hash
            Hapi::JSON::Object.new item 
          else
            item
          end
        }
      end

      super
    end
  end
end
