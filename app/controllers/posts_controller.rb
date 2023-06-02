class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end

end

class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  private

  def authenticate_user
    unless @current_user
      redirect_to login_path
    end
  end
end

# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
end

# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @posts = @current_user.posts
  end

  # Other controller code...
end


