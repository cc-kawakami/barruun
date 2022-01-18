require "thor"

module Barruun
  class StorageCommand < Thor
    desc "bucket [FILEPATH]", "Create or update bucket"
    def bucket(file_path)
      Barruun::Managers::Storage::Bucket.new(file_path).call
    end
  end

  class LoggingCommand < Thor
    desc "sink [FILEPATH]", "Create or update sink"
    def sink(file_path)
      Barruun::Managers::Logging::Sink.new(file_path).call
    end
  end

  class CLI < Thor
    def self.exit_on_failure?
      false
    end

    register(StorageCommand, 'storage', 'storage <command>', 'Manage Cloud Storage')
    register(LoggingCommand, 'logging', 'logging <command>', 'Manage Cloud Logging')
  end
end
