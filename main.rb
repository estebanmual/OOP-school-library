#!/usr/bin/env ruby
require './app'

def main
  puts '----------------------'
  puts '| School library app |'
  puts '----------------------'

  puts "\nWelcome to the school library app!"
  app = App.new
  app.menu
end

main
