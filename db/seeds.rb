# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create some pharmacists account
if !Pharmacist.exists?(:email => 'simon.karatsoreas@uhn.ca')
  Pharmacist.create({:first_name => 'Simon', :last_name => 'Karatsoreas', :email=>'simon.karatsoreas@uhn.ca', :password=>'hello123'})
end

if !Pharmacist.exists?(:email => 'jennifer.harrison@uhn.ca')
  Pharmacist.create({:first_name => 'Jennifer', :last_name => 'Harrison', :email=>'jennifer.harrison@uhn.ca', :password=>'hello123'})
end

if !Pharmacist.exists?(:email => 'helen.chen@uwaterloo.ca')
  Pharmacist.create({:first_name => 'Helen', :last_name => 'Chen', :email=>'helen.chen@uwaterloo.ca', :password=>'hello123'})
end

if !Pharmacist.exists?(:email => 'z4malik@uwaterloo.ca')
  Pharmacist.create({:first_name => 'Zeeshan', :last_name => 'Malik', :email=>'z4malik@uwaterloo.ca', :password=>'hello123'})
end

if !Pharmacist.exists?(:email => 'essarr@gmail.com')
  Pharmacist.create({:first_name => 'Saravana', :last_name => 'Rajan', :email=>'essarr@gmail.com', :password=>'hello123'})
end

if !Pharmacist.exists?(:email => 'louise.li@uhn.ca')
  Pharmacist.create({:first_name => 'Louise', :last_name => 'Li', :email=>'louise.li@uhn.ca', :password=>'hello123'})
end

if !Pharmacist.exists?(:email => 'tim.wadman@uwaterloo.ca')
  Pharmacist.create({:first_name => 'Tim', :last_name => 'Wadman', :email=>'tim.wadman@uwaterloo.ca', :password=>'hello123'})
end

