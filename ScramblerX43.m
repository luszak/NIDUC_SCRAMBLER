function [ outVector ] = ScramblerX43( inVector)
n = size(inVector,2);
key = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0 1 0 0 1 0 1 0 1 0 0 0 0 0 0 0 1 0 0 1 0 1 0 1 0 0 0 0 0];
outVector = [];
for i=1:n
   bit = xor(key(43), inVector(i));
   key(43) = [];
   key = [bit key];
   outVector = [outVector bit];
end
end