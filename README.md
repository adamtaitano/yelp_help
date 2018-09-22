# YelpHelp

YelpHelp is a basic command-line interface that scrapes data from a specific search query using yelp.com.
YelpHelp asks the user for their location and a type of business to provide recommendations. It then uses nokogiri and open-uri to extract data from a specific yelp search query, formating and presenting the data to the user. In other words, it's similar to using yelp, but performed in the terminal as a CLI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yelp_help'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yelp_help

## Usage

This CLI is a final project for the Flatiron Web Developer Online Course. It demonstrates the student's ability to create a command-line interface, create Class objects that interact and inheret with each other, and scrape and format data from a webpage without using an API.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'adamtaitano'/yelp_help. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the YelpHelp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'adamtaitano'/yelp_help/blob/master/CODE_OF_CONDUCT.md).
