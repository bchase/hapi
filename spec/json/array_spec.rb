require 'spec_helper'

describe Hapi::JSON::Array do
  let(:json_file) { File.open(File.expand_path('../../json/cards.json', __FILE__)) }

  let(:json)  { json_file.readlines.join }

  let(:parsed_json) { JSON.parse json }

  let(:array) { Hapi::JSON::Array.new parsed_json }

  # require 'pry'; binding.pry

  subject { array }

  context 'its elements are of class JSON::Object' do
    its(:last) { should be_a Hapi::JSON::Object }
  end

end
