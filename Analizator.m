n = size(vector1,2);
tmp = 1;
quantity = zeros(1,size(vector1,2)/5000);
for i=1:n-1
    if vector1(i) == 0 && vector1(i+1)==0
        tmp = tmp + 1;
    else
        if vector1(i)== 0
            quantity(tmp) = quantity(tmp) + 1;
        end
        tmp = 1;
    end
end
% TODO
for i=1:n
   if quantity(i) == 0
      quantity(i) = [];
      i = i-1;
      n = n-1;
   end
plot(quantity, n);
end

