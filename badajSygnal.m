function [delayTime, nPeaks, powerPeaks] = badajSygnal(filename, fn)   

    [xIm,fp] = audioread(filename);
    
    Lchip=25;     %liczba probek na symbol - liczba chipow rozpraszajacych
    fm=fp/Lchip;  %szybkosc modulacji
    L=2047;       %dlugosc ciagu rozpraszajacego
    tb=L/fm;      %czas trwania sekwencji zmodulowanej
    tk=(tb*fp);   %liczba probek na sekwencje rozproszona
    
    load GoldSeqMx_N2047.csv -ascii
    kod=GoldSeqMx_N2047(1:L, 1)';

    %Rozpraszanie
    for t=0:tk
        w=floor((t)*fm/fp)+1;
        if w>L %zwiêkszona czêstotliwoœæ próbkowania
            w=1;
        end;
        koddl(t+1)=kod(w);
    end

    odebrany=xIm(:,1)'; %odbiór
       
    xc=odebrany.*cos(2*pi*fn*(0:length(odebrany)-1)/fp); %przejœcie do pasma podstawowego
    xs=odebrany.*sin(2*pi*fn*(0:length(odebrany)-1)/fp);

    xcf=fft(xc); %filtracja
    xsf=fft(xs);

    zer=1*floor(2*fm*length(odebrany)/fp);

    xsf(zer:length(odebrany)-zer)=0;
    xcf(zer:length(odebrany)-zer)=0;

    xso=real(ifft(xsf));
    xco=real(ifft(xcf));
    xso=xso./(max(abs(xso)));
    xco=xco./(max(abs(xco))); %koniec filtracji

    [xCs,Lags]=xcorr(xso,koddl); %korelacja wzajemna
    [xCc,Lags]=xcorr(xco,koddl);

    xIkor=xCs+1i*xCc;
    axIkor=abs(xIkor);
    axIkor=axIkor./max(axIkor);
    Lags=Lags./fp;

    M = find(axIkor==max(axIkor));
    tenPercent = 0.2*max(axIkor);
    N = find(axIkor>=tenPercent);
    delayTime = (N(size(N,2)) - M)/fp;
    
figure('Position',[10,0,1600,400],'DefaultAxesFontSize',14);
plot(Lags(M-200:N(size(N,2))+500),axIkor(M-200:N(size(N,2))+500),'b','LineWidth',2);
grid on;
title('Estymata odpowiedzi impulsowej','FontSize',16);
xlabel('Czas [sekundy]');
ylabel('Modu³ korelacji wzajemnej');
    
    [pkt,lct] = findpeaks(axIkor(M:N(size(N,2))),Lags(M:N(size(N,2))),'MinPeakProminence',0.2);
        
    nPeaks=length(pkt);
    powerPeaks=(sum(pkt.^2))/(max(axIkor)^2);
        
end