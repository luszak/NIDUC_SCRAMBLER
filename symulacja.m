function[a] = symulacja(inVector, k)
% inVector -  wejsciowy wektor danych
% k - liczba bitow do utraty synchronizacji
ss = [0 0 0 1 1 1 0 0 1 1 0 1 ]; % sekwencja synchronizacyjna
dobrze = 0; % suma dobrze odebranych bitow
zle = 0; % suma zle odebranych bitow
dlugoscRamki = 100;
n = size(inVector,2);
ileRamek = floor(n/dlugoscRamki); % ile ramek bedzie wstawionych
synInVector = [];
% dodawanie sekwencji
i = 1;
j = 1;
while (i <= n)
    if (mod(i-1,dlugoscRamki)==0)
       synInVector = [synInVector ss];
       j = j + size(ss,2);
   else
       synInVector = [synInVector inVector(i)];
   end
   i = i+1;
   j = j+1;
end

synchronized = false;
VZeros = zeroGenerator(k);
VOnes = onesGenerator(k);
for i=1:(size(synInVector,2)-size(ss,2))
    if (synInVector(i:i+size(ss,2)-1) == ss)
        synchronized = true;
    end
    if (synInVector(i:i+k-1) == VZeros)
        synchronized = false;
    elseif(synInVector(i:i+k-1) == VOnes)
        synchronized = false;
    end
    if (synchronized == true)
        dobrze = dobrze + 1;
    elseif (synchronized == false)
        zle = zle + 1;
    end
end
for i = size(synInVector,2)-size(ss,2): size(synInVector,2)-k-1
    if (synInVector(i:i+k-1) == VZeros)
        synchronized = false;
    elseif(synInVector(i:i+k-1) == VOnes)
        synchronized = false;
    end
    if (synchronized == true)
        dobrze = dobrze + 1;
    elseif (synchronized == false)
        zle = zle + 1;
    end
end
if (synchronized == true)
    dobrze = dobrze + k;
elseif (synchronized == false)
    zle = zle + k;
end
if (dobrze > ileRamek*size(ss,2))
    dobrze = dobrze - ileRamek*size(ss,2);
else
    zle = zle - ileRamek*size(ss,2);
end
A = dobrze/(dobrze+zle);
disp('A=');
disp(A);
