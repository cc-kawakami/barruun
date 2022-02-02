require "thor"

module Barruun
  class StorageCommand < Thor
    desc "bucket [FILEPATH]", "Create bucket"
    def bucket(values_filepath)
      Barruun::Managers::Storage::Bucket.new(values_filepath).call
    end
  end

  class LoggingCommand < Thor
    desc "sink [FILEPATH]", "Create sink"
    def sink(values_filepath)
      Barruun::Managers::Logging::Sink.new(values_filepath).call
    end
  end
  
  class BigqueryCommand < Thor
    desc "dataset [FILEPATH]", "Create dataset"
    def dataset(values_filepath)
      Barruun::Managers::Bigquery::Dataset.new(values_filepath).call
    end
  end

  class CLI < Thor
    def self.exit_on_failure?
      false
    end

    register(StorageCommand, 'storage', 'storage <command>', 'Manage Cloud Storage')
    register(LoggingCommand, 'logging', 'logging <command>', 'Manage Cloud Logging')
    register(BigqueryCommand, 'bigquery', 'bigquery <command>', 'Manage BigQuery')
  end
end
