require './decorators'

describe Decorator do
    before :each do
        @decorator = Decorator.new('thiago')
        @decorator2 = Decorator.new('supercalifragilisticexpialidocious')
    end

    it 'Decorator should return a decorator' do
        expect(@decorator).to be_an_instance_of Decorator
    end

    it 'Decorator should return a name' do
        expect(@decorator.nameable).to eq('thiago')
    end

    it 'Decorator should correct capitalize name' do
        expect(@decorator.nameable.capitalize).to eq('Thiago')
    end

    it 'Decorator should return the first 10 character of the name' do
        expect(@decorator2.nameable[0..9]).to eq('supercalif')
    end
end