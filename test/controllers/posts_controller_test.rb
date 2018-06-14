require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post        = posts(:one)
    @author      = @post.author
    @post_params = {
      post: {
        :title       => 'hello',
        :body        => 'nice to see you',
        :author_id   => @author.id,
        :author_name => @author.name
      }
    }
  end
  subject{ @post }

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should show post" do
    get post_url(subject)
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(subject)
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: @post_params
    end

    assert_redirected_to Post.last

    missing_author_id_params = {
      post: {
        :title       => 'hello',
        :body        => 'nice to see you',
        :author_name => @author.name
      }
    }
    assert_difference('Post.count') do
      post posts_url, params: missing_author_id_params
    end

    assert_redirected_to Post.last
  end

  test "should update post" do
    patch post_url(subject), params: @post_params
    assert_redirected_to Post.last
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(subject)
    end

    assert_redirected_to posts_url
  end

end
