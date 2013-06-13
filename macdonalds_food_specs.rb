require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

#use useragent to make the nokogiri html read like it would in Chrome
# @useragent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36"
url = "http://www.fastfoodnutrition.org/10_r-mcdonalds/nutrition-chart.html"
page = Nokogiri::HTML(open("#{url}"))
macdonalds_foods = page.css('div#centercolumn div p a')
macdonalds_food_specs = page.css('div#centercolumn div.chart_data')
macdonalds_nutrition_specs = %w( title cal cff fat sfat tfat chl sod carb fbr sgr pro vita vitc calc iron )

CSV.open('macdonalds_total_fat.csv', 'w') do |row|
    row << macdonalds_nutrition_specs

    macdonalds_foods.each_with_index do |food, index|
        food_row = []
         food_row << food.text
         food_row << macdonalds_food_specs.slice(index, 15).map { |e| e.text }
         food_row.flatten!
         row << food_row
    end
end