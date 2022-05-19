require './person_class'

describe Person do
    before :each do
        @person = Person.new(20, 'Esteban')
    end

    it 'Person should return a person' do
        expect(@person).to be_an_instance_of Person
    end

    it 'Person should have age' do
        expect(@person.age).to eq(20)
    end

    it 'Person should have a name' do
        expect(@person.name).to eq('Esteban')
    end
end