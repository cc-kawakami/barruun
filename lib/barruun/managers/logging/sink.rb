module Barruun
  module Managers
    module Logging
      class Sink < Barruun::Managers::Base
        def create
          init
          system(command(:create))
        end

        def update
          init
          puts "Nothing to do."
        end

        def init
          @value[:destination] = @value[:destination].gsub(/:PROJECT_ID/, ENV["PROJECT_ID"])
        end

        def exist?
          `#{command(:list)}`.include?(@values[:name])
        end
      end
    end
  end
end
