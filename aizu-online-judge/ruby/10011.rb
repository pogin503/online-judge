count = gets.to_i
STDIN.gets.split.map(&:to_i).tap do |i|
  idx = 0;
  for i_rev in i.reverse do
    idx += 1
    if idx != count
      printf "%d ", i_rev
    else
      printf "%d", i_rev
    end
  end
  print "\n"
end
