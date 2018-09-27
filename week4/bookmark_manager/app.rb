require 'sinatra/base'
require_relative './lib/bookmark'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    if Bookmark.create(title: params['title'], url: params['url'])
      redirect '/bookmarks'
    else
      flash[:notice] = "Invalid URL"
      redirect '/bookmarks/new'
    end
  end

  run! if app_file == $0
end
