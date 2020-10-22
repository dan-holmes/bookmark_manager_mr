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
  it "can delete a bookmark" do
    Bookmark.create("http://www.myspace.com", "MySpace")
    Bookmark.delete(1)
    expect(Bookmark.all).to be_empty
  end
end
