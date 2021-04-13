# Contacts Importer

## Installation, Init and Usage

Make sure that you have installed Rails 6+ and Ruby 2.7+ before cloning:

1. Clone the repository: `git clone https://github.com/nathsotomayor/contacts_importer.git`
2. Go to the folder: `cd contacts_importer`
3. Install requirements `bundle install`
4. Create the data base `rails db:create`
5. Run the migrations `rails db:migrate`
6. Run the server: `rails s -b 0.0.0.0 -p 3000`

In the browser get into the URL `127.0.0.1:3000` to start the web app, create a new account to access or log in with a user provided.

## Tests

The tests were implemented under the RSpec testing framework for Rails with the `rspec-rails` gem

To run the tests use the following options:

```
# Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
$ bundle exec rspec

# Run all spec files in a single directory (recursively)
$ bundle exec rspec spec/models

# Run a single spec file
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb

# Run a single example from a spec file (by line number)
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb:8

# See all options for running specs
$ bundle exec rspec --help
```

To know more about RSpec and `rspec-rails` gem see this links:
[RSpec testing framework](http://rspec.info/)
[rspec-rails documentation](https://github.com/rspec/rspec-rails)