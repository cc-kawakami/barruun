RSpec.describe Barruun::Logging::Sink::Config do
  def config
    Barruun::Logging::Sink::Config.new(
      YAML.load_file(File.join(__dir__, '../../../../fixtures/logging/sink.yml')),
      'foo-project'
    )
  end

  describe "destination" do
    it_is_asserted_by { config.destination == "bigquery.googleapis.com/projects/foo-project/datasets/bounces" }
  end
end
