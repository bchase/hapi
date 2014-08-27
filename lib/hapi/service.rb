module Hapi
  # TODO move to Hapi::REST::Service ?
  Service = Struct.new(:url, :client) do
    def get(path)
      req_url = (url + path).to_s
      http_client.get req_url do |resp, req|
        client.request  = req
        client.response = resp
      end
    end

  private
    def http_client
      RestClient
    end
  end
end
