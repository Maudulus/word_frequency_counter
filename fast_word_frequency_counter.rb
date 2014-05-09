require "pry" 
require 'benchmark'

def sort_hamlet(textfile)
	f = File.open(textfile, "r")
	word_count_hash = {}
		f.each_line do |line|
		  line.split(" ").each do |word|
		  	word = word.downcase.gsub(/[^a-z\s]/, '')
		  	if  word_count_hash.has_key?(word)
			  	word_count_hash[word] += 1
				else
			  	word_count_hash[word] = 1
			  end 
			end 
		end
  top_3_words = Hash[word_count_hash.sort_by {|k,v| v}.reverse.first(3)]
  puts top_3_words
end 
puts Benchmark.measure { puts sort_hamlet("shakespeare.txt") } 
