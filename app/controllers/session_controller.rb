class SessionController < ApplicationController 
   skip_before_action :verify_authenticity_token
    
    def new
    
    end
  
  
    def create
  
      @user = User.find_by(:email => params[:email])
      if !@user
        @error = "Account not found. Please try again."
        render :new
      elsif !@user.authenticate(params[:password])
        @error = "Incorrect password. Please try again."
        render :new
      else
        #log in
        session[:user_id] = @user.id
        redirect_to meetups_path
      end
    end
  
    #logout
    def destroy
      session.clear
      redirect_to meetups_path
    end



end
