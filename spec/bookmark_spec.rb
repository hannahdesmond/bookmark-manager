require 'bookmark'

describe Bookmark do
  describe '#all' do 
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software');")


      expect(Bookmark.all).to include({'Makers Academy' => 'http://www.makersacademy.com'})
      expect(Bookmark.all).to include({'Google' => 'http://www.google.com'})
      expect(Bookmark.all).to include({'Destroy All Software' => 'http://www.destroyallsoftware.com'})
    end
  end 

  describe '#create' do
    it 'adds a new bookmark to the database' do
      Bookmark.create('http://youtube.com', 'YouTube')
      expect(Bookmark.all).to include({'YouTube' => 'http://youtube.com'})
    end
  end

  # describe '#title' do
  #   it 'shows the title for a bookmark' do
  #     Bookmark.create('http://youtube.com', 'YouTube')
  #     expect(Bookmark.title).to eq 'YouTube'
  #   end
  # end
  
end 

        
