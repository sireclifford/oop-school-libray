require_relative './person'

class Student < Person
  attr_reader :classrom

  def initialize(age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classrom(classrom)
    @classrom = classrom
    classrom.students.push(self) unless classrom.students.include?(self)
  end
end