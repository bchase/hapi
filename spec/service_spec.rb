require 'spec_helper'

describe Hapi::Service do
  # Hapi::Service.new 
  #   accepts a string url for the service
  #   returns a Class that knows about url and provides classes

  let(:url) { 'http://api.deckbrew.com/mtg' }

  let(:service) { Hapi::Service.new url }

  subject { service }

  describe '#url' do
    its(:url) { should eq url }
  end
end
