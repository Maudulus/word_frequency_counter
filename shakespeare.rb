require "pry" 

def word_frequency(word_array)
	word_count_hash = {}
	word_array.each do |word|
		count = 0 
		word_array.each do |find|
			if find == word 
				count += 1 
				word_count_hash[word] = count
			end 
		end 
	end 
  top_3_words = Hash[word_count_hash.sort_by {|k,v| v}.reverse.first(3)]
  puts top_3_words
end

array = []

f = File.open("textfile.txt", "r")
f.each_line do |line|
  array << line.split(" ")
  array = array.flatten 
end
  word_frequency(array)


