STDIN.gets.split(" ").map(&:to_i).tap do |i|
  a = i[0];b = i[1]
  printf("%d %d %.10f", a/b,  a%b,  a.to_f / b.to_f)
end
