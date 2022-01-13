feature "See all bookmarks" do

  before do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy')")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google')")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software')")

    visit ('/bookmarks')

  end
  
  scenario 'users can see all titles' do
      expect(page).to have_content("Makers Academy")
      expect(page).to have_content("Destroy All Software")
      expect(page).to have_content("Google")
  end 

   scenario 'titles have links' do
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')

   end
 
end 
