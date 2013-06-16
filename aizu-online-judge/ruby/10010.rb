def calc(a, op, b)
  case op
  when '+'
    a + b
  when '-'
    a - b
  when '*'
    a * b
  when '/'
    a / b
  else
    exit
  end
end

while line = gets do
  line.split.tap do |l|
    a = l[0].to_i; op = l[1]; b = l[2].to_i
    printf "%d\n", calc(a, op, b)
  end
end
