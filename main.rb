#!/usr/bin/env ruby
require './app'

# rubocop:disable Metrics/CyclomaticComplexity
def options(option)
  case option
  when 1
    @app.list_books
  when 2
    @app.list_people
  when 3
    @app.create_person
  when 4
    @app.create_book
  when 5
    @app.create_rental
  when 6
    @app.list_rental
  when 7
    @app.save_files
    puts 'Thanks for using the app :)'
  else
    puts 'Invalid option.'
    menu
  end
end

# rubocop:enable Metrics/CyclomaticComplexity

def menu
  loop do
    puts "\n\nPlease choose an option by enterin a number:"
    puts '1.- List all books'
    puts '2.- List all people'
    puts '3.- Create a person'
    puts '4.- Create a book'
    puts '5.- Create a rental'
    puts '6.- List all rentals for a given person id'
    puts '7.- Exit'
    print '> '
    option = gets.chomp.to_i
    options(option)
    return 'Thanks for using the app' if option == 7
  end
end

def main
  puts '----------------------'
  puts '| School library app |'
  puts '----------------------'

  puts "\nWelcome to the school library app!"

  @app = App.new
  menu
end

main
