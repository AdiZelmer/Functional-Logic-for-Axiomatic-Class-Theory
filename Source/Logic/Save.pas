unit Save;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSaveF = class(TForm)
    DescriptionM: TMemo;
    Panel1: TPanel;
    AxiomB: TButton;
    CancelB: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    TitleE: TEdit;
    SaveB: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaveF: TSaveF;

implementation

{$R *.dfm}

end.
