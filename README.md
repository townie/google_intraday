# GoogleIntraday

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_intraday'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_intraday

## Usage

```ruby
data = GoogleIntraday::Client.fetch_6s_ticks("GOOG")
day = GoogleIntraday::Day.build(data)

day.to_csv
day.to_hash
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/google_intraday/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
