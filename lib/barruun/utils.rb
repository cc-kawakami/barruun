module Barruun
  module Utils
    def initialize(file_path, config_klass = self.class::Config)
      @file_path = file_path
      @config = config_klass.new(YAML.load_file(file_path))
    end

    def call
      if exist?
        puts "#{self.class.name} #{@config.name} already exists. Nothing to do."
      else
        puts "#{self.class.name} #{@config.name} not found."
        create
      end
    end

    def options_string
      @config.options.map { |k, v| "--#{k}=#{v}" }.compact.join(" ")
    end
  end
end
