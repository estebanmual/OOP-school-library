require './person_class'

class Student < Person
  attr_accessor :parent_permission
  attr_reader :classroom

  def initialize(age, classroom, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def to_json(*_args)
    { type: 'student', age: @age, name: @name, parent_permission: @parent_permission,
      classroom: @classroom.label }.to_json
  end
end
