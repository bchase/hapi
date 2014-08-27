module Hapi::JSON
  class Object < HashWithIndifferentAccess
    def initialize(json_or_hash)
      case json_or_hash
      when String
        @json = json_or_hash
        @data = ActiveSupport::JSON.parse @json
      when Hash
        @data = json_or_hash
      end

      @keys = @data.keys.map &:to_s

      # TODO make/move to JSON::Array
      # casts objects in attr arrays
      # to JSON::Object
      @data.each do |key, val|
        if val.is_a? ::Array and val.any?{|item| item.is_a? Hash}
          val = Hapi::JSON::Array.new val
        end
      end

      super @data
    end

    def method_missing(*args, &block)
      method_str = args.first.to_s
      if @keys.include? method_str
        value = @data[method_str]
        value = Hapi::JSON::Object.new value if value.is_a? Hash
        value
      else
        super
      end
    end
  end
end
