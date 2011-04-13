# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Create an Administrator
Admin.delete_all
Admin.create( :id => 2982, 
              :email => "Antwan3000@gmail.com", 
              :password => "hello", 
              :password_confirmation => "hello")