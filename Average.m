function [ avg ] = Average(inVector, n)
j = size(inVector,2);
avg = 0;
sum = 0;
for i=1:j
    avg = avg + inVector(i)*i;
    sum = sum + inVector(i);
end
avg = avg/sum;
end
