function convRes = conv2(a,b)

b = rot90(b);
for i=1:length(a)
  if i==1
    prev = rot90(b * a(i));
  else
    temp = rot90(b*a(i));
    if(length(prev) >= 2)
    a(i) = (temp(1) - prev(2));
    else
        a(i) = temp(i);
    end   
  end
end
convRes = a;
end
