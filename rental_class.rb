class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rental << self
    person.rental << self
  end

  def to_json(*_args)
    { date: @date, book: @book, person: @person }.to_json
  end
end
