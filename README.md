# MisfitActivity

A simple ruby api gem to pull misfit activity data. 

## Installation

Add this line to your application's Gemfile:

    gem 'misfit_activity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install misfit_activity

## Usage

```ruby
# initialize a new MisfitActivity::Client passing the users token
client = MisfitActivity::Client.new(token)

# pull profile information
client.profile

# pull device information
client.device

# pull activity for one specific date
client.activity_on_date(Date.today)

# pull activity for a date range
client.activities_in_range("2014-08-01", "2014-08-15")

``` 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/misfit_activity/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
