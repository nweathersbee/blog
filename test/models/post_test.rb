require "test_helper"

describe Post do
  let(:author) { Author.new(:name => 'john') }
  let(:post) {
    Post.new({
      :title  => "POOP",
      :author => author
    })
  }

  it "must be valid" do
    value(post).must_be :valid?
  end

  it "must respond to body" do
    # likely not used amongst community
    value(post).must_respond_to :body
    value(post).must_respond_to :body=
  end

  it "won't be valid without a title" do
    post = Post.new(:author => author)
    value(post).wont_be :valid?
  end

  it "won't be valid without an author" do
    post = Post.new(:title => 'POOP')
    value(post).wont_be :valid?
  end

end
