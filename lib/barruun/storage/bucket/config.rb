module Barruun
  module Storage
    class Bucket
      class Config
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
