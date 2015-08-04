class ProfilesController < ApplicationController
    def new
        #form where each user can fill out their profile
        @user = User.find(params[:user_id])
        @profile = @user.build_profile 
    end
    
    def create
        @user = User.find(params[:user_id])
        @profile = @user.build_profile(profile_prams)
        if @profile.save
            flash[:success] = "Profile updated!"
            redirect_to user_path( params[:user_id])
        else
            render action: :new
        end
    end
    
    private
        def profile_prams
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
end