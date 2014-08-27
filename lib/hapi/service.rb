module Hapi
  # TODO move to Hapi::REST::Service ?
  Service = Struct.new(:url) do
    # TODO could be done by delegation
    def get(path)
      req_url = (url + path).to_s
      http_client.get req_url
    end

  private
    def http_client
      RestClient
    end
  end
end
