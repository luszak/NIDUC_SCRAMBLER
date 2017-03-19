function [bitVector] = randGenerator(n)
bitVector = [];
for i=0:n-1
    j = rand();
    bitVector = [bitVector round(j)];
end
end