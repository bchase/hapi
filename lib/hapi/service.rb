module Hapi
  # TODO move to Hapi::REST::Service ?
  Service = Struct.new(:url) do
    # TODO could be done by delegation
    def get(path)
      http_client.get url + path
    end

  private
    def http_client
      RestClient
    end
  end
end
