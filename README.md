# email_spy

A simple gem that allows you to catch emails sent from your Rails app into your browser.

Based entirely on letter_opener, with bug fixes and real versioning.

## Installation

Add this line to your application's Gemfile:

    gem 'email_spy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emailspy

## Usage

To start using email_spy simply add this line to your `config/environments/development.rb` file:

``` ruby
  config.action_mailer.delivery_method = :email_spy
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
