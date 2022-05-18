['./book_class', './classroom_class', './person_class', './rental_class', './student_class',
 './teacher_class', 'json'].each do |file|
  require file
end

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @classroom = Classroom.new('1-A')
    @rentals = []
    @people = []
  end

  def list_books
    if @books.empty?
      puts "\nThere are not available books"

    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts "\nThere are not available people"

    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def student_details
    puts 'Provide the student information'
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    [age, name, parent_permission]
  end

  def create_student
    age, name, parent_permission = student_details

    @people << Student.new(age, @classroom, parent_permission, name)
    puts 'Person created successfully'
  end

  def teacher_details
    puts 'Provide the teacher information'
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    [age, name, specialization]
  end

  def create_teacher
    age, name, specialization = teacher_details

    @people << Teacher.new(specialization, age, name)
    puts 'Person created successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    [1, 2].include?(type)
    case type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option.'
      create_person
    end
  end

  def book_details
    puts 'Provide book information.'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_book
    title, author = book_details
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def book_select
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    print '> '
    gets.chomp.to_i
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      type = person.is_a?(Teacher) ? '[Teacher]' : '[Student]'
      puts "#{index}) #{type} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    print '> '
    gets.chomp.to_i
  end

  def create_rental
    person_index = select_person
    book_index = book_select

    print 'Date (yyyy/mm/dd):'
    date = gets.chomp
    @rentals << @people[person_index].add_rental(date, @books[book_index])
    puts 'Rental created successfully'
  end

  def list_rental
    if @rentals.empty?
      puts 'No rentals to show'

    else
      @people.each do |person|
        puts "Name: #{person.name}, ID: #{person.id}"
      end
      print 'Person ID: '
      person_id = gets.chomp.to_i
      puts 'Rentals'
      @rentals.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
  end

  def save_books(filename = 'books.json')
    File.write(filename, @books.to_json)
  end

  def save_people(filename = 'people.json')
    File.write(filename, @people.to_json)
  end

  def save_rentals(filename = 'rentals.json')
    File.write(filename, @rentals.to_json)
  end

  def save_files
    save_books
    save_people
    save_rentals
  end

  def load_books(filename = 'books.json')
    JSON.parse(File.read(filename)).each do |book|
      @books << Book.new(book['title'], book['author'])
    end
  end

  def load_people(filename = 'people.json')
    JSON.parse(File.read(filename)).each do |person|
      if person['type'] == 'teacher'
      @people << Teacher.new(person['specialization'], person['age'], person['name'])
      else 
      @people << Student.new(person['age'], Classroom.new(person['classroom']), person['parent_permission'], person['name'])
      end
    end
  end

  def load_rentals(filename = 'rentals.json')
    JSON.parse(File.read(filename)).each do |rental|
      person = @people.find{|individual| individual.name = rental['person']['name']}
      book = @books.find{|tome| tome.title = rental['book']['title']}
      @rentals << Rental.new(rental['date'], book, person)
    end
  end

end
