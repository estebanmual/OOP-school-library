require './teacher_class'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Math', 40, 'Thiago')
  end

  it 'Teacher should return a teacher' do
    expect(@teacher).to be_an_instance_of Teacher
  end

  it 'Teacher should have a name' do
    expect(@teacher.name).to eq('Thiago')
  end

  it 'Teacher should have an age' do
    expect(@teacher.age).to eq(40)
  end

  it 'Teacher should have an specialization' do
    expect(@teacher.specialization).to eq('Math')
  end

  it 'Teacher should be able use services' do
    expect(@teacher.can_use_services?).to eq(true)
  end
end
