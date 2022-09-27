# Person class
class Person
  def initialize(age, name = 'Unknown', _parent_permission: true)
    @id = id
    @name = name
    @age = age
  end

  attr_reader :id, :name, :age

  def can_use_services?
    @parent_permission || is_of_age?
  end

  def of_age?
    @age >= 18
  end
end
