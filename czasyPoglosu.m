clear all;
close all;

for i = 1:20
    [delayTime(i), nPeaks(i), ePeaks(i)] = badajSygnal(append(string(i),'.4khz.wav'), 4000);
end
x{1} = [-3, 0.5, delayTime(17), nPeaks(17), ePeaks(17)]
x{2} = [-0.5, 0.5, delayTime(18), nPeaks(18), ePeaks(18)]
x{3} = [1.5, 0.5, delayTime(19), nPeaks(19), ePeaks(19)]
x{4} = [4, 0.5, delayTime(20), nPeaks(20), ePeaks(20)]
x{5} = [-3, 3, delayTime(13), nPeaks(13), ePeaks(13)]
x{6} = [-0.5, 3, delayTime(14), nPeaks(14), ePeaks(14)]
x{7} = [1.5, 3, delayTime(15), nPeaks(15), ePeaks(15)]
x{8} = [4, 3, delayTime(16), nPeaks(16), ePeaks(16)]
x{9} = [-3, 5.5, delayTime(9), nPeaks(9), ePeaks(9)]
x{10} = [-0.5, 5.5, delayTime(10), nPeaks(10), ePeaks(10)]
x{11} = [1.5, 5.5, delayTime(11), nPeaks(11), ePeaks(11)]
x{12} = [4, 5.5, delayTime(12), nPeaks(12), ePeaks(12)]
x{13} = [-3, 8, delayTime(5), nPeaks(5), ePeaks(5)]
x{14} = [-0.5, 8, delayTime(6), nPeaks(6), ePeaks(6)]
x{15} = [1.5, 8, delayTime(7), nPeaks(7), ePeaks(7)]
x{16} = [4, 8, delayTime(8), nPeaks(8), ePeaks(8)]
x{17} = [-3, 10.5, delayTime(1), nPeaks(1), ePeaks(1)]
x{18} = [-0.5, 10.5, delayTime(2), nPeaks(2), ePeaks(2)]
x{19} = [1.5, 10.5, delayTime(3), nPeaks(3), ePeaks(3)]
x{20} = [4, 10.5, delayTime(4), nPeaks(4), ePeaks(4)]

for i = 1:20
    X(i) = x{i}(1);
    Y(i) = x{i}(2);
    Z1(i) = x{i}(3);
    Z2(i) = x{i}(4);
    Z3(i) = x{i}(5);
end

X = reshape(X, [4,5]);
Y = reshape(Y, [4,5]);
Z1 = reshape(Z1, [4,5]);
Z2 = reshape(Z2, [4,5]);
Z3 = reshape(Z3, [4,5]);

figure('Position',[10,0,1000,1000],'DefaultAxesFontSize',14);
surf(X,Y,Z1);
title ('Mapa pog³osu','FontSize',16);
xlabel('X [m]');
ylabel('Y [m]');
zlabel('Czas trwania pog³osu [s]');
colorbar;

figure('Position',[10,0,1000,1000],'DefaultAxesFontSize',14);
contourf(X,Y,Z1);
title ('Mapa pog³osu','FontSize',16);
xlabel('X [m]');
ylabel('Y [m]');
colorbar;

figure('Position',[10,0,1000,1000],'DefaultAxesFontSize',14);
surf(X,Y,Z2);
title ('Mapa liczby odbiæ','FontSize',16);
xlabel('X [m]');
ylabel('Y [m]');
zlabel('Liczba odbiæ');
colorbar;

figure('Position',[10,0,1000,1000],'DefaultAxesFontSize',14);
contourf(X,Y,Z2);
title ('Mapa liczby odbiæ','FontSize',16);
xlabel('X [m]');
ylabel('Y [m]');
colorbar;

figure('Position',[10,0,1000,1000],'DefaultAxesFontSize',14);
surf(X,Y,Z3);
title ('Mapa mocy wzglêdnej odbiæ','FontSize',16);
xlabel('X');
ylabel('Y');
zlabel('Wzglêdna moc odbiæ');
colorbar;

figure('Position',[10,0,1000,1000],'DefaultAxesFontSize',14);
contourf(X,Y,Z3);
title ('Mapa mocy wzglêdnej odbiæ','FontSize',16);
xlabel('X');
ylabel('Y');
colorbar;