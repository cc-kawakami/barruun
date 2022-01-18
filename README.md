# Barruun

Barruun is a simple tool for Infrastructure as Code of Google Cloud Platform using `gcloud` command.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'barruun'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install barruun

## Usage

```
Commands:
  barruun help [COMMAND]     # Describe available commands or one specific command
  barruun logging <command>  # Manage Cloud Logging.
  barruun storage <command>  # Manage Cloud Storage.
```

### Logging

```
Commands:
  barruun logging help [COMMAND]   # Describe subcommands or one specific subcommand
  barruun logging sink [FILEPATH]  # Create or update sink.
```

#### Sink

```yaml
name: foobar
destination: bigquery.googleapis.com/projects/#{project_id}/datasets/test
log-filter: 'jsonPayload."event-data":*'
```

### Storage

```
Commands:
  barruun storage bucket [FILEPATH]  # Create or update bucket.
  barruun storage help [COMMAND]     # Describe subcommands or one specific subcommand
```

#### Bucket

```yaml
name: foobarbox
class: regional
bucket-level: 'on'
location: us-central1
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).
