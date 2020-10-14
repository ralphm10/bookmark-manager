require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = [
            'https://www.mixcloud.com/',
            'https://soundcloud.com/'
          ]
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
