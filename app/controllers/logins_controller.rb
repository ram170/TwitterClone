class LoginsController < ApplicationController
    def index 
        @var = User.new
        signout()
    end

    def check
        # render plain: params[:login].inspect
        @temp = 0
        @var =  params.require(:login).permit(:name,:password)
        @user = User.find_by(name: @var[:name])
        @@temp = @user
        if ((@user!=nil) && (@user.password==@var[:password]))
            # debugger
            signin(@user)
            redirect_to @user, notice: "User created successfully"
            # flash.alert="User created successfully"
        else
            @temp = 1
            render "index"
        end
    end
end
