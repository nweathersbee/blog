require "test_helper"

describe Author do
  let(:author) { Author.new(:name => 'jane') }

  it "must be valid" do
    value(author).must_be :valid?
  end

  it "won't be valid without a name" do
    author = Author.new
    value(author).wont_be :valid?
  end

end
