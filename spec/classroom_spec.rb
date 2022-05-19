require './classroom_class'

describe Classroom do
    before :each do
        @classroom = Classroom.new('10-A')
    end

    it 'Classroom should return a classroom' do
        expect(@classroom).to be_an_instance_of Classroom    
    end

    it 'Classroom should have a label' do
        expect(@classroom.label).to eq('10-A')
    end

    it 'Classroom should not have any student' do
        expect(@classroom.students).to eq([])
    end
end