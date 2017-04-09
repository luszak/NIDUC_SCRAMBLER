n = 10000;  % Liczba bitów do przetworzenia
% Generacja danych
zeros = zeroGenerator(n);
ones = onesGenerator(n);
random = randGenerator(n);
% Scramblowanie
zeros = DVBScrambler(zeros);
ones = DVBScrambler(ones);
random = DVBScrambler(random);
%Analiza
Analizator(zeros, ones, random);
% Descramblowanie
zeros = DVBScrambler(zeros);
ones = DVBScrambler(ones);
random = DVBScrambler(random);