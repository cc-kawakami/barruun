module Barruun
  module Configurations
    module Logging
      class Sink
        class ProjectIDNotProvidedError < RuntimeError; end

        def initialize(hash, project_id = ENV["PROJECT_ID"])
          @hash = hash
          @project_id = project_id

          if @project_id.nil?
            raise ProjectIDNotProvidedError, "Project ID not provided"
          end
        end

        def name
          @hash["name"]
        end

        def destination
          @hash["destination"].gsub(":PROJECT_ID", @project_id)
        end

        def options
          @hash.reject { |k, v| %w(name destination).include?(k) }
        end
      end
    end
  end
end
