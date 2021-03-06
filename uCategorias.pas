unit uCategorias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, StrUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.StdCtrls, FMX.ListView, FMX.Controls.Presentation,
  FMX.TabControl, FMX.Layouts, FMX.Effects, FMX.ListBox, FMX.Edit,
  FMX.Objects, FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList,
  FMX.StdActns, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.Bind.DBScope, FMX.Ani, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.ExtCtrls, FMX.ImgList, System.Generics.Collections, FMX.MultiView, FMX.Gestures,
  FMX.EditBox, FMX.SpinBox, FMX.ComboEdit, Data.FMTBcd, Data.SqlExpr, uDAO;


type
  TfrmCategorias = class(TForm)
    lyCategorias: TLayout;
    BindingsList1: TBindingsList;
    ToolBar: TToolBar;
    BindSourceDB3: TBindSourceDB;
    spbVoltarListas: TSpeedButton;
    spbNovoRegistro: TSpeedButton;
    spbVoltarItens: TSpeedButton;
    lsvListas_Itens: TListView;
    LinkListControlToField3: TLinkListControlToField;
    lsvCategorias: TListView;
    BindSourceDB5: TBindSourceDB;
    BindSourceDB6: TBindSourceDB;
    GestureManager: TGestureManager;
    pnOpcoesItem: TPanel;
    spbRetirarDaLista: TSpeedButton;
    spbExcluirItem: TSpeedButton;
    spbLimparLista: TSpeedButton;
    lsvItensFavoritos: TListView;
    tbcGeral: TTabControl;
    TabItemGeral0: TTabItem;
    TabItemGeral1: TTabItem;
    Panel1: TPanel;
    Panel2: TPanel;
    spbCancelar: TSpeedButton;
    spbOk: TSpeedButton;
    lbListaVazia: TLabel;
    lbToolBar: TLabel;
    Image1: TImage;
    LinkListControlToField4: TLinkListControlToField;
    lsvItens: TListView;
    LinkListControlToField5: TLinkListControlToField;
    LinkListControlToField1: TLinkListControlToField;
    spbEditarItem: TSpeedButton;
    edUnidade: TComboEdit;
    spbQuantidade: TSpinBox;
    Panel3: TPanel;
    pnOpcoesListaItem: TPanel;
    spbRetirarLista: TSpeedButton;
    pn1: TPanel;
    edUnidadeItem: TComboEdit;
    edQuantidadeItem: TSpinBox;
    Panel4: TPanel;
    pn2: TPanel;
    spbCancelarOpcoes: TSpeedButton;
    spbOkOpcoes: TSpeedButton;
    tbcCategoriasItens: TTabControl;
    TabItemCategorias: TTabItem;
    TabItemItens: TTabItem;
    recTutorialLista: TRectangle;
    callTutorial: TCalloutRectangle;
    lbTutorial: TLabel;
    callTutorialItens: TCalloutRectangle;
    lbTutorialItens: TLabel;
    procedure spbNovoRegistroClick(Sender: TObject);
    procedure lsvCategoriasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure spbVoltarItensClick(Sender: TObject);
    procedure spbVoltarNovoItemClick(Sender: TObject);
    procedure spbVoltarListasClick(Sender: TObject);
    procedure lsvListas_ItensItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbCancelarClick(Sender: TObject);
    procedure spbExcluirItemClick(Sender: TObject);
    procedure spbRetirarDaListaClick(Sender: TObject);
    procedure spbLimparListaClick(Sender: TObject);
    procedure lsvItensScrollViewChange(Sender: TObject);
    procedure lsvItensFavoritosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemObject);
    procedure lsvItensFavoritosScrollViewChange(Sender: TObject);
    procedure TabItemGeral0Click(Sender: TObject);
    procedure TabItemGeral1Click(Sender: TObject);
    procedure spbOkClick(Sender: TObject);
    procedure lsvListas_ItensDeletingItem(Sender: TObject; AIndex: Integer;
      var ACanDelete: Boolean);
    procedure lsvItensPullRefresh(Sender: TObject);
    procedure lsvCategoriasPullRefresh(Sender: TObject);
    procedure lsvCategoriasGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure lsvCategoriasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure lsvItensItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lsvItensMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure spbEditarItemClick(Sender: TObject);
    procedure lsvListas_ItensMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure spbCancelarOpcoesClick(Sender: TObject);
    procedure spbOkOpcoesClick(Sender: TObject);
    procedure spbRetirarListaClick(Sender: TObject);
    procedure lbTutorialItensClick(Sender: TObject);
    procedure recTutorialListaClick(Sender: TObject);
    procedure callTutorialItensClick(Sender: TObject);

  private
    FTimeStamp: TDateTime;
  public
    procedure VoltarEdicaoCat;
    procedure AtualizaBotoes;
    procedure AtualizaListas;
    procedure AtualizaItens;
    procedure CancelaOpcoesItem;
    procedure DMAtualizaItens;
    procedure DMAtualizaListas;
    procedure DMAtualizaCategorias;
    procedure ListaVazia;
  end;

var
  frmCategorias: TfrmCategorias;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses uMain, uDM, System.DateUtils;

procedure TfrmCategorias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbcCategoriasItens.ActiveTab := TabItemCategorias;

  DM.FDItens.Active            := False;
  DM.FDListas_ItensCrud.Active := False;
  DM.FDItensCrud.Active        := False;
end;

procedure TfrmCategorias.FormCreate(Sender: TObject);
begin
  //Querys
  DM.FDItens.Active            := True;
  DM.FDListas_ItensCrud.Active := True;

  //TabControl
  tbcCategoriasItens.TabPosition := TTabPosition.None;
  tbcGeral.ActiveTab             := TabItemGeral0;

  //Botoes
  AtualizaBotoes;
  spbVoltarListas.Visible := True;
  spbLimparLista.Visible  := True;
  AtualizaListas;
  pnOpcoesItem.SendToBack;
  ListaVazia;
  lsvCategorias.Canvas.Fill.Color := TAlphaColorRec.Aliceblue;

  lbToolBar.Text := DM.FDListas_UsuariosDESCRICAO.AsString;

  if frmMain.iTutorial = 1 then
  begin
    recTutorialLista.Visible := True;
    callTutorialItens.Visible := True;
  end;
end;

procedure TfrmCategorias.lbTutorialItensClick(Sender: TObject);
begin
  callTutorialItens.Visible := False;
end;

procedure TfrmCategorias.ListaVazia;
begin
  if DM.FDListas_Itens.IsEmpty then
    lbListaVazia.Visible := True
  else
    lbListaVazia.Visible := False;
end;

procedure TfrmCategorias.DMAtualizaItens;
begin
  DM.FDItens.Active := False;
  DM.FDItens.Active := True;
  DM.FDItensCrud.Active := False;
  DM.FDItensCrud.Active := True;
end;

procedure TfrmCategorias.DMAtualizaListas;
begin
  DM.FDListas_Itens.Active := False;
  DM.FDListas_Itens.Active := True;
  DM.FDListas_ItensCrud.Active := False;
  DM.FDListas_ItensCrud.Active := True;
end;

procedure TfrmCategorias.DMAtualizaCategorias;
begin
  DM.FDCategoriasCrud.Active := False;
  DM.FDCategoriasCrud.Active := True;
  DM.FDCategorias.Active     := False;
  DM.FDCategorias.Active     := True;
end;

procedure TfrmCategorias.lsvCategoriasPullRefresh(Sender: TObject);
begin
  DMAtualizaCategorias;
end;

procedure TfrmCategorias.spbEditarItemClick(Sender: TObject);
begin
  frmMain.spbPanelEditarClick(Self);
  CancelaOpcoesItem;
end;

procedure TfrmCategorias.spbExcluirItemClick(Sender: TObject);
begin
  MessageDlg('Excluir Item do aplicativo?', TMsgDlgType.mtConfirmation,
            [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, procedure (const AResult: TModalResult)
  begin
    if AResult = mrYes then
    begin
      TDAOClass.RemoveRegistro('ITENS', 'ID_ITEM', DM.FDItensID_ITEM.AsInteger);
      DM.FDItens.Refresh;
      AtualizaItens;
    end;
    CancelaOpcoesItem;
  end
  );
end;

procedure TfrmCategorias.spbLimparListaClick(Sender: TObject);
begin
  MessageDlg('Deseja realmente esvaziar esta lista?', TMsgDlgType.mtConfirmation,
            [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, procedure (const AResult: TModalResult)
  begin
    if AResult = mrYes then
    begin
      DM.FDListas_Itens.First;
      While not DM.FDListas_Itens.EOF do
      begin
        TDAOClass.RemoveRegistro('LISTA_ITENS', 'ID_ITEM', DM.FDListas_ItensID_ITEM.AsInteger);
        DM.FDListas_Itens.Next;
      end;
      DMAtualizaListas;
      ListaVazia;
    end;
  end
  );
end;

procedure TfrmCategorias.lsvListas_ItensDeletingItem(Sender: TObject;
  AIndex: Integer; var ACanDelete: Boolean);
var
  sItem: String;
begin
  lsvListas_Itens.BeginUpdate;
  try
    with DM.FDListas_ItensCrud do
    begin
      sItem := lsvListas_Itens.Items[AIndex].Text;
      DM.FDListas_Itens.Locate('DESCRICAO', sItem, []);
      Locate('ID_ITEM', DM.FDListas_ItensID_ITEM.AsInteger, []);
      Delete;
    end;
  finally
    AtualizaListas;
    lsvListas_Itens.EndUpdate;
  end;
end;

procedure TfrmCategorias.CancelaOpcoesItem;
begin
   pnOpcoesItem.SendToBack;
  pnOpcoesItem.Visible := False;
  frmMain.HideBackground;
end;

procedure TfrmCategorias.spbCancelarClick(Sender: TObject);
begin
  CancelaOpcoesItem;
end;

procedure TfrmCategorias.spbCancelarOpcoesClick(Sender: TObject);
begin
  pnOpcoesListaItem.SendToBack;
  pnOpcoesListaItem.Visible := False;
  frmMain.HideBackground;
end;

procedure TfrmCategorias.spbRetirarDaListaClick(Sender: TObject);
var
  i: Integer;
begin
  i := DM.FDItens.RecNo-1;
  lsvItens.items.item[i].Objects.TextObject.Font.Style := [];
  lsvItens.items.item[i].Objects.AccessoryObject.Visible := False;
  TDAOClass.RemoveRegistro('LISTA_ITENS', 'ID_ITEM', DM.FDItensID_ITEM.AsInteger);
  CancelaOpcoesItem;
end;

procedure TfrmCategorias.spbRetirarListaClick(Sender: TObject);
begin
  TDAOClass.RemoveRegistro('LISTA_ITENS', 'ID_ITEM', DM.FDListas_ItensID_ITEM.AsInteger);
  DMAtualizaListas;
  AtualizaListas;
  spbCancelarOpcoesClick(Sender);
end;

procedure TfrmCategorias.lsvItensFavoritosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemObject);
var
  iIDItem: integer;
begin
  with DM.FDItens do
  begin
    iIDItem := DM.FDItensID_ITEM.AsInteger;
    try
      DisableControls;
      Edit;
      if DM.FDItensFAVORITO.AsInteger = 1 then
      begin
        //TBlobField(FieldByName('IMG_FAVORITO')).LoadFromFile('/storage/emulated/0/Android/data/estrelaCinza.png');
        FieldByName('FAVORITO').AsInteger := 2;
      end else
      begin
        //TBlobField(FieldByName('IMG_FAVORITO')).LoadFromFile('/storage/emulated/0/Android/data/estrelaAmarela.png');
        FieldByName('FAVORITO').AsInteger := 1;
      end;
      Post;
      DMAtualizaItens;
    finally
      EnableControls;
      Locate('ID_ITEM', iIDItem, []);
    end;
  end;
end;

procedure TfrmCategorias.lsvItensFavoritosScrollViewChange(Sender: TObject);
begin
  lsvItens.ScrollViewPos := lsvItensFavoritos.ScrollViewPos;
end;

procedure TfrmCategorias.lsvItensItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  i: Integer;
begin
  if (MilliSecondOf(Now-FTimeStamp) > 200) then
  begin
    frmMain.ShowBackground(Self.lyCategorias, spbCancelarClick);
    pnOpcoesItem.Visible := True;
    pnOpcoesItem.BringToFront;
    pnOpcoesItem.AnimateFloat('position.y', 150);
  end else
  begin
    with DM.FDListas_ItensCrud do
    begin
      if DM.FDItensITEM_DA_LISTA.AsString = 'N' then
      begin
        Append;
        FieldByName('ID_LISTA_ITENS').AsInteger  := DM.FProxListaItem;
        FieldByName('ID_ITEM').AsInteger         := DM.FDItensID_ITEM.AsInteger;
        FieldByName('ID_CATEGORIA').AsInteger    := DM.FDItensID_CATEGORIA.AsInteger;
        FieldByName('ID_LISTA_CRIADA').AsInteger := DM.FDListas_UsuariosID_LISTA.AsInteger;
        Post;
        DMAtualizaListas;
        DM.FDItens.Refresh;
      end;
    end;
    i := DM.FDItens.RecNo-1;
    lsvItens.items.item[i].Objects.TextObject.Font.Style := [TFontStyle.fsBold];
    lsvItens.items.item[i].Objects.AccessoryObject.Visible := True;
  end;
end;

procedure TfrmCategorias.lsvItensMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FTimeStamp := Now;
end;

procedure TfrmCategorias.lsvItensPullRefresh(Sender: TObject);
begin
  DM.FDItensCrud.Active := False;
  DM.FDItensCrud.Active := True;
end;

procedure TfrmCategorias.lsvCategoriasGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if not EventInfo.GestureID = System.UITypes.igiLongTap then begin

  end;
end;

procedure TfrmCategorias.lsvCategoriasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if (MilliSecondOf(Now-FTimeStamp) > 200) then
    frmMain.PanelAcoes
  else
  begin
    try
      tbcCategoriasItens.Next();
      pnOpcoesItem.SendToBack;
      with DM.FDItens do
      begin
        Active := False;
        ParamByName('ID_LISTA_CRIADA').AsInteger := DM.FDListas_UsuariosID_LISTA.AsInteger;
        if DM.FDCategoriasCATEGORIA.AsString = 'Favoritos' then
        begin
          ParamByName('ID_CATEGORIA').AsInteger := 0;
          ParamByName('FAVORITO').AsInteger := 1;
        end else
        begin
          ParamByName('ID_CATEGORIA').AsInteger := DM.FDCategoriasID_CATEGORIA.AsInteger;
          ParamByName('FAVORITO').AsInteger     := 0;
        end;
        Active := True;
      end;
      AtualizaBotoes;
      spbNovoRegistro.Visible := True;
      spbVoltarItens.Visible  := True;
      AtualizaItens;
      frmMain.HideBackground;
    except
      frmMain.MsgErro('Ops, ocorreu um erro! =(');
    end;
  end;
end;

procedure TfrmCategorias.lsvCategoriasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FTimeStamp := Now;
end;

procedure TfrmCategorias.lsvItensScrollViewChange(Sender: TObject);
begin
  lsvItensFavoritos.ScrollViewPos := lsvItens.ScrollViewPos;
end;

procedure TfrmCategorias.lsvListas_ItensItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemObject);
begin
  if (MilliSecondOf(Now-FTimeStamp) > 200) then
  begin
    frmMain.ShowBackground(Self.lyCategorias, spbCancelarOpcoesClick);
    pnOpcoesListaItem.Visible := True;
    pnOpcoesListaItem.BringToFront;
    pnOpcoesListaItem.AnimateFloat('position.y', 200);
  end else
  begin
    with DM.FDListas_Itens do
    begin
      if DM.FDListas_ItensITEM_NA_LISTA.AsInteger = 1 then
      begin
        Edit;
        FieldByName('ITEM_NA_LISTA').AsInteger := 0;
        Post;
      end else
      if DM.FDListas_ItensITEM_NA_LISTA.AsInteger = 0 then
      begin
        Edit;
        FieldByName('ITEM_NA_LISTA').AsInteger := 1;
        Post;
      end;
      AtualizaListas;
    end;
  end;
end;

procedure TfrmCategorias.lsvListas_ItensMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FTimeStamp := Now;
end;

procedure TfrmCategorias.recTutorialListaClick(Sender: TObject);
begin
  RecTutorialLista.Visible := False;
end;

procedure TfrmCategorias.spbNovoRegistroClick(Sender: TObject);
begin
  frmMain.MultiViewEdicao.ShowMaster;
  if (tbcCategoriasItens.ActiveTab = TabItemCategorias) then
  begin
    DM.FDCategorias.Append;
    DM.FDCategoriasCrud.Append;
    frmMain.spbSalvarNovaCategoria.Visible := True;
    frmMain.lbLabel.Text := 'Nova Categoria';
    frmMain.imgFoto.Visible := True;
  end else
  if (tbcCategoriasItens.ActiveTab = TabItemItens) then
  begin
    DM.FDItens.Append;
    DM.FDItensCrud.Append;
    frmMain.spbSalvarNovoItem.Visible := True;
    frmMain.lbLabel.Text := 'Novo Item';
    frmMain.imgFotoItem.Visible := True;
    frmMain.edCategoria.Visible := True;
  end;
  frmMain.ImagemFundo.Visible := True;
  frmMain.edNome.Text := '';
  frmMain.edNome.SetFocus;
  frmMain.NewOrEdit := 0;
end;

procedure TfrmCategorias.spbOkClick(Sender: TObject);
var
  i: Integer;
begin
  with DM.FDListas_ItensCrud do
  begin
    if Locate('ID_ITEM', DM.FDItensID_ITEM.AsInteger, []) then
    begin
      Edit;
      FieldByName('QTD_UNMED').AsString := spbQuantidade.Text + ' ' + edUnidade.Text;
      Post;
    end else

    with DM.FDListas_ItensCrud do
    begin
      i := DM.FDItens.RecNo-1;
      lsvItens.items.item[i].Objects.TextObject.Font.Style := [TFontStyle.fsBold];
      lsvItens.items.item[i].Objects.AccessoryObject.Visible := True;

      if DM.FDItensITEM_DA_LISTA.AsString = 'N' then
      begin
        Append;
        FieldByName('ID_LISTA_ITENS').AsInteger  := DM.FProxListaItem;
        FieldByName('ID_ITEM').AsInteger         := DM.FDItensID_ITEM.AsInteger;
        FieldByName('ID_CATEGORIA').AsInteger    := DM.FDItensID_CATEGORIA.AsInteger;
        FieldByName('ID_LISTA_CRIADA').AsInteger := DM.FDListas_UsuariosID_LISTA.AsInteger;
        FieldByName('QTD_UNMED').AsString        := spbQuantidade.Text + ' ' + edUnidade.Text;
        Post;
        DMAtualizaListas;
      end;
    end;
  end;
  CancelaOpcoesItem;
end;

procedure TfrmCategorias.spbOkOpcoesClick(Sender: TObject);
begin
  try
    with DM.FDListas_ItensCrud do
    begin
      Locate('ID_ITEM', DM.FDListas_ItensID_ITEM.AsInteger, []);
      Edit;
      FieldByName('QTD_UNMED').AsString := edQuantidadeItem.Text + ' ' + edUnidadeItem.Text;
      Post;
    end;
  except
    frmMain.MsgErro('Ops, um erro ocorreu =(');
  end;
  DMAtualizaListas;
  AtualizaListas;
  spbCancelarOpcoesClick(Sender);
end;

procedure TfrmCategorias.spbVoltarItensClick(Sender: TObject);
begin
  tbcCategoriasItens.Previous();
  AtualizaBotoes;
  spbNovoRegistro.Visible := True;
  DM.FDItens.Active := False;
  CancelaOpcoesItem;
end;

procedure TfrmCategorias.spbVoltarListasClick(Sender: TObject);
begin
  ToolBar.Visible := False;
  lyCategorias.Visible := False;
  frmMain.ChamaListas;
end;

procedure TfrmCategorias.spbVoltarNovoItemClick(Sender: TObject);
begin
  tbcGeral.TabPosition := TTabPosition.Top;
  AtualizaBotoes;
  spbVoltarItens.Visible := True;
  DM.FDItens.Cancel;
end;

procedure TfrmCategorias.TabItemGeral0Click(Sender: TObject);
begin
  DMAtualizaListas;
  AtualizaBotoes;
  spbVoltarListas.Visible := True;
  spbLimparLista.Visible  := True;
  tbcCategoriasItens.ActiveTab := TabItemCategorias;
  //CancelaOpcoesItem;
  AtualizaListas;
  ListaVazia;

  if frmMain.iTutorial = 1 then
    callTutorialItens.Visible := False;
end;

procedure TfrmCategorias.TabItemGeral1Click(Sender: TObject);
begin
  DMAtualizaCategorias;
  AtualizaBotoes;
  spbNovoRegistro.Visible := True;
  tbcCategoriasItens.ActiveTab := TabItemCategorias;

  if frmMain.iTutorial = 1 then
    recTutorialLista.Visible := False
end;

procedure TfrmCategorias.VoltarEdicaoCat;
begin
  if DM.FDCategoriasCrud.State in dsEditModes then
    DM.FDCategoriasCrud.Cancel;
  DMAtualizaCategorias;
end;

procedure TfrmCategorias.AtualizaBotoes;
begin
  spbVoltarListas.Visible := False;
  spbVoltarItens.Visible  := False;
  spbNovoRegistro.Visible := False;
  spbLimparLista.Visible  := False;
end;

procedure TfrmCategorias.AtualizaItens;
var
  i: integer;
begin
  try
    with DM.FDItens do
    begin
      try
        DisableControls;
        Active := False;
        Active := True;
        First;
        for i := 0 to lsvItens.items.count-1 do
        begin
          if DM.FDItensITEM_DA_LISTA.AsString = 'S' then
          begin
            lsvItens.items.item[i].Objects.TextObject.Font.Style := [TFontStyle.fsBold];
            lsvItens.items.item[i].Objects.AccessoryObject.Visible := True;
          end;
          if not (i = lsvItens.items.count-1) then
            Next;
        end;
      finally
        EnableControls;
      end;
    end;
  except
    frmMain.MsgErro('Ops, ocorreu um erro! =(');
  end;
end;

procedure TfrmCategorias.AtualizaListas;
var
  i: Integer;
begin
  try
    with DM.FDListas_Itens do
    begin
      try
        DisableControls;
        Active := False;
        Active := True;
        First;
        for i := 0 to lsvListas_Itens.items.count-1 do
        begin
          if lsvListas_Itens.items.item[i].Text = DM.FDListas_ItensDESCRICAO.AsString then
          begin
            if DM.FDListas_ItensITEM_NA_LISTA.AsInteger = 1 then
            begin
              lsvListas_Itens.items.item[i].Objects.TextObject.Font.Style := [TFontStyle.fsStrikeOut] ;
              lsvListas_Itens.items.item[i].Objects.TextObject.TextColor := TAlphaColorRec.Green
            end else
            if DM.FDListas_ItensITEM_NA_LISTA.AsInteger = 0 then
            begin
              lsvListas_Itens.items.item[i].Objects.TextObject.Font.Style := [];
              lsvListas_Itens.items.item[i].Objects.TextObject.TextColor := TAlphaColorRec.Red;
            end;
            if not (i = lsvListas_Itens.items.count-1) then
              Next;
          end;
        end;
      finally
        EnableControls;
      end;
    end;
  except
    frmMain.MsgErro('Ops, ocorreu um erro! =(');
  end;
end;

procedure TfrmCategorias.callTutorialItensClick(Sender: TObject);
begin
  callTutorialItens.Visible := False;
end;

end.
