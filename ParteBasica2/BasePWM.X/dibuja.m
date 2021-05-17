%Se trabaja con entrada.csv y filtrada.csv (filtrada con el pasobanda)

N = 200; %Número de muestras
fs = 3e3; %Frecuencia de muestreo
Ts = 1/fs; %Período de muestreo

tiempo = linspace(0,N*Ts,N); %Eje de tiempo
entrada = entrada1'; %Al importar la columna con los datos de la señal de entrada, el vector lo llamo "entrada"
maximo = max(entrada);
entrada_normalizada = entrada./maximo;
%%% REPRESENTACIÓN TEMPORAL DE LA SEÑAL DE ENTRADA -> 
figure();
plot(tiempo,entrada_normalizada,'LineWidth',2);
title('Señal de entrada');
xlabel('Tiempo [s]');
ylabel('Ampitud [Norm]');
grid on
%%% REPRESENTACIÓN ESPECTRAL DE LA SEÑAL DE ENTRADA -> SUMA DE TRES TONOS
espectro = fft(entrada_normalizada);
P2 = 20.*log10(abs(espectro./1));
P1 = P2(1:N/2+1);
%P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(N/2))/N;

figure();
title('Señal de entrada');
plot(f,P1,'LineWidth',2)
xlabel('Frecuencia [Hz]');
ylabel('Ampitud [dB]');
grid on


%% SEÑAL FILTRADA -> FILTRO PASO BANDA
%%% fs = 3 kHz , %%% fc = 733 Hz
%%% Filtro FIR -> Ventana rECTANGULAR -> Orden: 60

tiempo = linspace(0,N*Ts,N); %Eje de tiempo
filtrada = filtrada1'; %Al importar la columna con los datos de la señal filtrada, el vector lo llamo "filtrada"
maximo_filtrada = max(filtrada);
filtrada_normalizada = filtrada./maximo_filtrada;
%%% REPRESENTACIÓN TEMPORAL DE LA SEÑAL FILTRADA -> FILTRO PASO BANDA
figure();
plot(tiempo,filtrada_normalizada,'LineWidth',2)
title('Señal filtrada');
xlabel('Tiempo [s]');
ylabel('Ampitud [Norm]');
grid on

%%% REPRESENTACIÓN ESPECTRAL DE LA SEÑAL SEÑAL FILTRADA -> FILTRO PASO
%%% BANDA
espectro_filtrado = fft(filtrada_normalizada);
P2_filtrado = 20.*log10(abs(espectro_filtrado./1));
P1_filtrado = P2_filtrado(1:N/2+1);
f_filtrada = fs*(0:(N/2))/N;

figure();
plot(f_filtrada,P1_filtrado,'LineWidth',2)
title('Señal filtrada');
xlabel('Frecuencia [Hz]');
ylabel('Ampitud [dB]');
grid on


