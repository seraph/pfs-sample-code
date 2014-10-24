class UsersController < SecureApplicationController
    
    def index
        if params[:name]
            @users = User.where(name: params[:name])
        else
            @users = User.all
        end
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
            #success
            UserMailer.welcome_email(@user).deliver
            redirect_to user_path(@user)
        else
            #fail
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
