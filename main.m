N = 10000;   % rozmiar danych
k = 10;      % liczba bitów do desynchronizacji
zeros = zeroGenerator(N);
ones = onesGenerator(N);
random = randGenerator(N);

% Scrambler DVB
zerosScr = DVBScrambler(zeros);
onesScr = DVBScrambler(ones);
randomScr = DVBScrambler(random);
disp('Scrambler DVB');
disp('Srednia dlugosc ciagow zer');
figure('Name', 'D³ugoœci ci¹gów zer dla Scramblera DVB');
Analizator(zerosScr,onesScr,randomScr);
disp('Dla wektora zer:');
symulacja(zerosScr,k);
disp('Dla wektora jedynek:');
symulacja(onesScr,k);
disp('Dla wektora wartosci losowych:');
symulacja(randomScr,k);

% Scrambler V.34
zerosScr = V34Scrambler(zeros);
onesScr = V34Scrambler(ones);
randomScr = V34Scrambler(random);
disp('Scrambler v.34');
disp('Srednia dlugosc ciagow zer');
figure('Name', 'D³ugoœci ci¹gów zer dla Scramblera DVB');
Analizator(zerosScr,onesScr,randomScr);
disp('Dla wektora zer:');
symulacja(zerosScr,k);
disp('Dla wektora jedynek:');
symulacja(onesScr,k);
disp('Dla wektora wartosci losowych:');
symulacja(randomScr,k);

% Scrambler X43
zerosScr = ScramblerX43(zeros);
onesScr = ScramblerX43(ones);
randomScr = ScramblerX43(random);
disp('Scrambler X43');
disp('Srednia dlugosc ciagow zer');
figure('Name', 'D³ugoœci ci¹gów zer dla Scramblera X43');
Analizator(zerosScr,onesScr,randomScr);
disp('Dla wektora zer:');
symulacja(zerosScr,k);
disp('Dla wektora jedynek:');
symulacja(onesScr,k);
disp('Dla wektora wartosci losowych:');
symulacja(randomScr,k);

% Scrambler X76
zerosScr = ScramblerX76(zeros);
onesScr = ScramblerX76(ones);
randomScr = ScramblerX76(random);
disp('Scrambler X7+X6');
disp('Srednia dlugosc ciagow zer');
figure('Name', 'D³ugoœci ci¹gów zer dla Scramblera X7+X6');
Analizator(zerosScr,onesScr,randomScr);
disp('Dla wektora zer:');
symulacja(zerosScr,k);
disp('Dla wektora jedynek:');
symulacja(onesScr,k);
disp('Dla wektora wartosci losowych:');
symulacja(randomScr,k);