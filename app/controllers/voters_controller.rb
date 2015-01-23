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

    def voter_survey_params
        params.require(:survey).permit(:has_attended_firefly, :not_applying_this_year, :will_read, :will_meet, :has_been_voter, :has_participated_other, :has_received_grant, :has_received_other_grant, :how_many_fireflies)
    end


    def create
        
        @voter = Voter.new(voter_params)
        
        @voter.email = @voter.email.downcase
        
        if @voter.save
            session[:voter_id] = @voter.id # log in

            # save survey
            voter_survey = VoterSurvey.new(voter_survey_params)
            voter_survey.voter_id = @voter.id
            voter_survey.save

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
