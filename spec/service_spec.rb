require 'spec_helper'

describe Hapi::Service do
  let(:url) { 'http://api.deckbrew.com/mtg' }

  let(:service) { Hapi::Service.new url }

  subject { service }

  describe '#url' do
    its(:url) { should eq url }
  end
end
