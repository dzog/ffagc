class ArtistController < ApplicationController
  def signup
  
  end

  def create
   # @artist = Artist.new(params[:artist])

   # @artist = Artist.create(params[:artist])

   @artist = Artist.new
   @artist.name = params[:artist][:name]
   @artist.email = params[:artist][:email]

   if @artist.save
     render "signup_success"
   else
     render "signup_failure"
   end

   # render plain: params[:artist].inspect
   # render "signup_success"
   
  end

end
