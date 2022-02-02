require "yaml"

module Barruun
  module Managers
    class Base
      def initialize(values_filepath)
        @values = YAML.load_file(values_filepath).map { |k, v| [k.to_sym, v] }.to_h
      end

      def call
        if exist?
          puts "#{service} #{@values[:name]} already exists."
          update
        else
          puts "#{service} #{@values[:name]} is not found."
          create
        end
      end

      def command(action)
        Shufu::Command.new(
          YAML.load_file(
            File.join(
              __dir__,
              "../schemas/#{self.class.name.downcase.split("::")[2..3].join("/")}/#{action}.yml"
            )
          )
        ).to_s(@values)
      end

      def service
        self.class.name.downcase.split("::")[2]
      end

      def create
      end

      def update
      end
    end
  end
end
