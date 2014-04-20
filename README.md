# Hapi

Quickly build Ruby clients for RESTful HTTP APIs

## Under Construction

This is presently an experimental project, only being used to consume a rudimentary API. As such, the gems constraints are as follows:

1. makes no use of API keys
2. JSON only
3. RESTful GET actions only (index/show, list/read)

## Installation

Add this line to your application's Gemfile:

    gem 'hapi', github: 'bchase/hapi'

And then execute:

    $ bundle

## Usage

```ruby
module MTG
  class Card < Hapi::REST::Collection
    def self.service
      @@service ||= Hapi::Service.new 'https://api.deckbrew.com/mtg'
    end
  end
end

cards = MTG::Card.index page: 1

card  = cards.first
name  = card.name
image = card.editions.last.image_url

```

## Contributing

1. Fork it ( http://github.com/bchase/hapi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
