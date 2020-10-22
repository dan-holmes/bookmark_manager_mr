require "pg"
require_relative "./connection"

class Bookmark
  attr_reader :url, :title

  def self.all
    @connection = PG.connect(dbname: Connection.database_name)
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map { |row|
      Bookmark.new(row["url"], row["title"])
    }
  end

  def self.create(url, title)
    @connection = PG.connect(dbname: Connection.database_name)
    @connection.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');"
  end

  def initialize(url, title)
    @url = url
    @title = title
  end
end
