function nadajSygnal(fn)%czestotliwosc noœna
    fp = 96000;   %czesstotliwosc probkowania
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
        xIm(t+1)=koddl(t+1).*cos(2*pi*fn*(t)/fp);
    end
    
    xIm=xIm./max(abs(xIm)); %normalizacja

    sound (xIm, fp); %nadanie
    nazwa = ['nadany',num2str(fn),'.wav'];
    filename = join(nazwa);
    audiowrite(filename,xIm,fp);
end