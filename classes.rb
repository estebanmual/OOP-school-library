#!/usr/bin/env ruby

class Person
    attr_accessor :name, :age
    attr_reader :id

    def initialize( age, name='Unknown', parent_permission=true)
        @age = age
        @name = name
        @parent_permission = parent_permission
        @id = rand(100000)
    end

    private

    def is_of_age?
        return @age >= 18
    end

    public

    def can_use_services?
        true if is_of_age? || @parent_permission
    end
end

class Student < Person
    def initialize(classroom)
        @classroom = classroom
    end

    def play_hooky
        return "¯\(ツ)/¯"
    end
end