class VotersController < ApplicationController
    
    before_filter :initialize_voter
    
    def initialize_voter
        @voter = Voter.new
    end
    
    include #??
    
    def signup
        
    end
    
    def voter_params
        params.require(:voter).permit(:name, :password_digest, :password, :password_confirmation, :email)
    end
    
    def create
        
        @voter = Voter.new(voter_params)
        
        @voter.email = @voter.email.downcase
        
        if @voter.save
            session[:voter_id] = @voter.id # log in

            render "signup_success" 
            else
            render "signup_failure"
        end
        
        # render plain: params[:artist].inspect
        # render "signup_success"
        
    end
    
    def index
        
    end
    
end
