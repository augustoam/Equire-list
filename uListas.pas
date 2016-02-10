unit uListas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListView,
  FMX.Objects, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Layouts, uCategorias, Data.DB, FMX.TabControl,
  FMX.Edit, FMX.ListView.Types, FMX.ImgList, FMX.Gestures, FMX.MaterialSources,
  FMX.Ani;

type
  TfrmListas = class(TForm)
    tbNovaLista: TToolBar;
    spbVoltar: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    lytListas: TLayout;
    lsvListas: TListView;
    tbcListas: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Layout1: TLayout;
    lsvSuasListas: TListView;
    tbListas: TToolBar;
    spbMenu: TSpeedButton;
    BindSourceDB2: TBindSourceDB;
    lbNovaLista: TLabel;
    pnObservacao: TPanel;
    edObservacao: TEdit;
    spbOk: TSpeedButton;
    spbCancelar: TSpeedButton;
    ClearEditButton1: TClearEditButton;
    spbNovaLista: TSpeedButton;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    Image1: TImage;
    Image2: TImage;
    lbSuasListas: TLabel;
    lbListaVazia: TLabel;
    recTutorial: TRectangle;
    CalloutRectangle1: TCalloutRectangle;
    Label1: TLabel;
    procedure lsvListasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure spbVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbNovaListaClick(Sender: TObject);
    procedure lsvSuasListasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure spbOkClick(Sender: TObject);
    procedure spbCancelarClick(Sender: TObject);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure spbMenuClick(Sender: TObject);
    procedure recTutorialClick(Sender: TObject);
    procedure lsvSuasListasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
    FTimeStamp: TDateTime;
    procedure AtualizaListasUsuarios;
    procedure AtualizaListas;

  end;

var
  frmListas: TfrmListas;

implementation

{$R *.fmx}

uses uDM, uMain, System.DateUtils;

procedure TfrmListas.FormCreate(Sender: TObject);
begin
  tbcListas.ActiveTab := TabItem1;
  tbcListas.TabPosition := TTabPosition.None;

  DM.FDListas_Base.Active := True;
  DM.FDListas_Itens.Active := True;
  DM.FDListas_UsuariosCrud.Active := True;
  AtualizaListas;
end;

procedure TfrmListas.AtualizaListas;
begin
  if DM.FDListas_Usuarios.IsEmpty then
    lbListaVazia.Visible := True
  else
    lbListaVazia.Visible := False;
end;

procedure TfrmListas.AtualizaListasUsuarios;
begin
  DM.FDListas_Usuarios.Active := False;
  DM.FDListas_Usuarios.Active := True;
  DM.FDListas_UsuariosCrud.Active := False;
  DM.FDListas_UsuariosCrud.Active := True;
end;

procedure TfrmListas.ClearEditButton1Click(Sender: TObject);
begin
  edObservacao.Text := '';
end;

procedure TfrmListas.lsvListasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  edObservacao.SetFocus;
  frmMain.ShowBackground(Self.lytListas, spbCancelarClick);
  pnObservacao.Visible := True;
  pnObservacao.BringToFront;
  frmMain.NewOrEdit := 0;
end;

procedure TfrmListas.lsvSuasListasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if (MilliSecondOf(Now-FTimeStamp) > 200) then
    frmMain.PanelAcoes
  else
  begin
    with DM.FDListas_Itens do
    begin
      Active := False;
      ParamByName('ID_LISTA_CRIADA').AsInteger := DM.FDListas_UsuariosID_LISTA.AsInteger;
      Active := True;
    end;
    lytListas.Visible := False;
    frmMain.ChamaCategoria;
  end;
end;

procedure TfrmListas.lsvSuasListasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FTimeStamp := Now;
end;

procedure TfrmListas.recTutorialClick(Sender: TObject);
begin
  recTutorial.Visible := False;
end;

procedure TfrmListas.spbCancelarClick(Sender: TObject);
begin
  pnObservacao.Visible := False;
  frmMain.HideBackground;
end;

procedure TfrmListas.spbMenuClick(Sender: TObject);
begin
  frmMain.MultiView.ShowMaster;
end;

procedure TfrmListas.spbNovaListaClick(Sender: TObject);
begin
  tbcListas.Next();
  recTutorial.Visible := False;
end;

procedure TfrmListas.spbOkClick(Sender: TObject);
begin
  try
    with DM.FDListas_UsuariosCrud do
    begin
      if frmMain.NewOrEdit = 1 then
      begin
        Locate('ID_LISTA', DM.FDListas_UsuariosID_LISTA.AsInteger, []);
        Edit;
        FieldByName('OBSERVACAO').AsString := edObservacao.Text;
        Post;
      end else
      begin
        AtualizaListasUsuarios;
        Append;
        if State in [dsInsert] then
        begin
          FieldByName('ID_LISTA').AsInteger := DM.FProxListaUsuario;
          FieldByName('ID_LISTA_BASE').AsInteger := DM.FDListas_BaseID_LISTA.AsInteger;
          FieldByName('OBSERVACAO').AsString := edObservacao.Text;
          Post;
        end;
      end;
    end;
  finally
    AtualizaListasUsuarios;
    pnObservacao.Visible := False;
    frmMain.HideBackground;
    atualizaListas;
    tbcListas.Previous();
  end;
end;

procedure TfrmListas.spbVoltarClick(Sender: TObject);
begin
  tbcListas.Previous();
end;

end.
