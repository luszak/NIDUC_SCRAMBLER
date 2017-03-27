function [a] = Analizator(vector1,vector2,vector3)
n = size(vector1,2);
tmp = 1;
quantity = zeros(1,size(vector1,2));
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
i = n;
while(1)
   if quantity(i) ~= 0
       break;
   end
   quantity(i) = [];
   i = i-1;
end
subplot(311)
plot(quantity);
n = size(vector2,2);
tmp = 1;
quantity = zeros(1,size(vector2,2));
for i=1:n-1
    if vector2(i) == 0 && vector2(i+1)==0
        tmp = tmp + 1;
    else
        if vector2(i)== 0
            quantity(tmp) = quantity(tmp) + 1;
        end
        tmp = 1;
    end
end
i = n;
while(1)
   if quantity(i) ~= 0
       break;
   end
   quantity(i) = [];
   i = i-1;
end
subplot(312)
plot(quantity);
n = size(vector3,2);
tmp = 1;
quantity = zeros(1,size(vector3,2));
for i=1:n-1
    if vector3(i) == 0 && vector3(i+1)==0
        tmp = tmp + 1;
    else
        if vector3(i)== 0
            quantity(tmp) = quantity(tmp) + 1;
        end
        tmp = 1;
    end
end
i = n;
while(1)
   if quantity(i) ~= 0
       break;
   end
   quantity(i) = [];
   i = i-1;
end
subplot(313)
plot(quantity);
end

