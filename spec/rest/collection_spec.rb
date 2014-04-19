require 'spec_helper'

describe Hapi::REST::Collection do
  let(:service_url) { 'http://api.deckbrew.com/mtg' }
  let(:service) { Hapi::Service.new service_url }

  let(:collection) { FooBar = Class.new Hapi::REST::Collection }
  let(:name) { collection.name }

  before do # TODO
    collection.stub(:service).
      and_return(service)
  end

  subject { collection }

  context 'HTTP requests' do
    context 'pathing' do
      describe '.path_name' do
        let(:plural_name) { name.pluralize}
        its(:path_name) { should eq plural_name.underscore }
      end

      describe '.path' do
        let(:path_name) { collection.path_name }
        its(:path) { should eq "/#{path_name}"}
      end

      describe '.url' do
        its(:url) { should eq(service.url + collection.path) }
      end
    end

    before do
      # TODO
      RestClient.stub(:get).
        and_return(true)
    end

    describe '.index' do
      # TODO move to something like:
      #   service.get path
      #   service.cards.index
      it 'makes a GET request to .url' do
        RestClient.
          should_receive(:get).
          with(collection.url)

        collection.index
      end

      it 'instantiates objects of itself for each element in the JSON array result' do
        pending
      end
    end
  end

  context 'HTTP parsing' do
  end
end
