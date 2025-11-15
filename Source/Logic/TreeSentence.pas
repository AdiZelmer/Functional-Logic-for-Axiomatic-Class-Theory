unit TreeSentence;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TTreeSentenceF = class(TForm)
    Panel1: TPanel;
    CancelB: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    TitleE: TEdit;
    Tree: TTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TreeSentenceF: TTreeSentenceF;

implementation

{$R *.dfm}

end.
