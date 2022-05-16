['./book_class', './classroom_class', './person_class', './rental_class', './student_class',
 './teacher_class'].each do |file|
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
      menu
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    menu
  end

  def list_people
    if @people.empty?
      puts "\nThere are not available people"
      menu
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
    menu
  end

  def create_student
    puts 'Provide the student information'
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    @people << Student.new(age, @classroom, parent_permission, name)
    puts 'Person created successfully'
    menu
  end

  def create_teacher
    puts 'Provide the teacher information'
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(specialization, age, name)
    puts 'Person created successfully'
    menu
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

  def create_book
    puts 'Provide book information.'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
    menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      type = person.is_a?(Teacher) ? '[Teacher]' : '[Student]'
      puts "#{index}) #{type} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date (yyyy/mm/dd):'
    date = gets.chomp
    @rentals << @people[person_index].add_rental(date, @books[book_index])
    puts 'Rental created successfully'
    menu
  end

  def list_rental
    if @rentals.empty?
      puts 'No rentals to show'
      menu
    else
      @people.each do |person|
        puts "Name: #{person.name}, ID: #{person.id}"
      end
      print 'Person ID: '
      person_id = gets.chomp.to_i
      puts 'Rentals'
      @rentals.each_with_index do |rental, index|
        if rental[index].person.id == person_id
          puts "Date: #{rental[index].date}, Book: #{rental[index].book.title} by #{rental[index].book.author}"
        end
      end
    end
    menu
  end
end
