require 'csv'
 
macdonalds_nutrition_specs = %w( cal cff fat sfat tfat chl sod carb fbr sgr pro vita vitc calc iron )
 
CSV.foreach('output.csv') do |row|
 
  # following code basically does this:
 
  # puts "id is: #{row[0]}"
  # puts "first_name is: #{row[1]}"
  # puts "last_name is: #{row[2]}"
  # puts "email is: #{row[3]}"
 
  macdonalds_nutrition_specs.each_index do |i|
    puts "#{contact_row_data[i]} is #{row[i]}"
  end
 
  puts "-------------"
 
end