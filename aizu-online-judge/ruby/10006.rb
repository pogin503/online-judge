i = 0
while line = STDIN.gets.to_i
  if line == 0 then
    break
  end
  i += 1
  puts "Case #{i}: #{line}"
end
