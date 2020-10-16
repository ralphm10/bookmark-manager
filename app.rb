require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/create'
  end

  post '/bookmarks' do
    p params
    Bookmark.create(params[:URL])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
