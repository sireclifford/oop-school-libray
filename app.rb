require_relative './student'
require_relative './book'
require_relative './teacher'
require_relative './rental'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'No books found' if @books.empty?
    @books.each_with_index { |b, i| puts "#{i}) Title: #{b.title}, Author: #{b.author}" }
  end

  def list_all_people
    puts 'No people exist' if @people.empty?
    @people.each_with_index { |p, i| puts "#{i}) [#{p.class}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" }
  end

  def parent_permission?
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts 'Please enter a valid input'
      parent_permission?
    end

    parent_permission
  end

  def person_choice
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    answer = gets.chomp.to_i

    if [1, 2].include?(answer)
      answer
    else
      puts 'Please enter a valid value (1 or 2)'
      person_choice
    end
  end

  def create_a_person
    answer = person_choice
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case answer
    when 1
      parent_permission = parent_permission?
      @people.push(Student.new(age, name, parent_permission: parent_permission))
      puts "#{name.capitalize} added successfully 💓"
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(age, specialization, name))
    end
  end

  def create_a_book
    puts 'Create a new book'
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))

    puts "#{title} book added successfully 😊"
  end

  def create_a_rental
    puts 'Select a book from the following list by the number:'
    list_all_books

    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by the number (not id):'
    list_all_people

    person_index = gets.chomp.to_i

    puts 'Date:'
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[book_index], @people[person_index]))

    puts 'Rental created successfully 😊'
  end

  def list_all_rentals_for_a_given_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
      puts 'No rentals found' if @rentals.empty?
    end
  end

  def query_method
    puts "Please choose an option by entering a number: \n
    1 - List all books \n
    2 - List all people \n
    3 - Create a person \n
    4 - Create a book \n
    5 - Create a rental \n
    6 - List all rentals for a given person id \n
    7 - exit "
    gets.to_i
  end

  def return_method(input)
    case input
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals_for_a_given_person_id
    end
  end

  def return_error
    puts 'Please enter a valid input'
  end
end
