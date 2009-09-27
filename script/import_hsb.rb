require 'rubygems'
require 'open-uri'
require 'hpricot'

BASE = "http://www.hangseng.com/hsb/chi/abo/cu/ba/index.html"
XPATH_BRANCH = "//table[@bgcolor='#DDDBF9']//table//tr"
XPATH_MTR = "//table[@bgcolor='#FFF0DB']//table//tr"
XPATH_ATM = "//table[@bgcolor='#DAF4DC']//table//tr"

html = open(BASE).read
doc = Hpricot(html)

def parse(doc, xpath, type)
  (doc/xpath).collect do |row|
    cols = (row/"/td")
    name = cols[0].inner_text.tr("\n\t\r ", "") rescue nil
    addr = cols[1].inner_text.tr("\n\t\r ", "") rescue nil
    {:name => name, :address => addr, :type => type}
  end.reject() {|v| v[:name].nil? || v[:address].nil? || v[:name] == "" }
end

branch = parse(doc, XPATH_BRANCH, "branch")
branch.each do |p|
  Point.create(:group => "hsb", :name => p[:name], :address => p[:address], :point_type => "0")
end
puts "branch cnt: #{branch.size}"

atm = parse(doc, XPATH_ATM, "atm")
atm.each do |p|
  Point.create(:group => "hsb", :name => p[:name], :address => p[:address], :point_type => "1")
end

puts "atm cnt: #{atm.size}"