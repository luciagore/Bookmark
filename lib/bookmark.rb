require 'pg'

class Bookmark
  # def initialize(url = nil)
  #   @url = url
  # end
  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end

    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |link| link['url'] }
  end
end
