class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = rand(100_000)
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    true if is_of_age? || @parent_permission
  end
end
