require 'spec_helper'

describe Hapi::Service do
  let(:url) { 'http://api.deckbrew.com/mtg' }

  let(:service) { Hapi::Service.new url }

  subject { service }

  describe '#url' do
    its(:url) { should eq url }
  end

  # TODO move to something like:
  #   service.cards.index
  #   ?
  describe '#get' do
    let(:json) { {a:'b'}.to_json }

    let(:path) { '/foo/bar' }

    before do
      # TODO
      RestClient.stub(:get).
        and_return(json)
    end

    subject { service.get path }
    it { should eq json }
    it 'makes a GET request to the provided path using RestClient' do
      RestClient.
        should_receive(:get).
        with(url + path)

      service.get path
    end
  end
end
