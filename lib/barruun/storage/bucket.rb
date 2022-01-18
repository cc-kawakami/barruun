require_relative "./bucket/config"
require_relative "../utils"

module Barruun
  module Storage
    class Bucket
      include Barruun::Utils

      def create
        system("gcloud alpha storage buckets create #{options_string} #{@config.name}")
      end

      def exist?
        `gcloud alpha storage buckets list --filter='name: #{@config.name}'`.include?(@config.name)
      end
    end
  end
end
