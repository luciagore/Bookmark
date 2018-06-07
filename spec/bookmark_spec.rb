require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all the bookmarks in an array' do
      bookmark1 = Bookmark.create(url: 'http://twitter.com')
      bookmark2 = Bookmark.create(url: 'http://destroyallsoftware.com')
      bookmark3 = Bookmark.create(url: 'http://google.com')

      expected_bookmarks = [
        bookmark1,
        bookmark2,
        bookmark3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end

    describe '.create' do
      it 'creates a new bookmark' do
        bookmark = Bookmark.create(url: 'http://www.testbookmark.com')

        expect(Bookmark.all).to include bookmark
      end
    end

    describe '#==' do
      it 'two bookmarks are equal if their IDs match' do
        bookmark1 = Bookmark.new(1, url: 'http://testbookmark.com')
        bookmark2 = Bookmark.new(1, url: 'http://testbookmark.com')

        expect(bookmark1).to eq bookmark2
      end
    end

    describe '.delete' do
      it 'deletes a bookmark' do
        bookmark = Bookmark.create(url: 'http://instagram.com')
        idnumber = bookmark.id
        Bookmark.delete(idnumber)
        bookmarks = Bookmark.all
        urls = bookmarks.map(&:url)

        expect(urls).not_to include 'http://instagram.com'
      end
    end
  end
end
