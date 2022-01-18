RSpec.describe Barruun::Storage::Bucket do
  let(:file_path) { "spec/fixtures/storage/bucket.yml" }
  let(:bucket) { Barruun::Storage::Bucket.new(file_path) }

  describe "exist?" do
    it_is_asserted_by { bucket.exist? == false }
  end

  describe "options_string" do
    it_is_asserted_by {
      bucket.options_string == "--class=regional --bucket-level=on --location=us-central1"
    }
  end
end
