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
    rows.each do |row| 
      bookmarks[row['title']] = row['url']
    end
    p bookmarks # this is not what we want to return now. 
    # I think the tests need adjusting to reflect the information 
    # that we want
    # we want the titles rendered on the page, but each one has 
    # the url as a clickable link. We looked at hashes but also
    # could look at arrays.
  end 

  def self.create(url, title)
    @title = title

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else 
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    connection.exec "INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');"
  end

  def self.title
    @title
  end
end 
