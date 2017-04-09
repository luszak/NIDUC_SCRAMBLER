close all;
clear all;
n = 10000;  % Liczba bit�w do przetworzenia
% Generacja danych
zeros = zeroGenerator(n);
ones = onesGenerator(n);
random = randGenerator(n);
figure('Name', 'Warto�ci przed scramblowaniem DVB');
subplot(311);
plot(zeros, '.');
subplot(312);
plot(ones, '.');
subplot(313);
plot(random, '.');
% Scramblowanie DVB
zeros = DVBScrambler(zeros);
ones = DVBScrambler(ones);
random = DVBScrambler(random);
%Analiza
figure('Name', 'Ilo�� ci�g�w zer po scramblowaniu DVB');
disp('DVB Scrambler (average):');
Analizator(zeros, ones, random);
% Descramblowanie DVB
zeros = DVBScrambler(zeros);
ones = DVBScrambler(ones);
random = DVBScrambler(random);
figure('Name', 'Warto�ci po scramblowaniu DVB');
subplot(311);
plot(zeros, '.');
subplot(312);
plot(ones, '.');
subplot(313);
plot(random, '.');
% Scramblowanie v34
zeros = V34Scrambler(zeros);
ones = V34Scrambler(ones);
random = V34Scrambler(random);
% Analiza
figure('Name', 'Ilo�� ci�g�w zer po scramblowaniu v34');
disp('v.34 Scrambler (average):');
Analizator(zeros, ones, random);
% Descramblowanie v34
zeros = V34Descrambler(zeros);
ones = V34Descrambler(ones);
random = V34Descrambler(random);
