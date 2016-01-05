clc; clear;
archivos= ls('BD'); [Renglones Columnas]=size(archivos)
%mutation = 0.7; mutation_step = 0.8;
saludo;
Transforma; % fft a BD
grabar;

%maximo=max(usuario), ErrorAcepta=(maximo*8)
maximo=max(voz_usuario);
errorAceptado=(maximo*13);
%errorAceptado=6.5;

%dlmwrite ('vUsuario1', voz_usuario, "delimiter", "\n"); dlmwrite ('vUsuario2', usuario, "delimiter", "\n"); dlmwrite ('vUsuario3', TransUsuario, "delimiter", "\n");

%Iteraciones
for i=1:Renglones
  locutorN(i,:)=archivos(i,:);
  error(i)=mean(abs(Transp(i,:) - TransUsuario));
end
error
% Quitar .wav de nombre
[rr cc]=size(locutorN); nombreUsu='';
for j=1:rr
  for i=1:cc
  	if locutorN(j,i)=='.',nombreUsu(j,i)= ' ';  break; else, nombreUsu(j,i)=locutorN(j,i); end
  end
end
% Determinar con un GA el errorAceptado, cuando el error minimo si pertenece a un locutor y cuando no. 
% Ya se sabe cual es el mas probable, ahora determinar si ese mas probable es realmente la persona en cuestion o solo un imitador.
% cuantos decibeles puede cambiar una voz al estar enfermo? , tratando de decirlo lo mejor posible.

%Funcion fitness
%Funcion fitness
min_error=min(error);
for i=1:Renglones
  if min_error== error(i)
    Candidato=Transp(i,:);
    Temporal=abs(Transp(i,:) - TransUsuario);
    %dlmwrite ('error', Temporal, "delimiter", "\n");
    %promedio=mean(abs(Temporal))
  end
end
valida;
