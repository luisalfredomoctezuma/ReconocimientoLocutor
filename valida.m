for i=1:Renglones
  if min_error== error(i)
    if min_error>errorAceptado
      ans = questdlg ("No estas en la base de datos.   \n\n  Desea registrarse?", 'Resultado', 'Si', 'No', 'Si');
      if ( strcmp (ans, 'Si'))
        prompt = {'Nombre','Confirmar'}; default = {'Luis', ' - '}; rc = [2,10; 2,10]; 
        dims = inputdlg (prompt, 'Registro',rc,default);
        if (isempty (dims))
          helpdlg ('Cancelado por el usuario', 'Informacion');
        else
          nombre=(dims{1});
          wavwrite (voz_usuario,['BD/' nombre '.wav']);
          msgbox(['Gracias ' nombre]);
        end
      end
    else
      %playaudio (Transp(i,:))
      error(i)
      msgbox([saludo nombreUsu(i,:)], 'Resultado');
    end
  end
end