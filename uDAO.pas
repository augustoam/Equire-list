unit uDAO;

interface

uses
 SysUtils,
 uDM;

type
  TDAOClass = class
  public
    class procedure RemoveRegistro(sTable: String; sID_Key: String; iID_Key: Integer);
    class procedure InsereItem(iID_Item: Integer; iID_Categoria: Integer; sDescricao: String);
    class procedure InsereCategoria(iID_Categoria: Integer; sCategoria: String);
    class procedure AtualizaRegistro(sTable: String; sColumn: String; sNewReg: String; sID_Key: String; iID_Key: Integer);
  end;

implementation

class procedure TDAOClass.RemoveRegistro(sTable: String; sID_Key: String; iID_Key: Integer);
begin
  with DM.FDAuxiliar do
  begin
    try
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + sTable + ' WHERE ' + sID_Key + ' = ' + IntToStr(iID_Key));
      ExecSQL;
    except on E: Exception do
      begin
        //ShowException(E.Message);
      end;
    end;
  end;
end;

class procedure TDAOClass.InsereItem(iID_Item: Integer; iID_Categoria: Integer; sDescricao: String);
begin
  with DM.FDAuxiliar do
  begin
    try
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ITENS (ID_ITEM, ID_CATEGORIA, DESCRICAO, FAVORITO, IMG_FAVORITO) VALUES( ' );
      SQL.Add(IntToStr(iID_Item) + ', ' + IntToStr(iID_Categoria)+ '"' + sDescricao + '"' + IntToStr(2) + ' ) ' );
      ExecSQL;
    except on E: Exception do
      begin
        //ShowException(E.Message);
      end;
    end;
  end;
end;

class procedure TDAOClass.InsereCategoria(iID_Categoria: Integer; sCategoria: String);
begin
  with DM.FDAuxiliar do
  begin
    try
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO CATEGORIAS (ID_CATEGORIA, CATEGORIA, IMG_CATEGORIA) VALUES( ' );
      SQL.Add(IntToStr(iID_Categoria) + ', "' + sCategoria + '" ) ' );
      ExecSQL;
    except on E: Exception do
      begin
        //ShowException(E.Message);
      end;
    end;
  end;
end;

class procedure TDAOClass.AtualizaRegistro(sTable: String; sColumn: String; sNewReg: String; sID_Key: String; iID_Key: Integer);
begin
  with DM.FDAuxiliar do
  begin
    try
      Close;
      SQL.Clear;
      SQL.Add('UPDATE ' + sTable );
      SQL.Add(' SET ' + sColumn +'='+ '"' + sNewReg + '"' );
      SQL.Add(' WHERE '+ sID_Key +'='+ IntToStr(iID_Key));
      ExecSQL;
    except on E: Exception do
      begin
        //ShowException(E.Message);
      end;
    end;
  end;
end;

end.
