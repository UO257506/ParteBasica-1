%Se trabaja con entrada.csv y filtrada.csv (filtrada con el pasobanda)

N = 200; %N�mero de muestras
fs = 3e3; %Frecuencia de muestreo
Ts = 1/fs; %Per�odo de muestreo

tiempo = linspace(0,N*Ts,N); %Eje de tiempo
entrada = entrada1'; %Al importar la columna con los datos de la se�al de entrada, el vector lo llamo "entrada"
maximo = max(entrada);
entrada_normalizada = entrada./maximo;
%%% REPRESENTACI�N TEMPORAL DE LA SE�AL DE ENTRADA -> 
figure();
plot(tiempo,entrada_normalizada,'LineWidth',2);
title('Se�al de entrada');
xlabel('Tiempo [s]');
ylabel('Ampitud [Norm]');
grid on
%%% REPRESENTACI�N ESPECTRAL DE LA SE�AL DE ENTRADA -> SUMA DE TRES TONOS
espectro = fft(entrada_normalizada);
P2 = 20.*log10(abs(espectro./1));
P1 = P2(1:N/2+1);
%P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(N/2))/N;

figure();
title('Se�al de entrada');
plot(f,P1,'LineWidth',2)
xlabel('Frecuencia [Hz]');
ylabel('Ampitud [dB]');
grid on


%% SE�AL FILTRADA -> FILTRO PASO BANDA
%%% fs = 3 kHz , %%% fc = 733 Hz
%%% Filtro FIR -> Ventana rECTANGULAR -> Orden: 60

tiempo = linspace(0,N*Ts,N); %Eje de tiempo
filtrada = filtrada1'; %Al importar la columna con los datos de la se�al filtrada, el vector lo llamo "filtrada"
maximo_filtrada = max(filtrada);
filtrada_normalizada = filtrada./maximo_filtrada;
%%% REPRESENTACI�N TEMPORAL DE LA SE�AL FILTRADA -> FILTRO PASO BANDA
figure();
plot(tiempo,filtrada_normalizada,'LineWidth',2)
title('Se�al filtrada');
xlabel('Tiempo [s]');
ylabel('Ampitud [Norm]');
grid on

%%% REPRESENTACI�N ESPECTRAL DE LA SE�AL SE�AL FILTRADA -> FILTRO PASO
%%% BANDA
espectro_filtrado = fft(filtrada_normalizada);
P2_filtrado = 20.*log10(abs(espectro_filtrado./1));
P1_filtrado = P2_filtrado(1:N/2+1);
f_filtrada = fs*(0:(N/2))/N;

figure();
plot(f_filtrada,P1_filtrado,'LineWidth',2)
title('Se�al filtrada');
xlabel('Frecuencia [Hz]');
ylabel('Ampitud [dB]');
grid on


