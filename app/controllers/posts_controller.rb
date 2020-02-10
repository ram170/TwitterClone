class PostsController < ApplicationController
    def index
        #  @user = User.find(params[:format])
        @posts = Post.all
    end

    def new 
        @user = User.find(params[:format])
    end

    def create 
        # render plain: params[:post].inspect
        @post = Post.new(post_params)
        # byebug
        @post.user_id = @@current_user.id
        @post.save
        redirect_to "/posts/show"
    end

    def post_params
        params.require(:post).permit(:content,params[:user_id])
    end 
    def edit 
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to user_path(@post.user_id)
        else
            render "edit"
        end
    end

    def show 
        @posts = Post.all
        @user = @@current_user
    end

    def destroy
        @post = post.find_by(id: params[:id])
        @post.destroy
        redirect_to user_path(@post.user_id)
    end
end
