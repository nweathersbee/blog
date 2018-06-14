class PostsController < ApplicationController
  layout "basic_layout"

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    if !post_create_params['author_id'].to_s.empty?
      author_id = post_create_params['author_id']
    else
      author = Author.new(:name => post_create_params['author_name'])
      author.save
      author_id = author.id
    end

    @post = Post.new.tap do |p|
      p.title     = post_create_params['title']
      p.body      = post_create_params['body']
      p.author_id = author_id
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post,
                    :notice => 'Post was successfully created.') }
        format.json { render :json => @post,
                    :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end

  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_update_params)
        format.html { redirect_to(@post,
                    :notice => 'Post was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end

  end

  def destroy
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.destroy
        format.html { redirect_to(posts_path,
                    :notice => 'Post was successfully destroyed.') }
        format.json { head :no_content }
      else
        format.json { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end

  end

  private

  def post_create_params
    params.require(:post).permit(:title, :body, :author_id, :author_name)
  end

  def post_update_params
    params.require(:post).permit(:title, :body)
  end

end
