class UsersController < ApplicationController
    def index 
        
    end
    def new
        @user = User.new
    end

    def create
        # byebug
        @user = User.new(user_params)
        # byebug
        if @user.save
            redirect_to root_path    
        else
            render "new"
        end
    end
    
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end    

    def show 
        # render plain: params[:user].inspect
        @user = User.find(params[:id])
        @posts = @user.posts
    end

    def edit 
        @post = post.find(params[:id])
    end

    # def update
    #     @user = @@current_user
    #     @post = Post.find(params[:id])
    #     if @post.update(post_params)
    #         redirect_to @user    
    #     else
    #         render "new"
    #     end
    # end

    # def post_params
    #     params.require(:post).permit(:content)
    # end

    
end
