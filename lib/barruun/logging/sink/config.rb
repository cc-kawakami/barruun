module Barruun
  module Logging
    class Sink
      class Config
        def initialize(hash, project_id = ENV["PROJECT_ID"])
          @hash = hash
          @project_id = project_id
        end

        def name
          @hash["name"]
        end

        def destination
          @hash["destination"].gsub("\#\{project_id\}", @project_id)
        end

        def options
          @hash.reject { |k, v| %w(name destination).include?(k) }
        end
      end
    end
  end
end
