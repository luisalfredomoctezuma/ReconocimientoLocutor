%clear, clc;
%x=record(2,8000);


%[B, samples_per_sec, bits_per_sample] = wavread ('voz.wav');
x=record (1,8000);
[tama ren]=size(x)
playaudio(x);

%sound(B, samples_per_sec, bits_per_sample);

% v3=wavread('voz.wav');
%x=record (2, 8000)
% A = [-1:0.1:1; -1:0.1:1]';  % A se obtiene con record
%fname='BD/prueba.wav';
%wavwrite (v3, fname); 

%voz_usuario=wavread('voz.wav');
%usuario=normalizar(voz_usuario);
%TransUsuario=abs(fft(usuario));