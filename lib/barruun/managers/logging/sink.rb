require_relative "../../configurations/logging/sink"
require_relative "../utils"

module Barruun
  module Managers
    module Logging
      class Sink
        include Barruun::Managers::Utils

        def create
          `gcloud logging sinks create #{@config.name} #{@config.destination} #{options_string(@config.options)}`
        end

        def exist?
          `gcloud logging sinks list --filter='name: #{@config.name}'`.include?(@config.name)
        end
      end
    end
  end
end
