# -*- coding: utf-8 -*-
#解法1
while nums = STDIN.gets.split.map { |e| e.to_i} do
  if nums[0] == 0 && nums[1] == 0
    break
  end
  puts "#{nums.min} #{nums.max}"
end
#解法2
while line = gets do
  line.split.map(&:to_i).tap {|v| v.max == 0 ? exit : "#{v.min} #{v.max}\n".display}
end
