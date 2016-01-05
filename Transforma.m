for i=1:Renglones
  v(i,:)= wavread(['BD/' archivos(i,:)]);
end
for i=1:Renglones
  p(i,:)= normalizar(v(i,:));
end
for i=1:Renglones
  Transp(i,:)= abs(fft(p(i,:)));
end