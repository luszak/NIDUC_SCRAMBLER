function [ outVector ] = ScramblerX76( inVector)
n = size(inVector,2);
key = [1 0 0 1 0 1 0];
outVector = [];
for i=1:n
   bit = xor(key(7), inVector(i));
   outVector = [outVector bit];
   bit = xor(key(6),key(7));
   key(7) = [];
   key = [bit key];
end
end