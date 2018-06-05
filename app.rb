require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkApp < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  run! if app_file == $0

end
