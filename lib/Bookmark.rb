require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else 
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    rows = connection.exec "SELECT * FROM bookmarks;"
    bookmarks = {}
    rows.each { |row| bookmarks[row['title']] = row['url']; p row['title']}
  end 

  def self.create(url, title)
    @title = title

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else 
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    connection.exec "INSERT INTO bookmarks (url) VALUES('#{url}');"
  end

  def self.title
    @title
  end
end 
