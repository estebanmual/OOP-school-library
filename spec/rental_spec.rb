require './rental_class'
require './book_class'
require './person_class'

describe Rental do
  before :each do
    @book = Book.new('title1', 'author1')
    @person = Person.new(20, 'Esteban')
    @rental = Rental.new('2022/05/19', @book, @person)
  end

  it 'Rental should return a rental' do
    expect(@rental).to be_an_instance_of Rental
  end

  it 'Rental should match the date' do
    expect(@rental.date).to eq('2022/05/19')
  end

  it 'Rental should match the book' do
    expect(@rental.book).to eq(@book)
  end

  it 'Rental should match the person' do
    expect(@rental.person).to eq(@person)
  end
end
