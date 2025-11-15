unit QuantifierType;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TQuantifierTypeF = class(TForm)
    QuantifierRG: TRadioGroup;
    ConditionRG: TRadioGroup;
    Panel1: TPanel;
    CancelB: TButton;
    SaveB: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuantifierTypeF: TQuantifierTypeF;

implementation

{$R *.dfm}

end.
