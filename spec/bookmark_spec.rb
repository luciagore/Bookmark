require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns all the bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://askjeeves.com"
    end
  end
end
