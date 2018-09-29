class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy

    def index
        @posts = Post.order(updated_at: :desc)
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Post successfully created!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end

    def destroy
        @post.destroy
        flash[:success] = "Post successfully deleted"
        redirect_to request.referrer || root_url
    end

    private

    def post_params
        params.require(:post).permit(:content, :picture)
    end

    def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
    end
end
