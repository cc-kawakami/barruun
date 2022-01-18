require "thor"

module Barruun
  class StorageCommand < Thor
    desc "bucket [FILEPATH]", "Create bucket"
    def bucket(file_path)
      Barruun::Managers::Storage::Bucket.new(file_path).call
    end
  end

  class LoggingCommand < Thor
    desc "sink [FILEPATH]", "Create sink"
    def sink(file_path)
      Barruun::Managers::Logging::Sink.new(file_path).call
    end
  end
  
  class BigqueryCommand < Thor
    desc "dataset [FILEPATH]", "Create dataset"
    def sink(file_path)
      Barruun::Managers::Bigquery::Dataset.new(file_path).call
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
