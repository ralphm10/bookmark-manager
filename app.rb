require 'sinatra/base'
require './lib/bookmark'
require './database_connection_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions, :method_override

  get '/bookmarks' do
    @bookmarks = Bookmark.all

    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    if (params[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/).nil?
      flash[:notice] = 'Please enter correct url'
    else
      Bookmark.create(url: params[:url], title: params[:title])
    end
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  run! if app_file == $PROGRAM_NAME
end
