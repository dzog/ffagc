class SessionsController < ApplicationController

def create_artist
    artist = Artist.find_by_email(params[:session][:email])
    if artist && artist.authenticate(params[:session][:password])
        session[:artist_id] = artist.id 
        redirect_to :controller => "artists", :action => "index"
    else
        flash.now.alert = "invalid" #does nothing for us
    end
end

def delete_artist
    session[:artist_id] = ""
    redirect_to :controller => "artists", :action => "index"
end

def create_voter
    voter = Voter.find_by_email(params[:session][:email])
    if voter && voter.authenticate(params[:session][:password])
        session[:voter_id] = voter.id 
        redirect_to :controller => "voters", :action => "index"
    else
        flash.now.alert = "invalid" #does nothing for us
    end
end

def delete_voter
    session[:voter_id] = ""
    redirect_to :controller => "voters", :action => "index"
end

def create_admin
    admin = Admin.find_by_email(params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
        session[:admin_id] = admin.id 
        redirect_to :controller => "admins", :action => "index"
    else
        flash.now.alert = "invalid" #does nothing for us
    end
end

def delete_admin
    session[:admin_id] = ""
    redirect_to :controller => "admins", :action => "index"
end

end
