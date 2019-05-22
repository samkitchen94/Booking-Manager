require 'pg'

class Bookmark
  
  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    result = con.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    insert = con.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end

end
  