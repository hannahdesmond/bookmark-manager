require 'bookmark'

describe Bookmark do
  describe '#all' do 
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")

      expect(Bookmark.all).to include("http://www.makersacademy.com")
      expect(Bookmark.all).to include('http://www.google.com')
      expect(Bookmark.all).to include('http://www.destroyallsoftware.com')
    end
  end 

  describe '#create' do
    it 'adds a new bookmark to the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      rows = connection.exec "SELECT * FROM bookmarks;"
      p rows
      
      Bookmark.create('http://youtube.com')
      expect(Bookmark.all).to include('http://youtube.com')
    end
  end
end 

        
