# Contacts Importer

Import contacts from csv files.


## Requeriments

* Ruby 2.7+
* Rails 6+
* Postgres 1.1+


## Installation and Init

Make sure that you have installed the requirements before cloning:

1. Clone the repository: `git clone https://github.com/nathsotomayor/contacts_importer.git`
2. Go to the folder: `cd contacts_importer`
3. Install requirements `bundle install`
4. Create the data base `rails db:create`
5. Run the migrations `rails db:migrate`
6. Run the server: `rails s -b 0.0.0.0 -p 3000`

In the browser get into the URL `127.0.0.1:3000` or app live demo [link](https://csv-importer-nathsotomayor.herokuapp.com/) to start the web app.


## Usage

Sign up with a new account to access into the app.

Inside the **`csv_files`** folder you can found some files to test the app, also you can create a new `csv` file taking into account the format rules.

**All fields are requiered**

| Column | Format |
| ------ | ------ |
| Name	| Cannot have special characters, only accepts the `-` and alphanumeric characters |
| Telephone | 	Only `(+00) 000-000-00-00` or `(+00) 000 000 00 00` formats are allowed |
| Email | 	Must have the structure `example@example.com` |
| Address | 	Can't be empty |
| Birthday | 	Only `YYYYMMDD` or `YYYY-MM-DD` formats are allowed |
| Credit card number | 	Length and issuer have to be valid |


## App Live Demo

Check the app live in Heroku here [App Link](https://csv-importer-nathsotomayor.herokuapp.com/)


## Tests

The tests were implemented under the RSpec testing framework for Rails with the `rspec-rails` gem

To run the tests use the following options:

```bash
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