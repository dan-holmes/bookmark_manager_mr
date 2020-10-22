feature "delete" do
  scenario "User can delete each bookmark by clicking a delete link next to the name" do
    clear_database
    Bookmark.create("http://www.facebook.com", "Facebook")
    Bookmark.create("http://www.myspace.com", "MySpace")
    visit("/bookmarks")
    within("#bookmarks-list") do
      find(:css, "li.bookmark", text: "MySpace").click_button("Delete")
    end
    expect(page).not_to have_content("MySpace")
    expect(page).to have_content("Facebook")
  end
end
