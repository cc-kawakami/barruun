module Barruun
  module Logging
    class Sink
      include Barruun::Utils

      def create
        `gcloud logging sinks create #{@config.name} #{@config.destination} #{options_string}`
      end

      def exist?
        `gcloud logging sinks list --filter='name: #{@config.name}'`.include?(@config.name)
      end
    end
  end
end
