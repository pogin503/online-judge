# -*- coding: utf-8 -*-
#解法1
str = STDIN.gets.split(" ")
# p str
a = str[0].to_i;b = str[1].to_i
puts "#{a*b} #{a*2 + b*2}"
#解法2
STDIN.gets.split.map(&:to_i).tap { |i| a = i[0];b = i[1];puts "#{a*b} #{a*2 + b*2}" }
