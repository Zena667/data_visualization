require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'
 
macdonalds_nutrition_specs = %w( cal cff fat sfat tfat chl sod carb fbr sgr pro vita vitc calc iron )
 
# this is another way of writing this:
# contact_row_data = [ 'id', 'first_name', 'last_name', 'email' ]
 
data = []
 
# don't worry about faker here; all it does is generate 1000 rows of fake names for me.
# you will substitute this for the nokogiri data you scrape into an array.
 
1000.times do |i|
  data << [ i, Faker::Name.name.split[0], Faker::Name.name.split[1], Faker::Internet.email ]
end
 
# and here's an example without faker
# 10.times do |i|
#   data << [i, 'john', 'johnson', 'johnson@example.com']
#   YOUR OWN DATA GOES HERE
# end
 
 
CSV.open('output.csv', 'wb') do |row|
  row << contact_row_data  # put the 'header' row as the first line
 
  # this generates a new comma-delimited line for each row of data
  data.each do |d|
    row << d
  end
end