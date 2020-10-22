require "sinatra/base"
require_relative "./lib/bookmark"

class BookmarkManager < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post "/bookmarks" do
    Bookmark.create(params[:url_name], params[:bookmark_title])
    redirect "/bookmarks"
  end

  get "/bookmarks/new" do
    erb :form
  end

  run! if app_file == $PROGRAM_NAME
end
