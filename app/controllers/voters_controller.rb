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
        @grant_submissions = GrantSubmission.where(grant_id: [1,2]) #lace and temple only for now

        @votes = Hash.new

        @grant_submissions.each do |gs|
            vote = Vote.where("voter_id = ? AND grant_submission_id = ?", current_voter.id, gs.id).take

            if(!vote)
                vote = Vote.new
                vote.voter_id = current_voter.id
                vote.grant_submission_id = gs.id
                vote.save
            end

            @votes[gs.id] = vote

        end
        
    end

  def vote
      @grant_submissions = GrantSubmission.where(grant_id: [1,2]) #lace and temple only for now

      @grant_submissions.each do |gs|
          vote = Vote.where("voter_id = ? AND grant_submission_id = ?", current_voter.id, gs.id).take
          vote.score_t = params['t'][gs.id.to_s]
          vote.score_c = params['c'][gs.id.to_s]
          vote.score_f = params['f'][gs.id.to_s]
          vote.save

      end

      redirect_to action: "index"

    end
    
end
