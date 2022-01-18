require "yaml"

module Barruun
  module Managers
    module Utils
      def self.included(obj)
        obj.const_set('ConfigFileLoadError', Class.new(RuntimeError))
      end

      def initialize(file_path, config_klass = Object.const_get("#{self.class.name.gsub("Managers", "Configurations")}"))
        @file_path = file_path
        if !File.exists?(@file_path)
          raise self.class::ConfigFileLoadError, "Error loading config file: #{file_path}"
        end
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

      def options_string(options)
        options.map { |k, v| "--#{k}=#{v}" }.compact.join(" ")
      end
    end
  end
end
