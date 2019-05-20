require 'sinatra/base'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Base 

  get '/' do
    erb(:'bookmarks/index')
  end

  get '/bookmarks' do
  	@bookmark = Bookmark.all
  	erb(:bookmarks)
  end

  run! if app_file == $0
end
