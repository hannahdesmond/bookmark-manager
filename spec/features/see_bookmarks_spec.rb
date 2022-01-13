feature "See all bookmarks" do
  
  scenario 'users can see all titles' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy')")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google')")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software')")

    visit ('/bookmarks')
      expect(page).to have_content("Makers Academy")
      expect(page).to have_content("Destroy All Software")
      expect(page).to have_content("Google")
  end 
end 
