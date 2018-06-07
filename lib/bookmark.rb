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

  def self.create(options)
    return false unless is_url?(options[:url])
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    result = connection.exec("INSERT INTO bookmarks (url) VALUES('#{options[:url]}');")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI.regexp(%w[http https])}\z/
  end
end
