require 'pg'

class Bookmark

  # def initialize(url = nil)
  #   @url = url
  # end

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
  end

end
