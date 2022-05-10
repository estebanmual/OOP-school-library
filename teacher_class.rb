#!/usr/bin/env ruby
require './person_class'

class Teacher < Person
    def initialize(specialization)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end