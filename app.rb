require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end 

  post '/add' do
    # open the connection
    # add to the database  
  end

  run! if app_file == $0
end