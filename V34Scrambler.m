function [ outVector ] = V34Scrambler( inVector)
n = size(inVector,2);
key = [1 0 1 0 0 1 0 1 0 1 0 1 1 1 1 0 1 0 1 0 1 1 1];
outVector = [];
for i=1:n
   bit = xor(key(18),key(23));
   key(23) = [];
   bit = xor(bit, inVector(i));
   key = [bit key];
   outVector = [outVector bit];
end
end
