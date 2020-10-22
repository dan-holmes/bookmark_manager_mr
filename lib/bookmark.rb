require "pg"
require_relative "./connection"

class Bookmark
  attr_reader :url, :title, :id

  def self.all
    @connection = PG.connect(dbname: Connection.database_name)
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map { |row|
      Bookmark.new(row["url"], row["title"], row["id"])
    }
  end

  def self.create(url, title)
    @connection = PG.connect(dbname: Connection.database_name)
    @connection.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');"
  end

  def self.delete(id)
    @connection = PG.connect(dbname: Connection.database_name)
    @connection.exec "DELETE FROM bookmarks WHERE id = #{id}"
  end

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end
end
