unit ExistUniqueU;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Buttons, Vcl.ExtCtrls, System.StrUtils,
  Vcl.StdCtrls, CommonDefs, StringSentenceU;

type
  TExistUnique = class(TObject)
  private
    ExistSentence : TStringSentence;
    UniqueSentence : TStringSentence;
    Exist : String;
    Unique : String;
    LenE : Integer;
    LenU : Integer;
    procedure Conditions(i, p : Integer; var Cond1, Cond2 : String);
    function MakeLinks(p : Integer) : String;
  public
    constructor Create(Exist, Unique : String);
    destructor Destroy; override;
    function DefinesAFunction : Boolean;
    function GetFunction(Operation : String; var nr : Integer) : String;
  end;

implementation

constructor TExistUnique.Create(Exist, Unique : String);
begin
  inherited Create;
  ExistSentence := TStringSentence.Create;
  UniqueSentence := TStringSentence.Create;
  ExistSentence.SetSentence(Exist);
  UniqueSentence.SetSentence(Unique);
  Self.Exist := Exist;
  Self.Unique := Unique;
  LenE := Length(Exist);
  LenU := Length(Unique);
end;

destructor TExistUnique.Destroy;
begin
  ExistSentence.Free;
  UniqueSentence.Free;
  inherited Destroy;
end;

function TExistUnique.MakeLinks(p : Integer) : String;
// p trebuie sa fie pe prima pozitie a conditiei lui Exist.
  var
    q : Integer;
    OK : Boolean;
begin
  Result := '';
  q := 1;
  OK := True;
  while OK and (q <= LenE) do begin
    if Exist[q] = Suni then begin
      Result :=
        Result + Spoi +
        IntToStr(ExistSentence.QuantifierParentsNumber(q, p) - 1)
      ;
      q := ExistSentence.FirstPosAfter(q + 1);
    end else begin
      OK := False;
    end;//if
  end;//while
end;

procedure TExistUnique.Conditions(i, p : Integer; var Cond1, Cond2 : String);
  var
    Gp, Np : Integer;
begin
  Cond1 := Copy(Exist, p, LenE - p + 1);
  Cond2 := '';
  while p <= LenE do begin
    if Exist[p] = Spoi then begin
      Gp := ExistSentence.GetQuantifier(p);
      if Gp < i then begin
        Inc(p);
        Np := ExistSentence.GetNumber(p);
        Cond2 := Cond2 + Spoi + IntToStr(Np + 1);
      end else begin // Gp >= i
        Inc(p);
        Np := ExistSentence.GetNumber(p);
        Cond2 := Cond2 + Spoi + IntToStr(Np);
      end;//if
    end else begin
      Cond2 := Cond2 + Exist[p];
      Inc(p);
    end;//if
  end;//while
end;

function TExistUnique.DefinesAFunction : Boolean;
  var
    NrA : Integer;
    i, j, k, p : Integer;
    OK : Boolean;
    Cond1, Cond2 : String;
begin
  Result := False;
  NrA := 0;
  i := 1;
  OK := True;
  while OK and (i <= LenE) do begin
    if ExistSentence.GetSentence[i] = Suni then begin
      i := ExistSentence.FirstPosAfter(i + 1);
      Inc(NrA);
    end else begin
      OK := False;
    end;//if
  end;//while
  if Exist[i] = Sexi then begin
    if Exist[i + 1] = Stru then begin
      if Copy(Exist, 1, i - 1) = Copy(Unique, 1, i - 1) then begin
        if Unique[i] = Suni then begin
          j := i + 1;
          j := UniqueSentence.FirstPosAfter(j);
          if Unique[j] = Suni then begin
            p := i + 2;
            Conditions(i, p, Cond1, Cond2);
            if Copy(Unique, i + 1, j - i - 1) = Cond1 then begin
              k := UniqueSentence.FirstPosAfter(j + 1);
              if Copy(Unique, j + 1, k - j - 1) = Cond2 then begin
                if Copy(Unique, k, LenU + 1) = Seqa + Spoi + '2' + Spoi + '1' then begin
                  Result := True;
                end else begin
                  MessageDlg(
                    'Wrong equality!',
                    mtWarning, [mbOK], 0
                  );
                end;//if
              end else begin
                MessageDlg(
                  'Wrong condition!',
                  mtWarning, [mbOK], 0
                );
              end;//if
            end else begin
              MessageDlg(
                'Wrong condition!',
                mtWarning, [mbOK], 0
              );
            end;//if
          end else begin
            MessageDlg(
              'The last two quantifiers of the uniquity sentence must be universal quantifiers!',
              mtWarning, [mbOK], 0
            );
          end;//if
        end else begin
          MessageDlg(
            'The last two quantifiers of the uniquity sentence must be universal quantifiers!',
            mtWarning, [mbOK], 0
          );
        end;//
      end else begin
        MessageDlg(
          'The uniquity sentence must begin with the same universal quantifier as the existential sentence!',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The exitential quantifier of the existence sentence must have no condition!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'After the universal quantifiers, the existence sentence must have an existential quantifier!',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TExistUnique.GetFunction(Operation : String; var nr : Integer) : String;
  var
    i, p, Gp, Np : Integer;
    OK : Boolean;
    St, Cond : String;
begin
  i := 1;
  OK := True;
  nr := 0;
  while OK and (i <= LenE) do begin
    if Exist[i] = Suni then begin
      i := ExistSentence.FirstPosAfter(i + 1);
      Inc(nr);
    end else begin
      OK := False;
    end;//if
  end;//while
  p := i + 2;
  St := '(' + Operation + ')' + Sterm + IntToStr(nr);
  Cond := '';
  while p <= LenE do begin
    if Exist[p] = Spoi then begin
      Gp := ExistSentence.GetQuantifier(p);
      if                Gp < i then begin
        Inc(p);
        Np := ExistSentence.GetNumber(p);
        Cond := Cond + Spoi + IntToStr(Np - 1);
      end else begin if Gp = i then begin
        Cond := Cond + St + MakeLinks(p);
        Inc(p);
        Np := ExistSentence.GetNumber(p);
      end else begin // Gp > i
        Inc(p);
        Np := ExistSentence.GetNumber(p);
        Cond := Cond + Spoi + IntToStr(Np);
      end end;//if
    end else begin
      Cond := Cond + Exist[p];
      Inc(p);
    end;//if
  end;//while
  Result := Copy(Exist, 1, i - 1) + Cond;
end;

end.
