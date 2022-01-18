# frozen_string_literal: true

require_relative "lib/barruun/version"

Gem::Specification.new do |spec|
  spec.name = "barruun"
  spec.version = Barruun::VERSION
  spec.authors = ["cc-kawakami"]
  spec.email = ["kawakami-moeki@colorfulcompany.co.jp"]

  spec.summary = "Barruun is a simple tool for Infrastructure as Code of Google Cloud Platform using `gcloud` command.
"
  spec.description = "Barruun is a simple tool for Infrastructure as Code of Google Cloud Platform using `gcloud` command.
"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["source_code_uri"] = "https://github.com/colorfulcompany/barruun"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", "~> 1.1"
end
