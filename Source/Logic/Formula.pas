unit Formula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, StringSentenceU,
  Data.DB, IBODataset, AZExtender;

type
  TFormulaF = class(TForm)
    DescriptionM: TMemo;
    Panel1: TPanel;
    VerifyB: TButton;
    CancelB: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    FormulaE: TEdit;
    SaveB: TButton;
    Panel3: TPanel;
    Label2: TLabel;
    TitleE: TEdit;
    FormulaIQ: TIBOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure VerifyBClick(Sender: TObject);
    procedure FormulaEChange(Sender: TObject);
    procedure SaveBClick(Sender: TObject);
    procedure FormulaEKeyPress(Sender: TObject; var Key: Char);
  private
    StringSentence : TStringSentence;
    Arg1, Arg2 : String;
  public
    { Public declarations }
  end;

var
  FormulaF: TFormulaF;

implementation

{$R *.dfm}

uses Haupt, CommonDefs;

procedure TFormulaF.FormCreate(Sender: TObject);
begin
  StringSentence := TStringSentence.Create;
end;

procedure TFormulaF.FormDestroy(Sender: TObject);
begin
  StringSentence.Free;
end;

procedure TFormulaF.FormulaEChange(Sender: TObject);
begin
  SaveB.Enabled := False;
  VerifyB.Enabled := True;
end;

procedure TFormulaF.FormulaEKeyPress(Sender: TObject; var Key: Char);
begin
  if                Key = 'x' then begin
    Key := 'X';
  end else begin if Key = 'v' then begin
    Key := 'V';
  end else begin if Key = 'd' then begin
    Key := 'D';
  end else begin if Key = 'c' then begin
    Key := 'C';
  end else begin if Key = 'n' then begin
    Key := 'N';
  end else begin if Key = 't' then begin
    Key := 'T';
  end else begin if Key = 'P' then begin
    Key := 'p';
  end else begin if Key = 'Q' then begin
    Key := 'q';
  end else begin if Key = 'R' then begin
    Key := 'r';
  end else begin if Key = 'S' then begin
    Key := 's';
  end else begin if Key in BadChars then begin
    Key := #0;
    Beep;
  end end end end end end end end end end end;//if
end;

procedure TFormulaF.SaveBClick(Sender: TObject);
begin
  FormulaIQ.ParamByName('Title').AsString := TitleE.Text;
  FormulaIQ.ParamByName('Description').AsString := DescriptionM.Text;
  FormulaIQ.ParamByName('Formula').AsString := FormulaE.Text;
  FormulaIQ.ParamByName('Arg1').AsString := Arg1;
  FormulaIQ.ParamByName('Arg2').AsString := Arg2;
  try
    FormulaIQ.ExecSQL;
    HauptF.EmptyFilterBClick(Self);
    HauptF.FormulasT.Refresh;
    HauptF.FormulasT.Locate('Formula', FormulaE.Text, []);
    ModalResult := mrOK;
  except
    on E : Exception do begin
      if E is EDatabaseError then begin
        MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
      end else begin
        MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end;//on
  end;//try
end;

procedure TFormulaF.VerifyBClick(Sender: TObject);
begin
  if StringSentence.VerifyFormula(FormulaE.Text) then begin
    StringSentence.SeparArguments(FormulaE.Text, Arg1, Arg2);
    if FormulaE.Text[1] = Sdou then begin
      DescriptionM.Lines.Text := Arg1 + ' <--> ' + Arg2;
    end else begin
      DescriptionM.Lines.Text := Arg1 + ' --> ' + Arg2;
    end;
    VerifyB.Enabled := False;
    TitleE.SetFocus;
    SaveB.Enabled := True;
  end else begin
    DescriptionM.Lines.Text := '';
  end;//
end;

end.
