require_relative "../../configurations/storage/bucket"
require_relative "../utils"

module Barruun
  module Managers
    module Storage
      class Bucket
        include Barruun::Managers::Utils

        def create
          `gcloud alpha storage buckets create #{options_string} #{@config.name}`
        end

        def exist?
          `gcloud alpha storage buckets list --filter='name: #{@config.name}'`.include?(@config.name)
        end
      end
    end
  end
end
