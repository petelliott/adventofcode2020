
l = [];
while true
  try
    l(end+1) = input('');
  catch E
    break
  end
end

brk = false;
for i = 1:length(l)
  for j = 1:length(l)
    for k = 1:length(l)
      if l(i) + l(j) + l(k) == 2020
        l(i) * l(j) * l(k)
        brk = true;
        break
      end
    end
    if brk
      break
    end
  end
  if brk
    break
  end
end
