# Person class
class Person
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', _parent_permission: true)
    @id = id
    @name = name
    @age = age
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
