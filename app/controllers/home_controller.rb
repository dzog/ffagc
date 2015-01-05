class HomeController < ApplicationController    

  helper_method :artist_logged_in?

  #before_filter artist_logged_in?, except: [:show, :index]
    
  def index

    if artist_logged_in?
        puts '~~~~hi'
        puts current_artist.name
    else 
        puts '~~~~bye'
    end

  end

  def hello
    return 'hi'
  end

end
