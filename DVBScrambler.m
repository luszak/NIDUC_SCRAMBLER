function [ outVector ] = DVBScrambler( inVector)
n = size(inVector,2);
key = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0];
outVector = [];
for i=1:n
   bit = xor(key(14),key(15));
   key(15) = [];
   key = [bit key];
   bit = xor(bit, inVector(i));
   outVector = [outVector bit];
end
end

