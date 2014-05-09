require "pry" 
require 'benchmark'

def word_frequency(word_array)
	word_count_hash = {}
	word_store = ""
	word_array.each do |word|
		word_store = word
		if word_count_hash.has_key?(word_store) == false
		count = 0 
		word_array.each do |find|
			if find.downcase.gsub(/[^a-z\s]/, '') == word.downcase.gsub(/[^a-z\s]/, '')
				count += 1 
				word_count_hash[word.downcase.gsub(/[^a-z\s]/, '')] = count
			end 
		end 
		end 
	end 
  top_3_words = Hash[word_count_hash.sort_by {|k,v| k}.reverse.first(3)]
  puts top_3_words
  puts word_count_hash["bernardo"]
end 

array = []

f = File.open("shakespeare.txt", "r")
f.each_line do |line|
  array << line.split(" ")
  array = array.flatten 
end
puts Benchmark.measure { word_frequency(array) } 


