describe Bookmark do
  before :each do
    clear_database
  end
  it "adds a new bookmark to the database and retrives it using .all" do
    Bookmark.create("http://www.myspace.com", "MySpace")
    bookmarks = Bookmark.all
    bookmark = bookmarks[0]
    expect(bookmark.url).to eq "http://www.myspace.com"
    expect(bookmark.title).to eq "MySpace"
  end
end
