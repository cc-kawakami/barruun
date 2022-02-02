require "shufu"

module Barruun
  module Managers
    module Storage
      class Bucket < Barruun::Managers::Base
        def create
          system(command(:create))
        end

        def exist?
          `#{command(:list)}`.include?(@values[:name])
        end
      end
    end
  end
end
