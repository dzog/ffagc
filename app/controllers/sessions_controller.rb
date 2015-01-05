class SessionsController < ApplicationController

def create

    artist = Artist.find_by_email(params[:session][:email])
    if artist && artist.authenticate(params[:session][:password])
        session[:artist_id] = artist.id 
        redirect_to root_url, notice:"Logged in!"
    else
        flash.now.alert = "invalid"
    end
end

end