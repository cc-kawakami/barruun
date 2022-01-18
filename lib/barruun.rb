# frozen_string_literal: true

Dir.glob(File.join(File.dirname(__FILE__), 'barruun', '**', '*.rb')).each do |file|
  require_relative file
end

module Barruun
end
