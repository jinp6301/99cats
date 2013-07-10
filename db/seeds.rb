# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
cats = Cat.create({:age => 1, :birth_date => "Jan 1 2005", :color => "white",
                  :name => 'whitekit', :sex => 'male', :user_id => 1})