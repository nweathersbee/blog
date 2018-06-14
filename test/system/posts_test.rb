require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post   = posts(:one)
    @author = @post.author
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Blog Posts"
  end

  test "creating a Post with existing author" do
    visit posts_url
    click_on "New Post"

    fill_in "Title", with: @post.title
    fill_in "Body",  with: @post.body

    select @author.name, :from => 'post_author_id'

    click_on "Save Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "creating a Post with new author" do
    visit posts_url
    click_on "New Post"

    fill_in "Title",       with: @post.title
    fill_in "Body",        with: @post.body
    fill_in "author_name", with: 'new author name'

    click_on "Save Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Title", with: 'new title'
    fill_in "Body",  with: 'new body'

    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
