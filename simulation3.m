% symulacja utraty synchronizacji
clear all;
ss = [0 0 0 1 1 1 0 0 1 1 0 1 ]; % sekwencja synchronizacyjna
k = 10; % ilosc bitow do desynchronizacji
dobrze = 0; % suma dobrze odebranych bitow
zle = 0; % suma zle odebranych bitow
n = 10000; % rozmiar danych
dlugoscRamki = 100;
ileRamek = floor(n/dlugoscRamki); % ile ramek bedzie wstawionych

zeros = zeroGenerator(n);
ones = onesGenerator(n);
random = randGenerator(n);
zerosDVB = DVBScrambler(zeros);
onesDVB = DVBScrambler(ones);
randDVB = DVBScrambler(random);
zerosV34 = V34Scrambler(zeros);
onesV34 = V34Scrambler(ones);
randV34 = V34Scrambler(random);
synZerosDVB = [];
synOnesDVB = [];
synRandDVB = [];
synZerosV34 = [];
synOnesV34 = [];
synRandV34 = [];

% dodawanie sekwencji
i = 1;
j = 1;
while (i <= n)
    if (mod(i-1,dlugoscRamki)==0)
       synZerosDVB = [synZerosDVB ss];
       synOnesDVB = [synOnesDVB ss];
       synRandDVB = [synRandDVB ss];
       synZerosV34 = [synZerosV34 ss];
       synOnesV34 = [synOnesV34 ss];
       synRandV34 = [synRandV34 ss];
       synZerosDVB = [synZerosDVB zerosDVB(i)];
       synOnesDVB = [synOnesDVB onesDVB(i)];
       synRandDVB = [synRandDVB randDVB(i)];
       synZerosV34 = [synZerosV34 zerosV34(i)];
       synOnesV34 = [synOnesV34 onesV34(i)];
       synRandV34 = [synRandV34 randV34(i)];
       j = j + size(ss,2);
   else
       synZerosDVB = [synZerosDVB zerosDVB(i)];
       synOnesDVB = [synOnesDVB onesDVB(i)];
       synRandDVB = [synRandDVB randDVB(i)];
       synZerosV34 = [synZerosV34 zerosV34(i)];
       synOnesV34 = [synOnesV34 onesV34(i)];
       synRandV34 = [synRandV34 randV34(i)];
   end
   i = i+1;
   j = j+1;
end

% symulacja dla zer DVB
dobrze = 0;
zle = 0;
synchronized = false;
gestapoZeros = zeroGenerator(k);
gestapoOnes = onesGenerator(k);
for i=1:(size(synZerosDVB,2)-size(ss,2))
    if (synZerosDVB(i:i+size(ss,2)-1) == ss)
        synchronized = true;
    end
    if (synZerosDVB(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synZerosDVB(i:i+k-1) == gestapoOnes)
        synchronized = false;
    end
    if (synchronized == true)
        dobrze = dobrze + 1;
    elseif (synchronized == false)
        zle = zle + 1;
    end
end
for i = size(synZerosDVB,2)-size(ss,2): size(synZerosDVB,2)-k-1
    if (synZerosDVB(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synZerosDVB(i:i+k-1) == gestapoOnes)
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
disp('Dla zer DVB A=');
disp(A);

% symulacja dla jedynek DVB
dobrze = 0;
zle = 0;
synchronized = false;
gestapoZeros = zeroGenerator(k);
gestapoOnes = onesGenerator(k);
for i=1:(size(synOnesDVB,2)-size(ss,2))
    if (synOnesDVB(i:i+size(ss,2)-1) == ss)
        synchronized = true;
    end
    if (synOnesDVB(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synOnesDVB(i:i+k-1) == gestapoOnes)
        synchronized = false;
    end
    if (synchronized == true)
        dobrze = dobrze + 1;
    elseif (synchronized == false)
        zle = zle + 1;
    end
end
for i = size(synOnesDVB,2)-size(ss,2): size(synOnesDVB,2)-k-1
    if (synOnesDVB(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synOnesDVB(i:i+k-1) == gestapoOnes)
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
disp('Dla jedynek DVB A=');
disp(A);

% symulacja dla rand DVB
dobrze = 0;
zle = 0;
synchronized = false;
gestapoZeros = zeroGenerator(k);
gestapoOnes = onesGenerator(k);
for i=1:(size(synRandDVB,2)-size(ss,2))
    if (synRandDVB(i:i+size(ss,2)-1) == ss)
        synchronized = true;
    end
    if (synRandDVB(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synRandDVB(i:i+k-1) == gestapoOnes)
        synchronized = false;
    end
    if (synchronized == true)
        dobrze = dobrze + 1;
    elseif (synchronized == false)
        zle = zle + 1;
    end
end
for i = size(synRandDVB,2)-size(ss,2): size(synRandDVB,2)-k-1
    if (synRandDVB(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synRandDVB(i:i+k-1) == gestapoOnes)
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
disp('Dla rand DVB A=');
disp(A);

% symulacja dla zer V34
dobrze = 0;
zle = 0;
synchronized = false;
gestapoZeros = zeroGenerator(k);
gestapoOnes = onesGenerator(k);
for i=1:(size(synZerosV34,2)-size(ss,2))
    if (synZerosV34(i:i+size(ss,2)-1) == ss)
        synchronized = true;
    end
    if (synZerosV34(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synZerosV34(i:i+k-1) == gestapoOnes)
        synchronized = false;
    end
    if (synchronized == true)
        dobrze = dobrze + 1;
    elseif (synchronized == false)
        zle = zle + 1;
    end
end
for i = size(synZerosV34,2)-size(ss,2): size(synZerosV34,2)-k-1
    if (synZerosV34(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synZerosV34(i:i+k-1) == gestapoOnes)
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
disp('Dla zer V34 A=');
disp(A);

% symulacja dla ones V34
dobrze = 0;
zle = 0;
synchronized = false;
gestapoZeros = zeroGenerator(k);
gestapoOnes = onesGenerator(k);
for i=1:(size(synOnesV34,2)-size(ss,2))
    if (synOnesV34(i:i+size(ss,2)-1) == ss)
        synchronized = true;
    end
    if (synOnesV34(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synOnesV34(i:i+k-1) == gestapoOnes)
        synchronized = false;
    end
    if (synchronized == true)
        dobrze = dobrze + 1;
    elseif (synchronized == false)
        zle = zle + 1;
    end
end
for i = size(synOnesV34,2)-size(ss,2): size(synOnesV34,2)-k-1
    if (synOnesV34(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synOnesV34(i:i+k-1) == gestapoOnes)
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
disp('Dla jedynek V34 A=');
disp(A);

% symulacja dla rand V34
dobrze = 0;
zle = 0;
synchronized = false;
gestapoZeros = zeroGenerator(k);
gestapoOnes = onesGenerator(k);
for i=1:(size(synRandV34,2)-size(ss,2))
    if (synRandV34(i:i+size(ss,2)-1) == ss)
        synchronized = true;
    end
    if (synRandV34(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synRandV34(i:i+k-1) == gestapoOnes)
        synchronized = false;
    end
    if (synchronized == true)
        dobrze = dobrze + 1;
    elseif (synchronized == false)
        zle = zle + 1;
    end
end
for i = size(synRandV34,2)-size(ss,2): size(synRandV34,2)-k-1
    if (synRandV34(i:i+k-1) == gestapoZeros)
        synchronized = false;
    elseif(synRandV34(i:i+k-1) == gestapoOnes)
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
disp('Dla rand V34 A=');
disp(A);