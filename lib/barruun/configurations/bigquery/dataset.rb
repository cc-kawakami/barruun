module Barruun
  module Configurations
    module Bigquery
      class Dataset
        def initialize(hash)
          @hash = hash
        end

        def name
          @hash["name"]
        end
  
        def options
          @hash.reject { |k| ["name"].include?(k) }
        end
      end
    end
  end
end
