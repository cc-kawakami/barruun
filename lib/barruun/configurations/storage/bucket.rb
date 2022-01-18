module Barruun
  module Configurations
    module Storage
      class Bucket
        def initialize(hash)
          @hash = hash
        end

        def name
          @hash["name"]
        end
  
        def options
          @hash.reject { |k| k == "name" }
        end
      end
    end
  end
end
