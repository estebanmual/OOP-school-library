require '../book_class'

describe Book do
    before :each do
        @book=Book.new('title1','author1')
    end

    it 'Return a book' do
        expect(@book).to be_an_instance_of Book
    end

    it 'Book should have a title' do
        expect(@book.title).to eq('title1')
    end

    it 'Book should have an author' do
        expect(@book.author).to eq('author1')
    end
end