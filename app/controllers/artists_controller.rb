class ArtistsController < ApplicationController
    
  before_filter :initialize_user

  def initialize_user
    @artist = Artist.new
  end

  include
    
  def signup
  
  end

  def artist_params
    params.require(:artist).permit(:name, :password_digest, :password, :password_confirmation, :email, :contact_name, :contact_phone, :contact_street, :contact_city, :contact_state, :survey_has_attended_firefly)
  end

  def create

   @artist = Artist.new(artist_params)

   @artist.email = @artist.email.downcase

   if @artist.save
    session[:artist_id] = @artist.id # log in
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
