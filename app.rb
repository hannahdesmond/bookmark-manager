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
    bookmark = params[:bookmark]
    title = params[:title]
    Bookmark.create(bookmark, title)
    redirect('/bookmarks')
  end

  run! if app_file == $0
end