# email_spy

A simple gem that allows you to catch emails sent from your Rails app into your browser.

Based entirely on [letter_opener](http://github.com/ryanb/letter_opener), with pull requests, bug fixes, and real versioning.


## Installation

Add this line to your application's Gemfile:

    gem 'email_spy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_spy


## Usage

To start using email_spy simply add this line to your `config/environments/development.rb` file:

``` ruby
  config.action_mailer.delivery_method = :email_spy
```

That's it!
Whenever your development mode application sends an email through action_mailer it'll open the *default browser*.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Credits

I give a huge amount of credit to Ryan Bates for building [letter_opener](http://github.com/ryanb/letter_opener).
I grabbed his code, refactored the entire thing, added all the below contributors open pull requests, and fixed the bugs in the open bug list.
Oh and I released it as the proper 1.* version it should be.
Note: 95% of the pull requested code was entirely rewritten as well.

  * davidcornu for [this](https://github.com/ryanb/letter_opener/pull/36)
  * domrout for [this](https://github.com/ryanb/letter_opener/pull/35)
  * nikitachernov for [this](https://github.com/ryanb/letter_opener/pull/34)
  * bjhess for [this](https://github.com/ryanb/letter_opener/pull/24)
  * ryanlecompte for [this](https://github.com/ryanb/letter_opener/pull/21)

