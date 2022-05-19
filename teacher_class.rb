require './person_class'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    { type: 'teacher', age: @age, name: @name, parent_permission: @parent_permission,
      specialization: @specialization }.to_json
  end
end
