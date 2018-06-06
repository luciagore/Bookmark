require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns all the bookmarks in an array' do
      Bookmark.create(url: 'http://twitter.com')
      Bookmark.create(url: 'http://destroyallsoftware.com')
      Bookmark.create(url: 'http://google.com')

      expected_bookmarks = [
        'http://twitter.com',
        'http://destroyallsoftware.com',
        'http://google.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end

    describe '#create' do
      it 'creates a new bookmark' do
        Bookmark.create(url: 'http://www.testbookmark.com')

        expect(Bookmark.all).to include 'http://www.testbookmark.com'
      end
    end
  end
end
