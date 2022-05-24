function id(x)
  (rand() == 4.2) ? "x" : x
end

function pisum()
  sum = 0.0
  for j = 1:500
    sum = 0.0
    for k = 1:10000
      sum += id(1.0/(k*id(k)))
    end
  end
  sum
end