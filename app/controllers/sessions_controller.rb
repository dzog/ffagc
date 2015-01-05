class SessionsController < ApplicationController

def create_artist
    artist = Artist.find_by_email(params[:session][:email])
    if artist && artist.authenticate(params[:session][:password])
        session[:artist_id] = artist.id 
        redirect_to root_url, notice:"Logged in!" #note: redirects to root
    else
        flash.now.alert = "invalid" #does nothing for us
    end
end

def create_voter
    voter = Voter.find_by_email(params[:session][:email])
    if voter && voter.authenticate(params[:session][:password])
        session[:voter_id] = voter.id 
        redirect_to root_url, notice:"Logged in!" #note: redirects to root
    else
        flash.now.alert = "invalid" #does nothing for us
    end
end

def create_admin
    admin = Admin.find_by_email(params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
        session[:admin_id] = admin.id 
        redirect_to root_url, notice:"Logged in!" #note: redirects to root
    else
        flash.now.alert = "invalid" #does nothing for us
    end
end

end
