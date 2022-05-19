require './student_class'
require './classroom_class'

describe Student do
  before :each do
    @classroom = Classroom.new('10-A')
    @student = Student.new(20, @classroom, true, 'Thiago')
  end

  it 'Student should return a student' do
    expect(@student).to be_an_instance_of Student
  end

  it 'Student should have a name' do
    expect(@student.name).to eq('Thiago')
  end

  it 'Student should have an age' do
    expect(@student.age).to eq(20)
  end

  it 'Student should have parent_permission' do
    expect(@student.parent_permission).to eq(true)
  end

  it 'Student should have a classroom' do
    expect(@student.classroom).to eq(@classroom)
  end

  it 'Student should be able to play hooky' do
    expect(@student.play_hooky).to eq("¯\(ツ)/¯")
  end
end
