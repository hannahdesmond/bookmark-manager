require 'bookmark'

describe Bookmark do
  describe '#all' do 
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.google.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com');")

      expect(Bookmark.all).to include("http://www.makersacademy.com")
      expect(Bookmark.all).to include('http://www.google.com')
      expect(Bookmark.all).to include('http://www.destroyallsoftware.com')
    end
  end 
end 

        
