require 'json'
require './book_class'

 books = JSON.parse(File.read('books.json'))


books.each do |book|
    p book['author']
end

