require 'rubygems'
require 'nokogiri'
require 'open-uri'

#use useragent to make the nokogiri html read like it would in Chrome
# @useragent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36"
url = "http://www.fastfoodnutrition.org/10_r-mcdonalds/nutrition-chart.html"

File.open('macdonalds_food.txt', 'w') do |f|
    page = Nokogiri::HTML(open("#{url}"))
    macdonalds_foods = page.css('div#centercolumn div p a')

    macdonalds_foods.each do |food|
        food = food.text
        f.write(food + "\n") 
    end
end

