unit VerifySubstitutions;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBODataset, StringSentenceU,
  Vcl.Dialogs;

type
  TVerifySubstitutionsDM = class(TDataModule)
    StepsQ: TIBOQuery;
    StepsQSENTENCE: TIntegerField;
    StepsQSTEP: TIntegerField;
    StepsQARG: TIntegerField;
    StepsQSCOL: TIntegerField;
    SaveDialog1: TSaveDialog;
    StepsQCOL: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    StringSentence : TStringSentence;
  public
    procedure VerifySencences;
  end;

var
  VerifySubstitutionsDM: TVerifySubstitutionsDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Haupt;

{$R *.dfm}

procedure TVerifySubstitutionsDM.DataModuleCreate(Sender: TObject);
begin
  StringSentence := TStringSentence.Create;
end;

procedure TVerifySubstitutionsDM.DataModuleDestroy(Sender: TObject);
begin
  StringSentence.Free;
end;

procedure TVerifySubstitutionsDM.VerifySencences;
  var
    FileName : String;
    F : TextFile;
    Sent, Step, Arg, Col, SCol, i, j, x : Integer;
    Sentence : String;
    OK : Boolean;
begin
  SaveDialog1.DefaultExt := '*.txt';
  SaveDialog1.Title := 'Verify substitutions';
  SaveDialog1.FileName := 'FalseSubstitutions.txt';
  if SaveDialog1.Execute then begin
    FileName := SaveDialog1.FileName;
    AssignFile(F, FileName);
    Rewrite(F);
    try
      StepsQ.Open;
      try
        while not StepsQ.Eof do begin
          Sent := StepsQ.FieldByName('Sentence').Value;
          Step := StepsQ.FieldByName('Step').Value;
          Arg := StepsQ.FieldByName('Arg').Value;
          Col := StepsQ.FieldByName('Col').Value - 1;
          SCol := StepsQ.FieldByName('SCol').Value - 1;
          StringSentence.SetSentence(HauptF.GetSentenceFromStep(Sent, Arg));
          i := StringSentence.PosGridToString(Col);
          j := StringSentence.PosGridToString(SCol);
          Sentence := StringSentence.GetSentence;
          if Sentence[i] in ['K', '('] then begin
            if Copy(Sentence, j + 1, StringSentence.FirstPosAfter(j + 1) - j - 1) <> 'T' then begin
              x := StringSentence.LastConjunction(i - 1);
              if x > 0 then begin
                if not StringSentence.Ancestor(x, j) then begin
                  WriteLn(
                    F,
                    StepsQ.FieldByName('Sentence').AsString + ';' +
                    StepsQ.FieldByName('Step').AsString + ' Ancestor'
                  );
                end;//if
              end else begin
                WriteLn(
                  F,
                  StepsQ.FieldByName('Sentence').AsString + ';' +
                  StepsQ.FieldByName('Step').AsString
                );
              end;//if
            end;//if
          end;//if
          {
          if not StringSentence.CanBeImplied(j) then begin
            WriteLn(
              F,
              StepsQ.FieldByName('Sentence').AsString + ';' +
              StepsQ.FieldByName('Step').AsString
            );
          end;//if
          }
          StepsQ.Next;
        end;//while;
      finally
        StepsQ.Close;
      end;
    finally
      CloseFile(F);
    end;
  end;//if
end;

end.
