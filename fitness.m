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