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
    let(:format) { 'json' }

    context 'pathing' do
      describe '.path_name' do
        let(:plural_name) { name.pluralize}
        its(:path_name) { should eq plural_name.underscore }
      end

      # describe '.format' do
      #   its(:format) { should eq format }
      # end

      describe '.path' do
        let(:path_name) { collection.path_name }
        # its(:path) { should eq "/#{path_name}.#{format}"}
        its(:path) { should eq "/#{path_name}"}
      end

      describe '.url' do
        its(:url) { should eq(service.url + collection.path) }
      end
    end

    let(:json_file) { File.open(File.expand_path('../../json/cards.json', __FILE__)) }
    let(:json) { json_file.readlines.join }

    before do
      # TODO
      RestClient.stub(:get).
        and_return(json)
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
        collection.index.last.should be_a Hapi::JSON::Object
      end
    end
  end
end
