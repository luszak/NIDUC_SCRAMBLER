%% SCRAMBLER MULTIPLIKATYWNY
s2=5418839; %inicjalizacja petli scramblera
n2=zeros(size(kod)); % tworzymy now¹ tablice samnych zer, która ma taki sam rozmiar jak istniej¹ca tablica 0 i 1
for j=1:size(kod,2); %tworzymy pêtle która iteruje od 1 do ca³kowitej liczby kolumn tablicy g
m2=bitxor(bitget(s2,1),bitget(s2,6)); %bitxor zwraca wartosc alternatywy wykluczajacej (XOR) dla 2 bitow
t2=bitxor(kod(j),m2); % ponownie wykonujemy xor'a
s2=bitshift(s2,-1); %bitshift powoduje przesuniecie bitu
s2=bitset(s2,23,t2); %bitset zwraca wartosc s na pozycji 23 do m
n2(j)=bitset(n2(j),1,t2); % bitset to co wyzej^
end
scrambler_out2=n2 %poprzednio utworzona nowa tablica otrzymuje nowe wartosci
dlmwrite('scrabler_multiplikatywny.txt', scrambler_out2, '%1i');
liczba_zer_w_ciagu2 = diff([0 (find(~(scrambler_out2<1)))])-1;