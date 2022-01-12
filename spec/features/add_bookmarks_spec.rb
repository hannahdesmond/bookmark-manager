feature "Add bookmarks" do
  scenario "add bookmarks to the bookmark list" do
    visit('/bookmarks')
    fill_in 'Bookmark', with: 'https://youtube.com'
    click_button 'Submit'
    
    connection = PG.connect(dbname: 'bookmark_manager_test')
    bookmarks = connection.exec("SELECT * FROM bookmarks;")
    expect(Bookmark.all).to include('http://youtube.com')
  end
end
