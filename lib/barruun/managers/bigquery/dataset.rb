require 'shufu'

module Barruun
  module Managers
    module Bigquery
      class Dataset < Barruun::Managers::Base
        def create
          system(command(:create))
        end

        def update
          puts "Nothing to do."
        end

        def exist?
          `#{command(:list)}`.include?(@values[:name])
        end
      end
    end
  end
end
