require 'spec_helper'

describe Hapi::JSON::Object do
  let(:json_file) { File.open(File.expand_path('../../json/cards.json', __FILE__)) }

  let(:json)  { json_file.readlines.join }

  let(:array_json) { JSON.parse json }

  let(:klass) { Card = Class.new Hapi::JSON::Object }
  let(:card)  { klass.new array_json.last }

  # require 'pry'; binding.pry

  subject { card }

  context 'string attribute value' do
    let(:name) { 'Aesthir Glider' }
    its(:name) { should eq name }
  end

  context 'array attribute value' do
    let(:types) { ["artifact", "creature"] }
    its(:types) { should eq types }
  end

  context 'hash attribute value' do
    let(:formats)  {
      {"commander"=>"legal", "legacy"=>"legal", "vintage"=>"legal"}
    }
    its(:formats) { should be_a Hapi::JSON::Object }
    its(:formats) { should eq formats }
  end

  context 'objects in attribute arrays' do
    let(:edition) { card.editions.last }
    subject { edition }
    require 'pry'
    it { binding.pry; should be_a Hapi::JSON::Object }
  end

  # => {
  #     "types"=>["artifact", "creature"],
  #   "name"=>"Aesthir Glider",
  # "formats"=>{"commander"=>"legal", "legacy"=>"legal", "vintage"=>"legal"},
  #        "editions"=>
  #          [{
  #                                               "image_url"=>"https://image.deckbrew.com/mtg/multiverseid/3040.jpg",
end
