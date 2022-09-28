require_relative 'nameable'
# Person class
class Person
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', _parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(person)
puts capitalized_trimmed_person.correct_name
