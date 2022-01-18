require_relative "../../configurations/bigquery/dataset"
require_relative "../utils"

module Barruun
  module Managers
    module Bigquery
      class Dataset
        include Barruun::Managers::Utils

        def create
          `bq #{location_string} mk --dataset #{options_string(@config.options)} #{@config.name}`
        end

        def exist?
          `bq ls`.include?(@config.name)
        end
      end
    end
  end
end
