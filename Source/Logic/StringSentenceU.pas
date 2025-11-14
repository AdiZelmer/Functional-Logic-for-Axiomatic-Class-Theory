unit StringSentenceU;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Buttons, Vcl.ExtCtrls, System.StrUtils,
  Vcl.StdCtrls, Vcl.ComCtrls, CommonDefs, System.Math;

type
  TPref = record
    QNumber : Integer;       // numarul de cuanntificatori
    QPos : Integer;          // al catelea cuantificator e k
    SecArgOfLast : Integer;  // al doilea argument al ultimului cuantificator
  end;

  TStringSentence = class(TObject)
  private
    Sentence : String;
    Len : Integer;
    function GetNumberStay(i : Integer) : Integer;
    function JumpBackOverNumber(i : Integer) : Integer;
    function FindBackPar(i : Integer) : Integer;
    function NextOperation(i : Integer) : Integer;
    function PriorOperation(i : Integer) : Integer;
    function LastQuantifierFromPrefix : Integer;

    function FirstFormulaAncestor(i : Integer) : Integer;
    function AllAncestorsAreForm(i : Integer) : Boolean;

    function ExternalLinksPointsToPrefix(i : Integer) : Boolean;
    function ExternalPointedQuantifiersAreAncestors(i, j : Integer) : Boolean;

    function AdaptExpressionToPos(i, p, Dif : Integer) : String;

    function UsesQualifier(i, k : Integer) : Boolean;
    function IsOperation(i : Integer) : Boolean;
    function GetQuantifierType(var Universal, Cond : Boolean) : Boolean;

    function NoQuantifierAncestor(i, j : Integer) : Boolean;

    function ModifyLinks(i, Number : Integer) : String;
    function ModifyQuantCond(i, Number : Integer) : String;

    function KernelQuantifierParticularization(i, j : Integer) : String;
    function QuantifierParticularization(i, j : Integer) : String;
    function KernelExpressionParticularization(i, j : Integer) : String;
    function ExpressionParticularization(i, j : Integer) : String;

    function InPrefix(i : Integer) : Boolean;
    function PartNotChanged(var p : String; St : String) : Boolean;
    function SameCondition(i, j : Integer) : Boolean;
    function SamePartialCondition(i, j : Integer) : Boolean;
    function SameExpression(i, j : Integer) : Boolean;
    function SatisfyCondition(Qi, i, j : Integer) : Boolean;
    function RecCondition(Qi, i, j : Integer) : Boolean;
    function IsContained(i, j : Integer) : Boolean;

    function VerifyParentForCondition(i, j, p : Integer) : Boolean;

    function Duplicable(i, j : Integer; Source, Destination : String) : Boolean;

    // pentru formule
    function SatisfyParams(I1, I2 : String) : Boolean;
    function FormPosAfter(Formula : String; i : Integer) : Integer;
    function TrueValue(Formula : String; i : Integer; p, q, r, s : Boolean) : Boolean;
    function Syntax(Formula : String; i, f : Integer) : Boolean;
    function VarIsUsedIn(Formula : String; i : Integer; Ch : Char) : Boolean;
    function VarAreLeft(Formula : String) : Boolean;

    // pentru baza de date
    procedure WriteDetail(
      Sent, Detail : Integer;
      Operation : String;
      Link : Integer
    );

    // pentru reprezentarea ca tree
    function MakeNode(Tree : TTreeView; Node : TTreeNode; Text : String) : TTreeNode;

    function FindPlus(i : Integer; St : String) : Integer;
    procedure MakePlus(i : Integer; var St : String);
    function BlankString(i : Integer) : String;
  public
    procedure SetSentence(Str : String);
    function GetSentence : String;
    function GetLength : Integer;
    function JumpOverNumber(i : Integer) : Integer;
    function GetNumber(var i : Integer) : Integer;
    function FirstPosAfter(i : Integer) : Integer;
    function Parent(i : Integer) : Integer;
    function Ancestor(i, j : Integer) : Boolean;
    function FirstCommonAncestor(i, j : Integer) : Integer;
    function ConjAncestor(i, j : Integer) : Boolean;
    function Prefix(All : Boolean; k : Integer) : TPref;
    function GetQuantifier(i : Integer) : Integer;
    procedure PutSentence(Grid : TStringGrid; ACol, ARow : Integer);

    function ConvertSentence(i : Integer) : String;
    procedure ScaleSentence(Quanti : TStringList; i : Integer; Dep : String; var Res : String);
    function MakeSentenceAsUsual(Quanti : TStringList; i : Integer) : String;
    procedure TreeSentence(Sent, i : Integer; Quanti : TStringList; Tree : TTreeView; Node : TTreeNode);
    procedure SentenceAsStringList(Sent : Integer; StringList : TStringList);
    function SentenceAsUsual(Sent : Integer) : String;
    procedure MakeTreeSentence(Sent : Integer; Tree : TTreeView);

    function PosGridToString(ACol : Integer) : Integer;
    function MoveXAfterQuantifier(i : Integer) : String;  // nu e folosita
    function IsTerm(i : Integer) : Boolean;
    function IsForm(i : Integer) : Boolean;
    function CanBeImplied(i : Integer) : Boolean;
    function QuantifierParentsNumber(p, i : Integer) : Integer;
    function QuantifierNumber(i : Integer) : Integer;
    function NumberOfQuantifiers : Integer;

    function QuantifierDistrib(i : Integer) : String;
    function RestrictedQuantifierDistrib(i : Integer) : String;
    function PartialQuantifierDistrib(i : Integer) : String;
    function DualQuantifierDistrib(i : Integer) : String;

    function KernelParticularization(i, j : Integer) : String;
    function Particularization(i, j : Integer) : String;

    {
      KernelParticularization
        KernelQuantifierParticularization
        KernelExpressionParticularization

      Particularization
        QuantifierParticularization
          KernelQuantifierParticularization
        ExpressionParticularization
          KernelExpressionParticularization

      ClassGeneratorToForm
        KernelParticularization
    }

    function Replacement(i, j : Integer) : String;
    function DuplicationAnd(i, j : Integer) : String;
    function DuplicationImp(i, j : Integer) : String;
    function Attachment(i, j : Integer) : String;

    function Commutativity(i : Integer) : String;
    function Reflexivity(i : Integer) : String;

    function ApplyFormula(Formula : String; i : Integer) : String;
    function VerifySentenceAndApplyFormula(Formula : String; i : Integer) : String;

    function Tautology(Formula : String) : Boolean;
    function VerifyFormula(Formula : String) : Boolean;
    procedure SeparArguments(Formula : String; var Arg1, Arg2 : String);

    function DecodeBelonging(i : Integer) : String;
    function EncodeBelonging(i : Integer) : String;
    function ClassGeneratorExplanation(i : Integer) : String;
    function ClassGeneratorToForm(i : Integer) : String;
    function FormToClassGenerator(i : Integer) : String;

    function CanDeleteQuantifier(i : Integer) : String;
    function DeleteQuantifier(i : Integer) : String;

    function InterchangeQuantifiers(i : Integer) : String;

    function Generalization(i, j : Integer; Quant : Char) : String;

    procedure SetSentenceFromDatabase(Sentence : Integer);
    // Incarca o sentinta din baza de date (Details) in StringSentence.
    procedure SetSentenceToDatabase(Sent : Integer);
    // Sentence trebuie incarcata. Scrie in Details.
    procedure SetSentenceToStep(Sent, Step : Integer);
    // Sentence trebuie incarcata.
    // Scrie in StepDetails
    function InsertSentences(Sentence1, Sentence2 : String; i : Integer) : String;
    function ModusPonens(Sentence1, Sentence2 : String) : String;
    function ExtractCondition(i : Integer) : String;
    function InsertCondition(i : Integer) : String;
    function Negation(i : Integer) : String;
    function MoveRightNotOverQuant(i : Integer) : String;
    function IsAContradiction : Boolean;

    function ExtractHypothesis : String;
    function ExtractConclusion : String;

    function PrepareDeleteQuantifier(i : Integer) : String;
    function MakeExistenceAsDImplication : String;

    function StringToUser(i : Integer) : Integer;
  end;

implementation

uses
  Haupt, Save, QuantifierType;

procedure TStringSentence.SetSentence(Str : String);
begin
  Sentence := Str;
  Len := Length(Str);
end;

function TStringSentence.GetSentence : String;
begin
  Result := Self.Sentence;
end;

function TStringSentence.GetLength : Integer;
begin
  Result := Len;
end;

function TStringSentence.JumpOverNumber(i : Integer) : Integer;
// i numai pe numere, poate da Len + 1.
begin
  Result := i;
  while (Result <= Len) and (Sentence[Result] >= '0') and (Sentence[Result] <= '9') do begin
    Inc(Result);
  end;
end;

function TStringSentence.JumpBackOverNumber(i : Integer) : Integer;
// i trebuie sa fie pe un numar
begin
  Result := i;
  while (Result >= 0) and (Sentence[Result] >= '0') and (Sentence[Result] <= '9') do begin
    Dec(Result);
  end;
end;

function TStringSentence.GetNumber(var i : Integer) : Integer;
// i trebuie sa fie pe un numar, i se pune la sfirsit, poate ajunge Len + 1.
  var
    nr : Integer;
    St : String;
begin
  Result := 0;
  nr := JumpOverNumber(i);
  St := Copy(Sentence, i, nr - i);
  i := nr;
  Result := StrToInt(St);
end;

function TStringSentence.GetNumberStay(i : Integer) : Integer;
// i trebuie sa fie pe un numar
  var
    nr : Integer;
    St : String;
begin
  Result := 0;
  nr := JumpOverNumber(i);
  St := Copy(Sentence, i, nr - i);
  Result := StrToInt(St);
end;

function TStringSentence.FirstPosAfter(i : Integer) : Integer;
// Rezultatul poate fi Len + 1.
  var
    Ch : Char;
    Number, nr : Integer;
begin
  Result := 0;
  Ch := Sentence[i];
  if Ch in [Suni, Sexi, Sorx, Sand, Sdou, Simp, Sapa, Seqa] then begin
    Result := FirstPosAfter(i + 1);
    Result := FirstPosAfter(Result);
  end else begin if Ch in [Snot, Sgen, Sset] then begin
    Result := FirstPosAfter(i + 1);
  end else begin if Ch = Stru then begin
    Result := i + 1;
  end else begin if Ch = Spoi then begin
    Result := JumpOverNumber(i + 1);
  end else begin  // Ch = '('
    Result := PosEx(')', Sentence, i + 1) + 2;
    Number := GetNumber(Result);
    for nr := 1 to Number do begin
      Result := FirstPosAfter(Result);
    end;//for
  end end end end;//if
end;

function TStringSentence.NextOperation(i : Integer) : Integer;
// i trebuie sa fie pe o operatie, poate da Len + 1.
// merge de la stinga la dreapta si nu parinte copil.
  var
    Ch : Char;
begin
  Ch := Sentence[i];
  if Ch = '(' then begin
    i := PosEx(')', Sentence, i + 1) + 2;
    Result := JumpOverNumber(i);
  end else begin if Ch = Spoi then begin
    Result := JumpOverNumber(i + 1);
  end else begin
    Result := i + 1;
  end end;//if
end;

function TStringSentence.PosGridToString(ACol : Integer) : Integer;
// ACol trebuie sa fie in grid, poate da Len + 1
  var
    nr : Integer;
begin
  Result := 1;
  nr := 1;
  while nr <= ACol do begin
    Result := NextOperation(Result);
    Inc(nr);
  end;//while
end;

function TStringSentence.StringToUser(i : Integer) : Integer;
// 1 <= i <= Len
  var
    j : Integer;
    found : Boolean;
begin
  Result := 1;
  found := False;
  j := NextOperation(1);
  while (not found) and (j <= Len + 1) do begin
    if i < j then begin
      found := True;
    end else begin
      Inc(Result);
      j := NextOperation(j);
    end;//if
  end;//while
end;

function TStringSentence.FindBackPar(i : Integer) : Integer;
// Se aplica numai pe ')'
begin
  Result := 0;
  while (i >= 1) and (Result = 0) do begin
    if Sentence[i] = '(' then begin
      Result := i;
    end else begin
      Dec(i);
    end;//if
  end;//while
end;

function TStringSentence.PriorOperation(i : Integer) : Integer;
// i trebuie sa fie pe o operatie, poate da 0.
  var
    Ch : Char;
begin
  Result := 0;
  Dec(i);
  if i > 0 then begin
    Ch := Sentence[i];
    if (Ch >= '0') and (Ch <= '9') then begin
      i := JumpBackOverNumber(i);
      Ch := Sentence[i];
      if Ch = Spoi then begin
        Result := i;
      end else begin if Ch in [Ssent, Sterm] then begin
        Result := FindBackPar(i - 1);
      end end;//if
    end else begin
      Result := i;
    end;//if
  end;//if
end;

function TStringSentence.Parent(i : Integer) : Integer;
// i pe o operatie, poate da 0.
  var
    found : Boolean;
begin
  Result := PriorOperation(i);
  found := False;
  while (not found) and (Result > 0) do begin
    if i < FirstPosAfter(Result) then begin
      found := True;
    end else begin
      Result := PriorOperation(Result);
    end;//if
  end;//while
end;

function TStringSentence.Ancestor(i, j : Integer) : Boolean;
// i, j form
// True daca i e un stramos al lui j.
  var
    k : Integer;
begin
  Result := False;
  k := Parent(j);
  while (not Result) and (i <= k) do begin
    if i = k then begin
      Result := True;
    end else begin
      k := Parent(k);
    end;
  end;//while
end;

function TStringSentence.FirstCommonAncestor(i, j : Integer) : Integer;
// Rezultatul e primul stramos comun. O daca nu au stramosi comuni.
  var
    k : Integer;
begin
  Result := 0;
  k := Parent(i);
  while (Result = 0) and (k > 0) do begin
    if Ancestor(k, j) then begin
      Result := k;
    end else begin
      k := Parent(k);
    end;//if
  end;//while
end;

function TStringSentence.ConjAncestor(i, j : Integer) : Boolean;
// i, j form
// True daca toti stramosii lui j pina la i inclusiv sunt conjunctii.
  var
    k : Integer;
begin
  Result := False;
  k := Parent(j);
  while (not Result) and (i <= k) do begin
    if Sentence[k] = Sand then begin
      if i = k then begin
        Result := True;
      end else begin
        k := Parent(k);
      end;
    end else begin
      k := i - 1;
    end;
  end;//while
end;

function TStringSentence.IsTerm(i : Integer) : Boolean;
begin
  Result := False;
  if Sentence[i] in [Spoi, Sgen] then begin
    Result := True;
  end else begin if Sentence[i] = '(' then begin
    if Sentence[PosEx(')', Sentence, i + 1) + 1] = Sterm then begin
      Result := True;
    end;//if
  end end;//if
end;

function TStringSentence.IsForm(i : Integer) : Boolean;
begin
  Result := False;
  if Sentence[i] in (Operators + PredRelatins) then begin
    Result := True;
  end else begin if Sentence[i] = '(' then begin
    if Sentence[PosEx(')', Sentence, i + 1) + 1] = Ssent then begin
      Result := True;
    end;//if
  end end;//if
end;

function TStringSentence.FirstFormulaAncestor(i : Integer) : Integer;
  var
    j : Integer;
begin
  Result := 0;
  j := Parent(i);
  while (Result = 0) and (j > 0) do begin
    if IsForm(j) then begin
      Result := j;
    end else begin
      j := Parent(j);
    end;//if
  end;//while
end;

function TStringSentence.AllAncestorsAreForm(i : Integer) : Boolean;
  var
    p : Integer;
begin
  Result := True;
  p := Parent(i);
  while Result and (p > 0) do begin
    if IsForm(p) then begin
      p := Parent(p);
    end else begin
      Result := False;
    end;//if
  end;//while
end;

function TStringSentence.GetQuantifier(i : Integer) : Integer;
// Se aplica numai la Spoi
  var
    Number, k : Integer;
begin
  k := i + 1;
  Number := GetNumber(k);
  k := 1;
  Result := i;
  while (Result > 0) and (k <= Number) do begin
    Result := Parent(Result);
    if Sentence[Result] in [Suni, Sexi, Sgen]  then begin
      Inc(k);
    end;//
  end;//while
end;

function TStringSentence.InPrefix(i : Integer) : Boolean;
// i trebuie sa fie pe un cuantificator
  var
    j : Integer;
    OK : Boolean;
begin
  Result := False;
  OK := True;
  j := 1;
  while OK and (not Result) and (j <= i) do begin
    if Sentence[j] in [Suni, Sexi] then begin
      if j = i then begin
        Result := True;
      end else begin
        j := FirstPosAfter(j + 1);
      end;//if
    end else begin
      OK := False;
    end;
  end;//while
end;

function TStringSentence.ExternalLinksPointsToPrefix(i : Integer) : Boolean;
// i trebuie sa fie pe un Sgen.
  var
    n, p, Gp : Integer;
begin
  Result := True;
  n := FirstPosAfter(i);
  p := i + 1;
  while Result and (p < n) do begin
    if Sentence[p] = Spoi then begin
      Gp := GetQuantifier(p);
      if Gp < i then begin  // extern
        if InPrefix(Gp) then begin
          p := FirstPosAfter(p);
        end else begin
          Result := False;
        end;//if
      end else begin        // intern
        p := FirstPosAfter(p);
      end;//if
    end else begin
      Inc(p);
    end;//if
  end;//while
end;

function TStringSentence.ExternalPointedQuantifiersAreAncestors(i, j : Integer) : Boolean;
// Linkurile externe din zona lui i sunt la cuantificatori care sunt stramosi ai lui j
  var
    n, p, Gp : Integer;
begin
  Result := True;
  n := FirstPosAfter(i);
  p := i;
  while Result and (p < n) do begin
    if Sentence[p] = Spoi then begin
      Gp := GetQuantifier(p);
      if Gp < i then begin  // extern
        if Ancestor(Gp, j) then begin
          p := FirstPosAfter(p);
        end else begin
          Result := False;
        end;//if
      end else begin        // intern
        p := FirstPosAfter(p);
      end;//if
    end else begin
      Inc(p);
    end;//if
  end;//while
end;

function TStringSentence.QuantifierParentsNumber(p, i : Integer) : Integer;
// i trebuie sa fie pe o operatie
// cati quantificatori Suni, Sexi, Sgen sunt de la i pina la p
  var
    j : Integer;
begin
  Result := 0;
  j := Parent(i);
  while j >= p do begin
    if Sentence[j] in [Suni, Sexi, Sgen] then begin
      Inc(Result);
    end;//if
    j := Parent(j);
  end;//while
end;

function TStringSentence.QuantifierNumber(i : Integer) : Integer;
// i trebuie sa fie pe un cuantificator
// rezultatul e al catelea cuantificator e i
  var
    j : Integer;
begin
  Result := 0;
  j := 1;
  while j <= i do begin
    if Sentence[j] in [Suni, Sexi, Sgen] then begin
      Inc(Result);
      Inc(j);
    end else begin if Sentence[j] = '(' then begin
      j := PosEx(')', Sentence, j + 1) + 2;
      j := JumpOverNumber(j);
    end else begin
      Inc(j);
    end end;//if
  end;//while
end;

function TStringSentence.NumberOfQuantifiers : Integer;
// da numarul total de cuantificatori
  var
    i : Integer;
begin
  Result := 0;
  i := 1;
  while i <= Len do begin
    if Sentence[i] in [Suni, Sexi, Sgen] then begin
      Inc(Result);
    end;
    i := NextOperation(i);
  end;//while
end;

function TStringSentence.AdaptExpressionToPos(i, p, Dif : Integer) : String;
// i e pe form sau term
  var
    q, n, Gq : Integer;
begin
  Result := '';
  n := FirstPosAfter(i);
  q := i;
  while q < n do begin
    if Sentence[q] = Spoi then begin
      Gq := GetQuantifier(q);
      if Gq < i then begin  // extern
        Result :=
          Result + Spoi +
          IntToStr(QuantifierParentsNumber(Gq, p) + QuantifierParentsNumber(i, q) + Dif)
        ;
        q := FirstPosAfter(q);
      end else begin        // intern
        Inc(q);
        Result := Result + Spoi + IntToStr(GetNumber(q));
      end;//if
    end else begin
      Result := Result + Sentence[q];
      Inc(q);
    end;//if
  end;//while
end;

function TStringSentence.UsesQualifier(i, k : Integer) : Boolean;
// Verifica daca in zona data de i exista linkuri la cuantificatorul k.
  var
    j, nr : Integer;
begin
  Result := False;
  nr := FirstPosAfter(i);
  j := i;
  while (not Result) and (j < nr) do begin
    if Sentence[j] = Spoi then begin
      if k = GetQuantifier(j) then begin
        Result := True;
      end else begin
        j := JumpOverNumber(j + 1);
      end;//if
    end else begin
      Inc(j);
    end;//if
  end;//while
end;

function TStringSentence.ModifyLinks(i, Number : Integer) : String;
  var
    j, k : Integer;
begin
  Result := '';
  k := FirstPosAfter(i);
  j := i;
  while j < k do begin
    if Sentence[j] = Spoi then begin
      if GetQuantifier(j) < i then begin  // extern
        Inc(j);
        Result := Result + Spoi + IntToStr(GetNumber(j) + Number);
      end else begin                      // intern
        Inc(j);
        Result := Result + Spoi + IntToStr(GetNumber(j));
      end;//if
    end else begin
      Result := Result + Sentence[j];
      Inc(j);
    end;//if
  end;//while
end;

function TStringSentence.ModifyQuantCond(i, Number : Integer) : String;
// i e pe un cuantificator
  var
    j, k : Integer;
begin
  Result := '';
  k := FirstPosAfter(i + 1);
  j := i;
  while j < k do begin
    if Sentence[j] = Spoi then begin
      if GetQuantifier(j) < i then begin  // extern
        Inc(j);
        Result := Result + Spoi + IntToStr(GetNumber(j) + Number);
      end else begin                      // intern
        Inc(j);
        Result := Result + Spoi + IntToStr(GetNumber(j));
      end;//if
    end else begin
      Result := Result + Sentence[j];
      Inc(j);
    end;//if
  end;//while
end;

procedure TStringSentence.PutSentence(Grid : TStringGrid; ACol, ARow : Integer);
// Pune continutul in Grid.
  var
    i : Integer;
    Ch : Char;
    Number : Integer;
    p, k : Integer;
begin
  i := 1;
  while i <= Len do begin
    Ch := Sentence[i];
    if Ch in [Suni, Sexi, Sgen] then begin
      Grid.Cells[ACol, ARow] := Ch;
      ACol := ACol + 1;
      ARow := ARow + 1;
      Inc(i);
    end else begin if Ch = Spoi then begin
      Inc(i);
      Number := GetNumber(i);
      Grid.Cells[ACol, ARow] := Spoi + Sterm + IntToStr(Number);
      Grid.Cells[ACol, ARow - Number] := Slnk;
      Inc(ACol);
    end else begin if Ch = '(' then begin
      p := PosEx(')', Sentence, i + 1);
      Grid.Cells[ACol, ARow] :=
        Copy(Sentence, i + 1, p - i - 1) +
        Sentence[p + 1]
      ;
      for k := 1 to p - i - 2 do begin
        Grid.Cells[ACol, ARow + k] := Sentence[i + k + 1];
      end;//for
      i := JumpOverNumber(p + 2);
      Grid.Cells[ACol, ARow] :=
        Grid.Cells[ACol, ARow] +
        Copy(Sentence, p + 2, i - p - 2)
      ;
      Inc(ACol);
    end else begin
      Grid.Cells[ACol, ARow] := Ch;
      Inc(ACol);
      Inc(i);
    end end end;//if
  end;//while
end;

function TStringSentence.ConvertSentence(i : Integer) : String;
  var
    p, q : Integer;
    Ch : Char;
    Number, Gp, r : Integer;
    Level : Integer;
begin
  Result := '';
  p := i;
  q := FirstPosAfter(i);
  while p < q do begin
    Ch := Sentence[p];
    if                Ch in [Suni, Sexi] then begin
      Level := QuantifierParentsNumber(1, p) + 1;
      Inc(p);
      if Sentence[p] = Stru then begin
        Result := Result + ' (' + Ch + IntToStr(Level) + ')';
        Inc(p);
      end else begin
        Result := Result + ' (' + Ch + IntToStr(Level) + ConvertSentence(p) + ')';
        p := FirstPosAfter(p);
      end;//if
    end else begin if Ch = Sgen then begin
      Level := QuantifierParentsNumber(1, p) + 1;
      Inc(p);
      Result := Result + ' {' + Ch + IntToStr(Level) + ConvertSentence(p) + '}';
      p := FirstPosAfter(p);
    end else begin if Ch = Spoi then begin
      Gp := GetQuantifier(p);
      Level := QuantifierParentsNumber(1, Gp) + 1;
      Result := Result + ' ' + IntToStr(Level);
      p := FirstPosAfter(p);
    end else begin if Ch = '(' then begin
      r := PosEx(')', Sentence, p + 1);
      Result := Result + ' [' + Copy(Sentence, p + 1, r - p - 1) + ']';
      p := JumpOverNumber(r + 2);
    end else begin
      Result := Result + ' ' + Ch;
      Inc(p);
    end end end end;//if
  end;//while
end;

function TStringSentence.FindPlus(i : Integer; St : String) : Integer;
  var
    j, p : Integer;
begin
  Result := 1;
  j := 1;
  p := 1;
  while (j <= i) and (Result > 0) do begin
    Result := PosEx(Smin, St, p);
    Inc(j);
    p := Result + 1;
  end;//while
end;

procedure TStringSentence.MakePlus(i : Integer; var St : String);
  var
    p : Integer;
begin
  p := FindPlus(i, St);
  if p > 0 then begin
    St[p] := Slnk;
  end;//if
end;

procedure TStringSentence.ScaleSentence(Quanti : TStringList; i : Integer; Dep : String; var Res : String);
  const
    DifM = Smin;
    DifL = ' ';
    CL = #13#10;
  var
    p, q : Integer;
    Ch : Char;
    Number, Gp : Integer;
    Level : Integer;
    DepPlus : String;
begin
  Ch := Sentence[i];
  if                Ch in [Suni, Sexi] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    Level := QuantifierParentsNumber(1, i) + 1;
    if Quanti.Values[IntToStr(QuantifierNumber(i))] <> ''  then begin
      Res := Res + CL + Dep + Ch + Spoi + Quanti.Values[IntToStr(QuantifierNumber(i))];
    end else begin
      Res := Res + CL + Dep + Ch;
    end;//if
    Dep := Dep + DifM;
    ScaleSentence(Quanti, p, Dep, Res);
    ScaleSentence(Quanti, q, Dep, Res);
  end else begin if Ch = Sgen then begin
    p := i + 1;
    Level := QuantifierParentsNumber(1, i) + 1;
    if Quanti.Values[IntToStr(QuantifierNumber(i))] <> ''  then begin
      Res := Res + CL + Dep + Ch + Spoi + Quanti.Values[IntToStr(QuantifierNumber(i))];
    end else begin
      Res := Res + CL + Dep + Ch;
    end;//if
    Dep := Dep + DifM;
    ScaleSentence(Quanti, p, Dep, Res);
  end else begin if Ch = Spoi then begin
    Gp := GetQuantifier(i);
    Level := QuantifierParentsNumber(1, Gp) + 1;
    DepPlus := Dep;
    MakePlus(Level, DepPlus);
    if Quanti.Values[IntToStr(QuantifierNumber(Gp))] <> ''  then begin
      Res := Res + CL + DepPlus + Spoi + Quanti.Values[IntToStr(QuantifierNumber(Gp))];
    end else begin
      Res := Res + CL + DepPlus + Spoi;
    end;//if
  end else begin if Ch in [Sand, Sorx, Sdou, Simp, Sapa, Seqa] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    Res := Res + CL + Dep + Ch;
    Dep := Dep + DifL;
    ScaleSentence(Quanti, p, Dep, Res);
    ScaleSentence(Quanti, q, Dep, Res);
  end else begin if Ch in [Snot, Sset] then begin
    p := i + 1;
    Res := Res + CL + Dep + Ch;
    Dep := Dep + DifL;
    ScaleSentence(Quanti, p, Dep, Res);
  end else begin if Ch = Stru then begin
    Res := Res + CL + Dep + Ch;
  end else begin if Ch = '(' then begin
    p := PosEx(')', Sentence, i + 1);
    Res := Res + CL + Dep + Copy(Sentence, i + 1, p - i - 1);
    Dep := Dep + DifL;
    p := p + 2;
    Number := GetNumber(p);
    for i := 1 to Number do begin
      ScaleSentence(Quanti, p, Dep, Res);
      p := FirstPosAfter(p);
    end;//for
  end end end end end end end;//if
end;

function TStringSentence.MakeSentenceAsUsual(Quanti : TStringList; i : Integer) : String;
  var
    p, q : Integer;
    Ch : Char;
    Number, Gp : Integer;
begin
  Result := '';
  Ch := Sentence[i];
  if                Ch in [Suni, Sexi] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    Result := Ch + '(' + Quanti.Values[IntToStr(QuantifierNumber(i))];
    if Sentence[p] = Stru then begin
      Result := Result + ') ' + MakeSentenceAsUsual(Quanti, q);
    end else begin
      Result := Result + '|' + MakeSentenceAsUsual(Quanti, p) + ') ' + MakeSentenceAsUsual(Quanti, q);
    end;//if
  end else begin if Ch = Sgen then begin
    p := i + 1;
    Result := '{' + Quanti.Values[IntToStr(QuantifierNumber(i))] + '|' + MakeSentenceAsUsual(Quanti, p) + '}';
  end else begin if Ch = Spoi then begin
    Gp := GetQuantifier(i);
    Result := Quanti.Values[IntToStr(QuantifierNumber(Gp))];
  end else begin if Ch in [Sand, Sorx, Sdou, Simp, Sapa, Seqa] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    Result := Ch + '(' + MakeSentenceAsUsual(Quanti, p) + ',' + MakeSentenceAsUsual(Quanti, q) + ')';
  end else begin if Ch in [Snot, Sset] then begin
    p := i + 1;
    Result := Ch + '(' + MakeSentenceAsUsual(Quanti, p) + ')';
  end else begin if Ch = Stru then begin
    Result := Ch;
  end else begin if Ch = '(' then begin
    p := PosEx(')', Sentence, i + 1);
    Result := Copy(Sentence, i + 1, p - i - 1);
    p := p + 2;
    Number := GetNumber(p);
    if Number > 0 then begin
      Result := Result + '(';
      for i := 1 to Number do begin
        Result := Result + MakeSentenceAsUsual(Quanti, p) + ',';
        p := FirstPosAfter(p);
      end;//for
      Result := Copy(Result, 1, Length(Result) - 1) + ')';
    end;//if
  end end end end end end end;//if
end;

function TStringSentence.BlankString(i : Integer) : String;
  var
    j : Integer;
begin
  Result := '';
  for j := 1 to i do begin
    Result := Result + ' ';
  end;//for
end;

procedure TStringSentence.SentenceAsStringList(Sent : Integer; StringList : TStringList);
  var
    Dep, Res : String;
    Index, mr, nr : Integer;
    i: Integer;
    St : String;
    Quanti, Puffer : TStringList;
begin
  Dep := '';
  Res := '';
  Quanti := TStringList.Create;
  try
    if Sent > 0 then begin
      HauptF.GetQuantifierNames(Sent, Quanti);
    end else begin
      Quanti.Clear;
    end;
    ScaleSentence(Quanti, 1, Dep, Res);
    StringList.Text := Copy(Res, 3, Length(Res) - 2);
    mr := 0;
    for Index := 0 to StringList.Count - 1 do begin
      mr := Max(mr, Length(StringList[Index]));
    end;//for
    Puffer := TStringList.Create;
    try
      for Index := 0 to StringList.Count - 1 do begin
        nr := Length(StringList[Index]);
        Puffer.Add(StringList[Index] + BlankString(mr - nr));
      end;//for
      StringList.Clear;
      for i := 1 to mr do begin
        St := '';
        for Index := 0 to Puffer.Count - 1 do begin
          St := St + ' ' + Puffer[Index][i];
        end;//for
        StringList.Add(St);
      end;//for
    finally
      Puffer.Free;
    end;//try
  finally
    Quanti.Free;
  end;
end;

function TStringSentence.SentenceAsUsual(Sent : Integer) : String;
  var
    Quanti : TStringList;
begin
  Result := '';
  Quanti := TStringList.Create;
  try
    if Sent > 0 then begin
      HauptF.GetQuantifierNames(Sent, Quanti);
      if Quanti.Count = NumberOfQuantifiers then begin
        Result := MakeSentenceAsUsual(Quanti, 1);
      end;//if
    end else begin
      Quanti.Clear;
    end;
  finally
    Quanti.Free;
  end;
end;

procedure TStringSentence.TreeSentence(
  Sent, i : Integer; Quanti : TStringList; Tree : TTreeView; Node : TTreeNode
);
  var
    p, q : Integer;
    Ch : Char;
    Number, Gp : Integer;
    Level : Integer;
    NewNode : TTreeNode;
begin
  Ch := Sentence[i];
  if                Ch in [Suni, Sexi] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    Level := QuantifierParentsNumber(1, i) + 1;
    if Quanti.Values[IntToStr(QuantifierNumber(i))] <> ''  then begin
      NewNode := MakeNode(Tree, Node, Ch + '(' + Quanti.Values[IntToStr(QuantifierNumber(i))] + ')');
    end else begin
      NewNode := MakeNode(Tree, Node, Ch + '(' + IntToStr(Level) + ')');
    end;//if
    TreeSentence(Sent, p, Quanti, Tree, NewNode);
    TreeSentence(Sent, q, Quanti, Tree, NewNode);
  end else begin if Ch = Sgen then begin
    p := i + 1;
    Level := QuantifierParentsNumber(1, i) + 1;
    if Quanti.Values[IntToStr(QuantifierNumber(i))] <> ''  then begin
      NewNode := MakeNode(Tree, Node, Ch + '(' + Quanti.Values[IntToStr(QuantifierNumber(i))] + ')');
    end else begin
      NewNode := MakeNode(Tree, Node, Ch + '(' + IntToStr(Level) + ')');
    end;//if
    TreeSentence(Sent, p, Quanti, Tree, NewNode);
  end else begin if Ch = Spoi then begin
    Gp := GetQuantifier(i);
    Level := QuantifierParentsNumber(1, Gp) + 1;
    if Quanti.Values[IntToStr(QuantifierNumber(Gp))] <> ''  then begin
      NewNode := MakeNode(Tree, Node, '(' + Quanti.Values[IntToStr(QuantifierNumber(Gp))] + ')');
    end else begin
      NewNode := MakeNode(Tree, Node, '(' + IntToStr(Level) + ')');
    end;//if
  end else begin if Ch in [Sand, Sorx, Sdou, Simp, Sapa, Seqa] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    NewNode := MakeNode(Tree, Node, Ch);
    TreeSentence(Sent, p, Quanti, Tree, NewNode);
    TreeSentence(Sent, q, Quanti, Tree, NewNode);
  end else begin if Ch in [Snot, Sset] then begin
    p := i + 1;
    NewNode := MakeNode(Tree, Node, Ch);
    TreeSentence(Sent, p, Quanti, Tree, NewNode);
  end else begin if Ch = Stru then begin
    MakeNode(Tree, Node, Ch);
  end else begin if Ch = '(' then begin
    p := PosEx(')', Sentence, i + 1);
    NewNode := MakeNode(Tree, Node, Copy(Sentence, i + 1, p - i - 1));
    p := p + 2;
    Number := GetNumber(p);
    for i := 1 to Number do begin
      TreeSentence(Sent, p, Quanti, Tree, NewNode);
      p := FirstPosAfter(p);
    end;//for
  end end end end end end end;//if
end;

procedure TStringSentence.MakeTreeSentence(Sent : Integer; Tree : TTreeView);
  var
    Quanti : TStringList;
begin
  Quanti := TStringList.Create;
  try
    if Sent > 0 then begin
      HauptF.GetQuantifierNames(Sent, Quanti);
    end else begin
      Quanti.Clear;
    end;
    TreeSentence(Sent, 1, Quanti, Tree, Nil);
  finally
    Quanti.Free;
  end;//try
end;

function TStringSentence.Prefix(All : Boolean; k : Integer) : TPref;
// Daca All e True, atunci considera toti cuantificatorii. Daca nu, doar Suni.
// k trebuie sa fie pe un cuantificator.
// QNumber e numarul de cuanntificatori din Prefix.
// QPos e al catelea cuantificator e k in Prefix. E 0 daca k nu e in prefix.
// SecArgOfLast e al doilea argument al ultimului cuantificator
  var
    QSet : set of Char;
    i, q : Integer;
    OK : Boolean;
begin
  if All then begin
    QSet := [Suni, Sexi];
  end else begin
    QSet := [Suni];
  end;//if
  Result.QPos := 0;
  i := 1;
  q := 0;
  OK := True;
  while OK and (i <= Len) do begin
    if Sentence[i] in QSet then begin
      Inc(q);
      if i = k then begin
        Result.QPos := q;
      end;//if
      i := FirstPosAfter(i + 1);
    end else begin
      OK := False;
    end;//if
  end;//while
  Result.SecArgOfLast := i;
  Result.QNumber := q;
end;

function TStringSentence.LastQuantifierFromPrefix : Integer;
// Returneaza ultimul cuantificator din prefix.
  var
    i : Integer;
    OK : Boolean;
begin
  Result := 0;
  i := 1;
  OK := True;
  while OK and (i <= Len) do begin
    if Sentence[i] in [Suni, Sexi] then begin
      Result := i;
      i := FirstPosAfter(i + 1);
    end else begin
      OK := False;
    end;//if
  end;//while
end;

function TStringSentence.MakeExistenceAsDImplication : String;
// Ultimul cuantificator din prefix trebuie sa fie existential si fara conditie.
// Transforma cuantificatorul intr-o echivalenta cu T.
// Da rezultatul '' daca nu merge.
  var
    i : Integer;
begin
  Result := '';
  i := LastQuantifierFromPrefix;
  if i > 0 then begin
    if Sentence[i] = Sexi then begin
      if Sentence[i + 1] = Stru then begin
        Result :=
          Copy(Sentence, 1, i - 1) +
          Sdou +
          Copy(Sentence, i, Len - i + 1) +
          Stru
        ;
      end;//if
    end;//if
  end;//if
end;

function TStringSentence.PrepareDeleteQuantifier(i : Integer) : String;
// i arata cuantificatorul care trebuie sters.
// Acest cuantificator trebuie sa aibe conditie
  var
    p, q, r : Integer;
begin
  p := i + 1;
  q := FirstPosAfter(p);
  r := FirstPosAfter(q);
  Result := Copy(Sentence, 1, i - 1);
  if Sentence[i] = Suni then begin
    Result := Result + Simp;
  end else begin  // Sentence[i] = Sexi
    Result := Result + Sand;
  end;//if
  Result :=
    Result +
    Sexi + Stru +
    Copy(Sentence, p, q - p) +
    ModifyLinks(q, -1) +
    Copy(Sentence, r, Len - r + 1)
  ;
end;

function TStringSentence.CanBeImplied(i : Integer) : Boolean;
// i trebuie sa fie pe o formula
// verifica ca toti stramosii lui i sunt Suni, Sexi, Sand, Sorx, Simp
// verifica ca la Suni si Simp e folosit al doilea argument
  var
    j, r : Integer;
begin
  Result := True;
  if i > 1 then begin
    r := i;
    j := Parent(i);
    while Result and (j >= 1) do begin
      if                Sentence[j] in [Sexi, Sand, Sorx] then begin
        if j = 1 then begin
          j := 0;  // ca sa se opreasca
        end else begin
          r := j;
          j := Parent(j);
        end;//if
      end else begin if Sentence[j] in [Suni, Simp] then begin
        if j = r - 1 then begin  // e folosit primul argument al unui Suni sau Simp
          Result := False;
        end else begin
          if j = 1 then begin
            j := 0;  // ca sa se opreasca
          end else begin
            r := j;
            j := Parent(j);
          end;//if
        end;//if
      end else begin
        Result := False;
      end end;//if
    end;//while
  end;//if
end;

function TStringSentence.MoveXAfterQuantifier(i : Integer) : String;  // Nu e folosita
// Sententa trebuie sa inceapa cu un X urmat de cel putin un cuantificator
// i se afla pe unul dintre cuantificatorii de dupa X
// XQ..QQQ..QQ..Qpq --> Q..QQXQ..Qpq
//      |-------------------|
//      i                   noua pozitie a cuantificatorului. E urmat de X.
// E o aplicare repetata a lui PartialQuantifierDistrib.
// In cazul unui cuantificator universal cu conditie
// se pierde din informatie, fiindca argument al doilea al conjunctiei se introduce
// sub implicatia rezultata din conditia cuantificatorului.
  var
    j : Integer;
    found : Boolean;
begin
  Result := '';
  if Sentence[1] = Sand then begin
    j := 2;
    found := False;
    while (not found) and (j <= i) do begin
      if Sentence[j] in [Suni, Sexi] then begin
        if i = j then begin
          found := True;
        end else begin
          j := FirstPosAfter(j + 1);
        end;
      end else begin
        j := i + 1;
      end;//if
    end;//while
    if found then begin
      j := FirstPosAfter(i + 1);
      Result :=
        Copy(Sentence, 2, j - 2) +
        Sand +
        Copy(Sentence, j, Len - j + 1)
      ;
    end else begin
      MessageDlg(
        'Select a qantifier following the conjunction!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The first operator of the sentence must be a conjunction.',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.SameCondition(i, j : Integer) : Boolean;
// Compara conditiile a doi cuantificatori
  var
    m, n, p, q : Integer;
    Gp, Gq : Integer;
    Np, Nq : Integer;
begin
  Result := True;
  p := i + 1;
  q := j + 1;
  m := FirstPosAfter(p);
  n := FirstPosAfter(q);
  while Result and (p < m) do begin
    if q < n then begin
      if Sentence[p] = Spoi then begin
        if Sentence[q] = Spoi then begin
          Gp := GetQuantifier(p);
          Gq := GetQuantifier(q);
          Inc(p);
          Np := GetNumber(p);
          Inc(q);
          Nq := GetNumber(q);
          if                Gp < i then begin
            if Gp <> Gq then begin
              Result := False;
            end;//if
          end else begin // Gp >= i
            if Np <> Nq then begin
              Result := False;
            end;//if
          end;//if
        end else begin
          Result := False;
        end;//if
      end else begin
        if Sentence[p] = Sentence[q] then begin
          Inc(p);
          Inc(q);
        end else begin
          Result := False;
        end;//if
      end;//if
    end else begin
      Result := False;
    end;//if
  end;//while
end;

function TStringSentence.SamePartialCondition(i, j : Integer) : Boolean;
// Conditia celui de-al doilea cuantificator e o conjunctie
// Functia compara conditia primului cuantificator cu primul argument
// al conjunctiei conditiei celui de-al doilea cuantificator
  var
    m, n, p, q : Integer;
    Gp, Gq : Integer;
    Np, Nq : Integer;
begin
  Result := True;
  p := i + 1;
  q := j + 2;  // asta e toata diferenta fata de SameCondition!
  m := FirstPosAfter(p);
  n := FirstPosAfter(q);
  while Result and (p < m) do begin
    if q < n then begin
      if Sentence[p] = Spoi then begin
        if Sentence[q] = Spoi then begin
          Gp := GetQuantifier(p);
          Gq := GetQuantifier(q);
          Inc(p);
          Np := GetNumber(p);
          Inc(q);
          Nq := GetNumber(q);
          if                Gp < i then begin
            if Gp <> Gq then begin
              Result := False;
            end;//if
          end else begin // Gp >= i
            if Np <> Nq then begin
              Result := False;
            end;//if
          end;//if
        end else begin
          Result := False;
        end;//if
      end else begin
        if Sentence[p] = Sentence[q] then begin
          Inc(p);
          Inc(q);
        end else begin
          Result := False;
        end;//if
      end;//if
    end else begin
      Result := False;
    end;//if
  end;//while
end;

function TStringSentence.SameExpression(i, j : Integer) : Boolean;
// Compara doua expresii
  var
    m, n, p, q : Integer;
    Gp, Gq : Integer;
    Np, Nq : Integer;
begin
  Result := True;
  p := i;
  q := j;
  m := FirstPosAfter(p);
  n := FirstPosAfter(q);
  while Result and (p < m) do begin
    if q < n then begin
      if Sentence[p] = Spoi then begin
        if Sentence[q] = Spoi then begin
          Gp := GetQuantifier(p);
          Gq := GetQuantifier(q);
          Inc(p);
          Np := GetNumber(p);
          Inc(q);
          Nq := GetNumber(q);
          if                Gp < i then begin
            if Gp <> Gq then begin
              Result := False;
            end;//if
          end else begin // Gp >= i
            if Np <> Nq then begin
              Result := False;
            end;//if
          end;//if
        end else begin
          Result := False;
        end;//if
      end else begin
        if Sentence[p] = Sentence[q] then begin
          Inc(p);
          Inc(q);
        end else begin
          Result := False;
        end;//if
      end;//if
    end else begin
      Result := False;
    end;//if
  end;//while
end;

function TStringSentence.IsContained(i, j : Integer) : Boolean;
// verifica ca expresia data de i e continuta in expresia data de j
  var
    k, p : Integer;
begin
  Result := False;
  k := FirstPosAfter(j);
  p := j;
  while (not Result) and (p < k) do begin
    if SameExpression(i, p) then begin
      Result := True;
    end else begin
      p := NextOperation(p);
    end;//if
  end;//while
end;

function TStringSentence.QuantifierDistrib(i : Integer) : String;
// ..AXpq.. --> ..XApAq..
// ..EVpq.. --> ..VEpEq..
  var
    j, k, p, q, r : Integer;
    OK : Boolean;
begin
  Result := '';
  if                Sentence[i] in [Suni, Sexi] then begin
    j := FirstPosAfter(i + 1);
    OK := False;
    if Sentence[i] = Suni then begin
      if Sentence[j] = Sand then begin
        OK := True;
      end else begin
        MessageDlg(
          'The execution of the quantifier must begin with a conjunction.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin  // Sentence[i] = Sexi
      if Sentence[j] = Sorx then begin
        OK := True;
      end else begin
        MessageDlg(
          'The execution of the quantifier must begin with a disjunction.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end;//if
    if OK then begin
      p := j + 1;
      q := FirstPosAfter(p);
      r := FirstPosAfter(q);
      Result :=
        Copy(Sentence, 1, i - 1) +
        Sentence[j] +
        Copy(Sentence, i, j - i) +
        Copy(Sentence, p, q - p) +
        Copy(Sentence, i, j - i) +
        Copy(Sentence, q, r - q) +
        Copy(Sentence, r, Len - r + 1)
      ;
    end;//if
  end else begin if Sentence[i] in [Sand, Sorx] then begin
    j := i + 1;
    k := FirstPosAfter(j);
    OK := False;
    if Sentence[i] = Sand then begin
      if (Sentence[j] = Suni) and (Sentence[k] = Suni) then begin
        OK := True;
      end else begin
        MessageDlg(
          'Both arguments of the conjuntion must be universal quantifiers.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin  // Sentence[i] = Sorx
      if (Sentence[j] = Sexi) and (Sentence[k] = Sexi) then begin
        OK := True;
      end else begin
        MessageDlg(
          'Both arguments of the disjunction must be existential quantifiers.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end;//if
    if OK then begin
      if SameCondition(j, k) then begin
        p := FirstPosAfter(j + 1);
        q := FirstPosAfter(k + 1);
        r := FirstPosAfter(q);
        Result :=
          Copy(Sentence, 1, i - 1) +
          Copy(Sentence, j, p - j) +
          Sentence[i] +
          Copy(Sentence, p, k - p) +
          Copy(Sentence, q, r - q) +
          Copy(Sentence, r, Len - r + 1)
        ;
      end else begin
        MessageDlg(
          'The quantifiers must have same conditions.',
          mtWarning, [mbOK], 0
        );
      end;
    end;//if
  end else begin
    MessageDlg(
      'The current position on the grid must be a quantifier, a conjunction or a disjunction.',
      mtWarning, [mbOK], 0
    );
  end end;//if
end;

function TStringSentence.CanDeleteQuantifier(i : Integer) : String;
  var
    p, q, r : Integer;
    m, n, s : Integer;
    Gq : Integer;
begin
  Result := '0';
  if Sentence[i] in [Suni, Sexi] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    r := FirstPosAfter(q);
    m := p + 1;
    n := FirstPosAfter(m);
    if not UsesQualifier(q, i) then begin
      if Sentence[p] = Stru then begin                              // 1
        Result := DeleteQuantifier(i);
      end;//if
      if Result = '0' then begin
        if Sentence[p] = Seqa then begin                            // 2
          if Copy(Sentence, m, n - m) = Spoi + '1' then begin
            if not UsesQualifier(n, i) then begin
              Result := DeleteQuantifier(i);
            end;//if
          end;//if
        end;//if
        if Result = '0' then begin
          if (Sentence[i] = Sexi) and CanBeImplied(i) then begin    // 3
            Result := DeleteQuantifier(i);
          end;//if
        end;//if
      end;//if
    end else begin
      Result := '2';
    end;//if
  end else begin
    Result := '1';
  end;
end;

function TStringSentence.DeleteQuantifier(i : Integer) : String;
  var
    p, q, r : Integer;
begin
  p := i + 1;
  q := FirstPosAfter(p);
  r := FirstPosAfter(q);
  Result :=
    Copy(Sentence, 1, i - 1) +
    ModifyLinks(q, -1) +
    Copy(Sentence, r, Len - r + 1)
  ;
end;

function TStringSentence.IsOperation(i : Integer) : Boolean;
  var
    j : Integer;
begin
  Result := False;
  if Sentence[i] in AllOperations - [Sgen, SLLL] then begin
    Result := True;
  end else begin if Sentence[i] = '(' then begin
    j := PosEx(')', Sentence, i + 1) + 1;
    if Sentence[j] = Ssent then begin
      Result := True;
    end;//if
  end end;//if
end;

function TStringSentence.GetQuantifierType(var Universal, Cond : Boolean) : Boolean;
begin
  Result := False;
  QuantifierTypeF := TQuantifierTypeF.Create(Nil);
  try
    if QuantifierTypeF.ShowModal = mrOk then begin
      Result := True;
      if QuantifierTypeF.QuantifierRG.ItemIndex = 0 then begin
        Universal := True;
      end else begin
        Universal := False;
      end;//if
      if QuantifierTypeF.ConditionRG.ItemIndex = 0 then begin
        Cond := False;
      end else begin
        Cond := True;
      end;//if
    end;//if
  finally
     QuantifierTypeF.Free;
  end;
end;

function TStringSentence.InterchangeQuantifiers(i : Integer) : String;
  var
    j, k, p, r : Integer;
    St : String;
    Gj, Nj : Integer;
    OK : Boolean;
begin
  Result := '';
  OK := False;
  if Sentence[i] in [Suni, Sexi] then begin
    k := FirstPosAfter(i + 1);
    if Sentence[k] in [Suni, Sexi] then begin
      if not UsesQualifier(k + 1, i) then begin
        if Sentence[i] = Sentence[k] then begin
          OK := True;
        end else begin if (Sentence[i] = Sexi) and (Sentence[k] = Suni) then begin
          if CanBeImplied(i) then begin
            OK := True;
          end else begin
            MessageDlg(
              'The quantifier must be implicable.',
              mtWarning, [mbOK], 0
            );
          end;//if
        end else begin
          MessageDlg(
            'The second argument of the selected quantifier must be a quantifier of the same type, ' +
            'or the selected quantifier is existential and its second argument is a universal quantifier.',
            mtWarning, [mbOK], 0
          );
        end end;//
      end else begin
        MessageDlg(
          'The condition of the second quantifier uses the first quantifier.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The second argument of the selected quantifier must be a quantifier.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The current position on the grid must be a quantifier.',
      mtWarning, [mbOK], 0
    );
  end;//if
  if OK then begin
    p := FirstPosAfter(k + 1);
    r := FirstPosAfter(p);
    St := '';
    j := p;
    while j < r do begin
      if Sentence[j] = Spoi then begin
        Gj := GetQuantifier(j);
        Inc(j);
        Nj := GetNumber(j);
        if                Gj = i then begin
          St := St + Spoi + IntToStr(Nj - 1);
        end else begin if Gj = k then begin
          St := St + Spoi + IntToStr(Nj + 1);
        end else begin
          St := St + Spoi + IntToStr(Nj);
        end end;//if
      end else begin
        St := St + Sentence[j];
        Inc(j);
      end;//if
    end;//while
    Result :=
      Copy(Sentence, 1, i - 1) +
      ModifyQuantCond(k, -1) +
      ModifyQuantCond(i, 1) +
      St +
      Copy(Sentence, r, Len - r + 1)
    ;
  end;//if
end;

function TStringSentence.RestrictedQuantifierDistrib(i : Integer) : String;
// i trebuie sa fie implicabila
// cuantificatorii A trebuie sa aibe aceeasi conditie.
// ..VApAq.. --> ..AVpq..
// ..EXpq.. --> ..XEpEq..
  var
    j, k, p, q : Integer;
begin
  Result := '';
  if                Sentence[i] = Sorx then begin  // VApAq --> AVpq
    if CanBeImplied(i) then begin
      j := i + 1;
      k := FirstPosAfter(j);
      if (Sentence[j] = Suni) and (Sentence[k] = Suni) then begin
        if SameCondition(j, k) then begin
          p := FirstPosAfter(j + 1);
          q := FirstPosAfter(k + 1);
          Result :=
            Copy(Sentence, 1, i - 1) +
            Copy(Sentence, j, p - j) +
            Sentence[i] +
            Copy(Sentence, p, k - p) +
            Copy(Sentence, q, Len - q + 1)
          ;
        end else begin
          MessageDlg(
            'The quantifiers must have same conditions.',
            mtWarning, [mbOK], 0
          );
        end;
      end else begin
        MessageDlg(
          'Both arguments of the disjunction must be universal quantifies.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The current position on the grid cannot be implied.',
         mtWarning, [mbOK], 0
      );
    end;//if
  end else begin if Sentence[i] = Sexi then begin  // EXpq --> XEpEq
    j := FirstPosAfter(i + 1);
    if Sentence[j] = Sand then begin
      if CanBeImplied(i) then begin
        p := j + 1;
        q := FirstPosAfter(p);
        Result :=
          Copy(Sentence, 1, i - 1) +
          Sentence[j] +
          Copy(Sentence, i, j - i) +
          Copy(Sentence, p, q - p) +
          Copy(Sentence, i, j - i) +
          Copy(Sentence, q, Len - q + 1)
        ;
      end else begin
        MessageDlg(
          'The current position on the grid cannot be implied.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The execution part of the quantifier must begin with a conjunction.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The current position on the grid must be a disjunction or an existential quantifier.',
      mtWarning, [mbOK], 0
    );
  end end;//if
end;

function TStringSentence.PartialQuantifierDistrib(i : Integer) : String;
// Q e A sau E, M e X, V sau C.
// ..QMpq.. <--> ..MpQq..
  var
    j, p, q, r : Integer;
    OK : Boolean;
begin
  Result := '';
  if Sentence[i] in [Suni, Sexi] then begin
    j := FirstPosAfter(i + 1);
    if Sentence[j] in [Sand, Sorx, Simp] then begin
      p := j + 1;
      q := FirstPosAfter(p);
      r := FirstPosAfter(q);
      if not UsesQualifier(p, i) then begin
        OK := False;
        if                (Sentence[i] = Suni) and (Sentence[j] = Sand) then begin  // 1
          if Sentence[i + 1] = Stru then begin
            OK := True;
          end else begin
            MessageDlg(
              'The quantifier must have no condition.',
              mtWarning, [mbOK], 0
            );
          end;//if
        end else begin if (Sentence[i] = Sexi) and (Sentence[j] in [Sorx, Simp]) then begin  // 5, 6
          if Sentence[i + 1] = Stru then begin
            OK := True;
          end else begin
            if CanBeImplied(i) then begin
              OK := True;
            end else begin
              MessageDlg(
                'The current position on the grid cannot be implied.',
                 mtWarning, [mbOK], 0
              );
            end;//if
          end;//if
        end else begin
          OK := True;
        end end;//if
        if OK then begin
          Result :=
            Copy(Sentence, 1, i - 1) +
            Sentence[j] +
            ModifyLinks(p, -1) +
            Copy(Sentence, i, j - i) +
            Copy(Sentence, q, r - q) +
            Copy(Sentence, r, Len - r + 1)
          ;
        end;//if
      end else begin
        MessageDlg(
          'The first argument of the conjunction, disjunction or implication uses the quantifier.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The execution of the quantifier must begin with a conjunction, disjunction or implication.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin if Sentence[i] in [Sand, Sorx, Simp] then begin
    j := FirstPosAfter(i + 1);
    if Sentence[j] in [Suni, Sexi] then begin
      p := i + 1;
      q := FirstPosAfter(j + 1);
      r := FirstPosAfter(q);
      OK := False;
      if                (Sentence[i] = Sand) and (Sentence[j] = Suni) then begin  // 7
        if Sentence[j + 1] = Stru then begin
          OK := True;
        end else begin
          if CanBeImplied(i) then begin
            OK := True;
          end else begin
            MessageDlg(
              'The current position on the grid cannot be implied.',
               mtWarning, [mbOK], 0
            );
          end;//if
        end;
      end else begin if (Sentence[i] in [Sorx, Simp]) and (Sentence[j] = Sexi) then begin  // 10, 12
        if Sentence[j + 1] = Stru then begin
          OK := True;
        end else begin
          MessageDlg(
            'The quantifier must have no condition.',
            mtWarning, [mbOK], 0
          );
        end;
      end else begin
        OK := True;
      end end;//if
      if OK then begin
        Result :=
          Copy(Sentence, 1, i - 1) +
          Copy(Sentence, j, q - j) +
          Sentence[i] +
          ModifyLinks(p, 1) +
          Copy(Sentence, q, r - q) +
          Copy(Sentence, r, Len - r + 1)
        ;
      end;//if
    end else begin
      MessageDlg(
        'The second argument of the conjunction, disjunction or implication must be a quantifier.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The current position on the grid must be a quantifier, a conjunction, a disjunction or an implication.',
      mtWarning, [mbOK], 0
    );
  end end;//if
end;

function TStringSentence.DualQuantifierDistrib(i : Integer) : String;
// ..ACpq.. <--> ..CEpq..
// ..ECpq.. <--> ..CApq..
  var
    j, p, q, r : Integer;
    Quant : Char;
    OK : Boolean;
begin
  Result := '';
  if Sentence[i] in [Suni, Sexi] then begin
    j := FirstPosAfter(i + 1);
    if Sentence[j] = Simp then begin
      if Sentence[i] = Suni then begin
        Quant := Sexi;
      end else begin
        Quant := Suni;
      end;
      p := j + 1;
      q := FirstPosAfter(p);
      r := FirstPosAfter(q);
      if not UsesQualifier(q, i) then begin
        OK := False;
        if Sentence[i] = Sexi then begin
          if Sentence[i + 1] = Stru then begin
            OK := True;
          end else begin
            if CanBeImplied(i) then begin
              OK := True;
            end else begin
              MessageDlg(
                'The current position on the grid cannot be implied.',
                 mtWarning, [mbOK], 0
              );
            end;//if
          end;//if
        end else begin
          OK := True;
        end;//if
        if OK then begin
          Result :=
            Copy(Sentence, 1, i - 1) +
            Sentence[j] +
            Quant + Copy(Sentence, i + 1, j - i - 1) +
            Copy(Sentence, p, q - p) +
            ModifyLinks(q, -1) +
            Copy(Sentence, r, Len - r + 1)
          ;
        end;//if
      end else begin
        MessageDlg(
          'The second argument of the implication uses the quantifier.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The execution of the quantifier must begin with an implication.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin if Sentence[i] = Simp then begin
    j := i + 1;
    if Sentence[j] in [Suni, Sexi] then begin
      p := FirstPosAfter(j + 1);
      q := FirstPosAfter(p);
      r := FirstPosAfter(q);
      OK := False;
      if Sentence[j] = Suni then begin
        Quant := Sexi;
        if Sentence[j + 1] = Stru then begin
          OK := True;
        end else begin
          MessageDlg(
            'The quantifier must have no condition.',
            mtWarning, [mbOK], 0
          );
        end;//if
      end else begin
        Quant := Suni;
        OK := True;
      end;
      if OK then begin
        Result :=
          Copy(Sentence, 1, i - 1) +
          Quant + Copy(Sentence, j + 1, p - j - 1) +
          Sentence[i] +
          Copy(Sentence, p, q - p) +
          ModifyLinks(q, 1) +
          Copy(Sentence, r, Len - r + 1)
        ;
      end;//if
    end else begin
      MessageDlg(
        'The first argument of the implication must begin with a quantifier.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The current position on the grid must be a quantifier or an implication.',
      mtWarning, [mbOK], 0
    );
  end end;
end;

function TStringSentence.SatisfyCondition(Qi, i, j : Integer) : Boolean;
// Qi e pe un quantificator
// i e pe conditia lui Qi sau pe un argument al unei conjunctii a conditiei lui Qi
// j e pe conditia lui Qj
// Qj e pe un cuantificator universal
// Cuantificatorul definit de Qj poate avea in conditie referinte la cuantificatorul Qi.
// Verifica ca conditia lui Qi e satisfacuta de forma indicata de j.
  var
    m, n, p, q : Integer;
    Gp, Gq : Integer;
    Np, Nq : Integer;
    Qj : Integer;
begin
  Result := True;
  if Sentence[j] <> Stru then begin
    Qj := j - 1;
    p := i;
    q := j;
    m := FirstPosAfter(p);
    n := FirstPosAfter(q);
    while Result and (p < m) do begin
      if q < n then begin
        if Sentence[p] = Spoi then begin
          if Sentence[q] = Spoi then begin
            Gp := GetQuantifier(p);
            Gq := GetQuantifier(q);
            Inc(p);
            Np := GetNumber(p);
            Inc(q);
            Nq := GetNumber(q);
            if                Gp < Qi then begin
              if Gp <> Gq then begin
                Result := False;
              end;//if
            end else begin if Gp = Qi then begin
              if (Gq <> Qj) and (Gq <> Qi) then begin
                Result := False;
              end;//if
            end else begin // Gp > Qi
              if Np <> Nq then begin
                Result := False;
              end;//if
            end end;//if
          end else begin
            Result := False;
          end;//if
        end else begin
          if Sentence[p] = Sentence[q] then begin
            Inc(p);
            Inc(q);
          end else begin
            Result := False;
          end;//if
        end;//if
      end else begin
        Result := False;
      end;//if
    end;//while
  end;//if
end;

function TStringSentence.RecCondition(Qi, i, j : Integer) : Boolean;
begin
  Result := SatisfyCondition(Qi, i, j);
  if not(Result) then begin
    if Sentence[i] = Sand then begin
      Inc(i);
      Result := RecCondition(Qi, i, j);
      if not(Result) then begin
        i := FirstPosAfter(i);
        Result := RecCondition(Qi, i, j);
      end;//if
    end;//if
  end;//if
end;

function TStringSentence.KernelQuantifierParticularization(i, j : Integer) : String;
  var
    p, n, Gk, Nk : Integer;
begin
  Result := Copy(Sentence, 1, j - 1);
  p := FirstPosAfter(j + 1);
  n := FirstPosAfter(j);
  while p < n do begin
    if Sentence[p] = Spoi then begin
      Gk := GetQuantifier(p);
      if                Gk < j then begin
        Inc(p);
        Nk := GetNumber(p);
        Dec(Nk);
      end else begin if Gk = j then begin
        Nk := QuantifierParentsNumber(i, p) - 1;
        p := FirstPosAfter(p);
      end else begin
        Inc(p);
        Nk := GetNumber(p);
      end end;//if
      Result := Result + Spoi + IntToStr(Nk);
    end else begin
      Result := Result + Sentence[p];
      Inc(p);
    end;//if
  end;//while
  Result := Result + Copy(Sentence, n, Len - n + 1);
end;

function TStringSentence.QuantifierParticularization(i, j : Integer) : String;
// i poate fi un cuantificator
// j trebuie sa fie un cuantifificator universal.
begin
  Result := '';
  if Sentence[i] in [Suni, Sexi] then begin
    if Sentence[j] = Suni then begin
      if Ancestor(i, j) then begin
        if RecCondition(i, i + 1, j + 1) then begin
          Result := KernelQuantifierParticularization(i, j);
        end else begin
          MessageDlg(
            'The destination quantifier must have no condition or ' +
            'the condition of the source quantifier must satisfy ' +
            'the condition of the destination quantifier.',
            mtWarning, [mbOK], 0
          );
        end;//if
      end else begin
        MessageDlg(
          'The source quantifier must be an ancestor of the destination quantifier.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The destination must be a universal quantifier.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The source must be a quantifier.',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.KernelExpressionParticularization(i, j : Integer) : String;
  var
    p, r, Gp, Number : Integer;
begin
  p := FirstPosAfter(j + 1);
  r := FirstPosAfter(j);
  Result := Copy(Sentence, 1, j - 1);
  while p < r  do begin
    if Sentence[p] = Spoi then begin
      Gp := GetQuantifier(p);
      if                Gp < j then begin
        Inc(p);
        Number := GetNumber(p);
        Result := Result + Spoi + IntToStr(Number - 1);
      end else begin if Gp = j then begin
        Result := Result + AdaptExpressionToPos(i, p, -1);
        p := FirstPosAfter(p);
      end else begin // Gk > j
        Inc(p);
        Number := GetNumber(p);
        Result := Result + Spoi + IntToStr(Number);
      end end;//if
    end else begin
      Result := Result + Sentence[p];
      Inc(p);
    end;//if
  end;//while
  Result := Result + Copy(Sentence, r, Len - r + 1);
end;

function TStringSentence.Duplicable(i, j : Integer; Source, Destination : String) : Boolean;
// i is the source, j is the destination
// i, j are forms
// o is the first common ancestor of the source and the destination
// m is the first argument of o
// n is the second argument of o

// 1. o is 'A', 'E', 'C' and
//    m is the source or a conjunction containing the source and
//    n contains the destination
// 2. o is 'X' and
//    m is the source or a conjunction containing the source and
//    n contains the destination
// 3. o is 'X' and
//    m contains the destination and
//    n is the source or a conjunction containing the source
 var
    o, m, n : Integer;
begin
  Result := False;
  if (i > 1) and (j > 1) then begin
    if i <> j then begin
      if IsForm(i) then begin
        if IsForm(j) then begin
          o := FirstCommonAncestor(i, j);
          m := o + 1;             // primul argument al lui o
          n := FirstPosAfter(m);  // al doilea argument al lui o
          if                Sentence[o] in [Suni, Sexi, Simp] then begin     // 1
            if (m = i) or ConjAncestor(m, i) then begin
              if (n = j) or Ancestor(n, j) then begin
                Result := True;
              end else begin
                if Source <> '' then begin
                  MessageDlg(
                    'The first common ancestor of the ' + Source + ' and the ' + Destination +
                    ' is a quantifier or an implication. ' +
                    'Its second argument must contain the ' + Destination + '.',
                    mtWarning, [mbOK], 0
                  );
                end;//if
              end;//if
            end else begin
              if Source <> '' then begin
                MessageDlg(
                  'The first common ancestor of the ' + Source + ' and the ' + Destination +
                  ' is a quantifier or an implication. ' +
                  'Its first argument must be the ' + Source +
                  ' or a conjunction containing the ' + Source + '.',
                  mtWarning, [mbOK], 0
                );
              end;//if
            end;//if
          end else begin if Sentence[o] = Sand then begin
            if ConjAncestor(o, i) then begin
              if (m = i) or Ancestor(m, i) then begin                        // 2
                if (n = j) or Ancestor(n, j) then begin
                  Result := True;
                end else begin
                  if Source <> '' then begin
                    MessageDlg(
                      'The first common ancestor of the ' + Source + ' and the ' + Destination +
                      ' is a conjunction. ' +
                      'Its second argument must contain the ' + Destination + '.',
                      mtWarning, [mbOK], 0
                    );
                  end;//if
                end;//if
              end else begin
                if (m = j) or Ancestor(m, j) then begin                      // 3
                  if (n = i) or Ancestor(n, i) then begin
                    Result := True;
                  end else begin
                    if Source <> '' then begin
                      MessageDlg(
                        'The first common ancestor of the ' + Source + ' and the ' + Destination +
                        ' is a conjunction. ' +
                        'Its first argument must contain the ' + Destination + '.',
                        mtWarning, [mbOK], 0
                      );
                    end;//if
                  end;//if
                end else begin
                  if Source <> '' then begin
                    MessageDlg(
                      'The first common ancestor of the ' + Source + ' and the ' + Destination +
                      ' is a conjunction. ' +
                      'Its first argument must contain the ' + Destination + '.',
                      mtWarning, [mbOK], 0
                    );
                  end;//if
                end;//if
              end;//if
            end else begin
              if Source <> '' then begin
                MessageDlg(
                  'The first common ancestor of the ' + Source + ' and the ' + Destination +
                  ' is a conjunction. ' +
                  'One of its arguments must be the ' + Source +
                  ' or a conjunction containing the ' + Source + '.',
                  mtWarning, [mbOK], 0
                );
              end;//if
            end;//if
          end else begin
            if Source <> '' then begin
              MessageDlg(
                'The first common ancestor of the ' + Source + ' and of the ' + Destination +
                ' must be an implication, a conjunction, or a quantifier.',
                mtWarning, [mbOK], 0
              );
            end;//if
          end end;//if
        end else begin
          if Destination <> '' then begin
            MessageDlg(
              'The ' + Destination + ' must be a form.',
               mtWarning, [mbOK], 0
            );
          end;//if
        end;//if
      end else begin
        if Source <> '' then begin
          MessageDlg(
            'The ' + Source + ' must be a form.',
             mtWarning, [mbOK], 0
          );
        end;//if
      end;//if
    end else begin
      if Source <> '' then begin
        MessageDlg(
          'The ' + Source + ' and the ' + Destination + ' must be different.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end;
  end else begin
    if Source <> '' then begin
      MessageDlg(
        'The first logical operator has no ancestor.',
         mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

function TStringSentence.VerifyParentForCondition(i, j, p : Integer) : Boolean;
// i e pe un term
// j e pe un Suni
// p e un stramos form al lui i.
// Functia verifica ca expresia data de p verifica conditia cuantificatorului j,
// unde variabila cuantificatorului a fost inlocuita prin expresia i
  var
    q, r, Gq, Number : Integer;
    Cond, St : String;
begin
  Result := False;
  if Duplicable(p, j, '', '') then begin
    Cond := AdaptExpressionToPos(p, j + 1, -1);
    St := '';
    q := j + 1;
    r := FirstPosAfter(q);
    while q < r do begin
      if Sentence[q] = Spoi then begin
        Gq := GetQuantifier(q);
        if                Gq < j then begin
          Inc(q);
          Number := GetNumber(q);
          St := St + Spoi + IntToStr(Number - 1);
        end else begin if Gq = j then begin
          St := St + AdaptExpressionToPos(i, q, -1);
          q := FirstPosAfter(q);
        end else begin // Gq > j
          Inc(q);
          Number := GetNumber(q);
          St := St + Spoi + IntToStr(Number);
        end end;//if
      end else begin
        St := St + Sentence[q];
        Inc(q);
      end;//if
    end;//while
    Result := (St = Cond);
  end;//if
end;

function TStringSentence.ExpressionParticularization(i, j : Integer) : String;
// i must point to a function, a class generator or a reference to a quantifier.
// j must point to a universal quantifier.
  var
    m, p : Integer;
    OK : Boolean;
begin
  Result := '';
  if IsTerm(i) then begin
    if Sentence[j] = Suni then begin
      if ExternalPointedQuantifiersAreAncestors(i, j) then begin
        OK := False;
        if Copy(Sentence, j + 1, FirstPosAfter(j + 1) - j - 1) = Stru then begin
          OK := True;
        end else begin
          p := Parent(i);
          while (not OK) and (p > 0) do begin
            OK := VerifyParentForCondition(i, j, p);
            p := Parent(p);
          end;//while
          if not OK then begin
            MessageDlg(
              'The source does not satisfy the condition of the destination.',
              mtWarning, [mbOK], 0
            );
          end;//if
        end;//if
        if OK then begin
          Result := KernelExpressionParticularization(i, j);
        end;//if
      end else begin
        MessageDlg(
          'The external pointed quantifiers from the source  ' +
          'must be ancestors of the destination.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The destination must be a universal quantifier.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The source must be a term.',
      mtWarning, [mbOK], 0
    );
  end;//
end;

function TStringSentence.NoQuantifierAncestor(i, j : Integer) : Boolean;
// i, j trebuie sa fie operatii
// Se verifica ca i e unul din stramosii lui j
// niciun stramos al lui j pina la i nu are voie sa fie Suni, Sexi, Sgen
  const
    Quant = [Suni, Sexi, Sgen];
  var
    k : Integer;
begin
  Result := False;
  k := Parent(j);
  while (not Result) and (i <= k) do begin
    if Sentence[k] in Quant then begin
      k := 0;
    end else begin
      if i = k then begin
        Result := True;
      end else begin
        k := Parent(k);
      end;
    end;//if
  end;//while
end;

function TStringSentence.KernelParticularization(i, j : Integer) : String;
begin
  Result := '';
  if Sentence[j] = Suni then begin
    if Sentence[i] in [Suni, Sexi] then begin
      Result := KernelQuantifierParticularization(i, j);
    end else begin
      Result := KernelExpressionParticularization(i, j);
    end;//if
  end;//if
end;

function TStringSentence.Particularization(i, j : Integer) : String;
begin
  Result := '';
  if Sentence[j] = Suni then begin
    if CanBeImplied(j) then begin
      if                Sentence[i] in [Suni, Sexi] then begin
        Result := QuantifierParticularization(i, j);
      end else begin if Sentence[i] in [Sgen, '(', Spoi] then begin
        Result := ExpressionParticularization(i, j);
      end else begin
        MessageDlg(
          'The source must be a quantifier, a reference to a quantifier, ' +
          'a function, or a class generator.',
          mtWarning, [mbOK], 0
        );
      end end;//if
    end else begin
      MessageDlg(
        'The destination quantifier cannot be implied.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The destination must be a universal quantifier.',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.DuplicationAnd(i, j : Integer) : String;
// i indica sursa, j indica destinatia
// i, j trebuie sa indice forme.
// sursa trebuie sa fie duplicabila pe destinatie
// 1. Daca sursa si detinatia sunt egale, atunci parintele destinatiei trebuie
// sa fie conjunctie
// Functia inlocuieste conjunctia cu celalalt argument al conjunctiei.
// 2. Daca sursa si destinatia nu sunt egale, atunci functia inlocuieste
// destinatia cu conjuntia formata din destinatie si sursa.
  var
    m, n, p, q, r, s : Integer;
    St : String;
begin
  Result := '';
  if Duplicable(i, j, 'source', 'destination') then begin
    m := FirstPosAfter(i);
    n := FirstPosAfter(j);
    p := Parent(j);
    q := FirstPosAfter(p);
    St := AdaptExpressionToPos(i, j, 0);
    if St = Copy(Sentence, j, n - j) then begin
      if Sentence[p] = Sand then begin  // desfiinteaza dublura
        if p = j - 1 then begin  // destinatia e primul argument al conjunctiei
          r := n;
          s := q;
        end else begin           // destinatia e al doilea argument al conjunctiei
          r := p + 1;
          s := j;
        end;//if
        Result :=
          Copy(Sentence, 1, p - 1) +
          Copy(Sentence, r, s - r) +
          Copy(Sentence, q, Len - q + 1)
        ;
      end else begin
        MessageDlg(
          'The parent of the destination must be a conjunction.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin  // adauga sursa la destinatie
      Result :=
        Copy(Sentence, 1, j - 1) +
        Sand +
        St +
        Copy(Sentence, j, n - j) +
        Copy(Sentence, n, Len - n + 1)
      ;
    end;//if
  end;//if
end;

function TStringSentence.DuplicationImp(i, j : Integer) : String;
// i indica sursa, j indica destinatia
// i, j trebuie sa indice forme.
// sursa trebuie sa fie duplicabila pe destinatie
// 1. Daca sursa si detinatia sunt egale, atunci parintele destinatiei trebuie
// sa fie implicatie iar destinatia trebuie sa fie primul argument al acestei implicatii.
// Functia inlocuieste implicatia cu al doilea argument al implicatiei.
// 2. Daca sursa si destinatia nu sunt egale, atunci functia inlocuieste
// destinatia cu implicatia formata din sursa si destinatie.
  var
    m, n, p, q, r, s : Integer;
    St : String;
begin
  Result := '';
  if Duplicable(i, j, 'source', 'destination') then begin
    m := FirstPosAfter(i);
    n := FirstPosAfter(j);
    p := Parent(j);
    q := FirstPosAfter(p);
    St := AdaptExpressionToPos(i, j, 0);
    if St = Copy(Sentence, j, n - j) then begin
      if Sentence[p] = Simp then begin
        if j = p + 1 then begin
          Result :=
            Copy(Sentence, 1, p - 1) +
            Copy(Sentence, n, q - n) +
            Copy(Sentence, q, Len - q + 1)
          ;
        end else begin
          MessageDlg(
            'The destination must be the first argument of the implication.',
             mtWarning, [mbOK], 0
          );
        end;//if
      end else begin
        MessageDlg(
          'The parent of the destination must be an implication.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin  // adauga sursa la destinatie
      Result :=
        Copy(Sentence, 1, j - 1) +
        Simp +
        St +
        Copy(Sentence, j, n - j) +
        Copy(Sentence, n, Len - n + 1)
      ;
    end;//if
  end;//if
end;

function TStringSentence.Attachment(i, j : Integer) : String;
// i indica sursa, j indica destinatia
// i, j trebuie sa indice forme.
// Sursa trebuie sa fie primul argument al unei implicatii.
// Parintele sursei trebuie sa fie duplicabil pe destinatie.
// Sursa si destinatia trebuie sa fie egale.

// Daca parintele destinatiei e o conjunctie, iar celalalt argument
// al conjunctiei e egal cu al doilea argument al parintelui sursei,
// atunci functia desfiinteaza al doilea argument al parintelui destinatiei.
// In caz contrar, functia ataseaza destinatiei (prin conjunctie) al doilea
// argument al parinteluli sursei.
  var
    s, m, n : Integer;  // pentru sursa
    x, q, r : Integer;  // pentru destinatie
    Sti, Stm : String;
    Adding : Boolean;
begin
  Result := '';
  if i > 1 then begin
    s := i - 1;
    if Sentence[s] = Simp then begin
      if Duplicable(s, j, 'parent of the source', 'destination') then begin
        m := FirstPosAfter(i);
        n := FirstPosAfter(m);
        Sti := AdaptExpressionToPos(i, j, 0);
        Stm := AdaptExpressionToPos(m, j, 0);
        x := Parent(j);
        if Sti = Copy(Sentence, j, FirstPosAfter(j) - j) then begin
          Adding := True;
          if Sentence[x] = Sand then begin
            if x = j - 1 then begin  // j e primul argument al conjunctiei
              q := FirstPosAfter(j);
              r := FirstPosAfter(q);
              if Stm = Copy(Sentence, q, r - q) then begin
                Result :=
                  Copy(Sentence, 1, j - 2) +
                  Copy(Sentence, j, q - j) +
                  Copy(Sentence, r, Len - r + 1)
                ;
                Adding := False;
              end;//if
            end else begin           // j e al doilea argument al conjunctiei
              q := x + 1;
              if Stm = Copy(Sentence, q, j - q) then begin
                Result :=
                  Copy(Sentence, 1, q - 2) +
                  Copy(Sentence, j, Len - j + 1)
                ;
                Adding := False;
              end;//if
            end;//if
          end;//if
          if Adding then begin
            r := FirstPosAfter(j);
            Result :=
              Copy(Sentence, 1, j - 1) +
              Sand +
              Copy(Sentence, j, r - j) +
              Stm +
              Copy(Sentence, r, Len - r + 1)
            ;
          end;//if
        end else begin
          MessageDlg(
            'The source and the destination must be equal.',
             mtWarning, [mbOK], 0
          );
        end;//if
      end;//if
    end else begin
      MessageDlg(
        'The source must be the first argument of an implication.',
         mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The source has no parent.',
       mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.Replacement(i, j : Integer) : String;
// i trebuie sa indice unul din argumentele unei duble implicatii sau egalitati
// sau primul argument al unei implicatii.
// j trebuie sa indice o expresie care trebuie sa corespunda cu expresia indicata de i
// Dubla implicatie, egalitatea sau implicatia si j trebuie sa fie duplicabile
// Functia va inlocui expresia indicata de j cu celalalt argument al parintelui lui i
  var
    o, k, q, m, n : Integer;
    OK : Boolean;
    ffaj : Integer;
begin
  Result := '';
  o := Parent(i);
  OK := False;
  if o > 0 then begin
    if                Sentence[o] = Sdou then begin
      if IsForm(j) then begin
        if o = i - 1 then begin
          q := FirstPosAfter(i);
        end else begin
          q := o + 1;
        end;//if
        if Duplicable(o, j, 'parent of the source', 'destination') then begin
          OK := True;
        end;//if
      end else begin
        MessageDlg(
          'The expression you want to replace must be a form.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin if Sentence[o] = Simp then begin
      if IsForm(j) then begin
        if o = i - 1 then begin
          q := FirstPosAfter(i);
          if CanBeImplied(j) then begin
            if Duplicable(o, j, 'parent of the source', 'destination') then begin
              OK := True;
            end;//if
          end else begin
            MessageDlg(
              'The expression you want to replace cannot be implied.',
               mtWarning, [mbOK], 0
            );
          end;//if
        end else begin
          MessageDlg(
            'You have selected the second argument of an implication!',
            mtWarning, [mbOK], 0
          );
        end;//if
      end else begin
        MessageDlg(
          'The expression you want to replace must be a form.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin if Sentence[o] = Seqa then begin
      if IsTerm(j) then begin
        if o = i - 1 then begin
          q := FirstPosAfter(i);
        end else begin
          q := o + 1;
        end;//if
        ffaj := FirstFormulaAncestor(j);
        if Duplicable(o, ffaj, 'parent of the source', 'first formula ancestor of the destination') then begin
          OK := True;
        end;//if
      end else begin
        MessageDlg(
          'The expression you want to replace must be a term.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'First select an argument of a double implication/equality or the first ' +
        'argument of an implication and then the expression you want to replace. ' +
        'The selected arguments must be equal.',
        mtWarning, [mbOK], 0
      );
    end end end;//if
  end else begin
    MessageDlg(
      'First select an argument of a double implication/equality or the first ' +
      'argument of an implication and then the expression you want to replace. ' +
      'The selected arguments must be equal.',
      mtWarning, [mbOK], 0
    );
  end;//if
  if OK then begin
    k := FirstPosAfter(j);
    m := FirstPosAfter(i);
    n := FirstPosAfter(q);
    if Copy(Sentence, j, k - j) = AdaptExpressionToPos(i, j, 0) then begin
      Result :=
        Copy(Sentence, 1, j - 1) +
        AdaptExpressionToPos(q, j, 0) +
        Copy(Sentence, k, Len - k + 1)
      ;
    end else begin
      MessageDlg('The selected expressions must be equal.', mtWarning, [mbOK], 0);
    end;//if
  end;//if
end;

function TStringSentence.Commutativity(i : Integer) : String;
  var
    n, p, q : Integer;
begin
  Result := '';
  if Sentence[i] in [Sand, Sorx, Sdou, Seqa] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    n := FirstPosAfter(q);
    Result :=
      Copy(Sentence, 1, i) +
      Copy(Sentence, q, n - q) +
      Copy(Sentence, p, q - p) +
      Copy(Sentence, n, Len - n + 1)
    ;
  end else begin
    MessageDlg(
      'Select a conjunction, disjunction, double implication, or equality!',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.Reflexivity(i : Integer) : String;
  var
    n, p, q : Integer;
begin
  Result := '';
  if Sentence[i] in [Sdou, Seqa] then begin
    p := i + 1;
    q := FirstPosAfter(p);
    n := FirstPosAfter(q);
    if Copy(Sentence, p, q - p) = Copy(Sentence, q, n - q) then begin
      Result := Copy(Sentence, 1, i - 1) + Stru + Copy(Sentence, n, Len - n + 1);
    end else begin
      MessageDlg(
        'The arguments of the selected operator must be equal!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'Select a double implication or an equality!',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.PartNotChanged(var p : String; St : String) : Boolean;
begin
  Result := True;
  if p = '' then begin
    p := St;
  end else begin
    if p <> St then begin
      Result := False;
    end;//if
  end;
end;

function TStringSentence.FormPosAfter(Formula : String; i : Integer) : Integer;
// Formula e o propozitie
  var
    Ch : Char;
begin
  Result := 0;
  Ch := Formula[i];
  if Ch in [Sorx, Sand, Sdou, Simp] then begin
    Result := FormPosAfter(Formula, i + 1);
    Result := FormPosAfter(Formula, Result);
  end else begin if Ch = Snot then begin
    Result := FormPosAfter(Formula, i + 1);
  end else begin
    Result := i + 1;
  end end;//if
end;

function TStringSentence.TrueValue(Formula : String; i : Integer; p, q, r, s : Boolean) : Boolean;
// Formula e o propozitie in care p, q, r, s au valorile '0' sau '1'.
  var
    Ch : Char;
    j : Integer;
begin
  Ch := Formula[i];
  j := FormPosAfter(Formula, i + 1);
  if                Ch = Sorx then begin
    Result := LogicV(TrueValue(Formula, i + 1, p, q, r, s), TrueValue(Formula, j, p, q, r, s));
  end else begin if Ch = Sand then begin
    Result := LogicX(TrueValue(Formula, i + 1, p, q, r, s), TrueValue(Formula, j, p, q, r, s));
  end else begin if Ch = Sdou then begin
    Result := LogicD(TrueValue(Formula, i + 1, p, q, r, s), TrueValue(Formula, j, p, q, r, s));
  end else begin if Ch = Simp then begin
    Result := LogicC(TrueValue(Formula, i + 1, p, q, r, s), TrueValue(Formula, j, p, q, r, s));
  end else begin if Ch = Snot then begin
    Result := LogicN(TrueValue(Formula, i + 1, p, q, r, s));
  end else begin if Ch = Stru then begin
    Result := True;
  end else begin
    if                Ch = 'p' then begin
      Result := p;
    end else begin if Ch = 'q' then begin
      Result := q;
    end else begin if Ch = 'r' then begin
      Result := r;
    end else begin // Ch = 's'
      Result := s;
    end end end;//if
  end end end end end end;
end;

function TStringSentence.Tautology(Formula : String) : Boolean;
  var
    p, q, r, s, ready : Boolean;
    St : String;
begin
  Result := True;
  p := False;
  q := False;
  r := False;
  s := False;
  ready := False;
  while Result and (not ready) do begin
    Result := TrueValue(Formula, 1, p, q, r, s);
    if not(p) then begin
      p := True;
    end else begin
      p := False;
      if not(q) then begin
        q := True;
      end else begin
        q := False;
        if not(r) then begin
          r := True;
        end else begin
          r := False;
          if not(s) then begin
            s := True;
          end else begin
            ready := True;
          end;//if
        end;//if
      end;//if
    end;//if
  end;//while
end;

function TStringSentence.Syntax(Formula : String; i, f : Integer) : Boolean;
  var
    Ch : Char;
    j, k : Integer;
begin
  Result := False;
  if FormPosAfter(Formula, i) = f then begin
    Ch := Formula[i];
    if                Ch in [Sorx, Sand, Sdou, Simp] then begin
      j := i + 1;
      k := FormPosAfter(Formula, i + 1);
      if Syntax(Formula, j, k) then begin
        Result := Syntax(Formula, k, f);
      end;//if
    end else begin if Ch = Snot then begin
      j := i + 1;
      Result := Syntax(Formula, j, f);
    end else begin if Ch in [Stru, 'p', 'q', 'r', 's'] then begin
      Result := True;
    end end end;//if
  end;//if
end;

function TStringSentence.VarIsUsedIn(Formula : String; i : Integer; Ch : Char) : Boolean;
// verifica daca Ch e folosit in portiunea indicata de i.
  var
    j, n : Integer;
begin
  Result := False;
  j := FormPosAfter(Formula, i);
  n := i;
  while (not Result) and (n < j) do begin
    Result := (Ch = Formula[n]);
    Inc(n);
  end;//while
end;

function TStringSentence.VarAreLeft(Formula : String) : Boolean;
// p, q, r, s folosite trebuie sa fie definite in primul membru.
  var
    i, j : Integer;
begin
  Result := True;
  i := 2;
  j := FormPosAfter(Formula, i);
  if VarIsUsedIn(Formula, j, 'p') then begin
    if not VarIsUsedIn(Formula, i, 'p') then begin
      Result := False;
    end;//if
  end;
  if Result then begin
    if VarIsUsedIn(Formula, j, 'q') then begin
      if not VarIsUsedIn(Formula, i, 'q') then begin
        Result := False;
      end;//if
    end;
  end;//if
  if Result then begin
    if VarIsUsedIn(Formula, j, 'r') then begin
      if not VarIsUsedIn(Formula, i, 'r') then begin
        Result := False;
      end;//if
    end;
  end;//if
  if Result then begin
    if VarIsUsedIn(Formula, j, 's') then begin
      if not VarIsUsedIn(Formula, i, 's') then begin
        Result := False;
      end;//if
    end;
  end;//if
end;

function TStringSentence.VerifyFormula(Formula : String) : Boolean;
  var
    nr, i : Integer;
    OK : Boolean;
begin
  Result := False;
  nr := Length(Formula);
  if nr > 0 then begin
    i := 1;
    OK := True;
    while OK and (i <= nr) do begin
      if Formula[i] in [Sorx, Sand, Sdou, Simp, Snot, Stru, 'p', 'q', 'r', 's'] then begin
        Inc(i);
      end else begin
        OK := False;
      end;//if
    end;//while
    if OK then begin
      if Formula[1] in [Sdou, Simp] then begin
        if Syntax(Formula, 1, nr + 1) then begin
          if Tautology(Formula) then begin
            if VarAreLeft(Formula) then begin
              Result := True;
            end else begin
              MessageDlg('All the variables of the second argument must also be used in the first argument.', mtWarning, [mbOK], 0);
            end;//if
          end else begin
            MessageDlg('Formula is not a tautology.', mtWarning, [mbOK], 0);
          end;//if
        end else begin
          MessageDlg('Wrong syntax.', mtWarning, [mbOK], 0);
        end;//if
      end else begin
        MessageDlg('Formula must begin with a double implication or an implication.', mtWarning, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('Only the characters V, X, D, C, N, T, p, q, r, s are allowed.', mtWarning, [mbOK], 0);
    end;//if
  end else begin
    MessageDlg('Formula is empty.', mtWarning, [mbOK], 0);
  end;//if
end;

procedure TStringSentence.SeparArguments(Formula : String; var Arg1, Arg2 : String);
  var
    i, j : Integer;
begin
  i := 2;
  j := FormPosAfter(Formula, i);
  Arg1 := Copy(Formula, i, j - i);
  i := j;
  j := FormPosAfter(Formula, i);
  Arg2 := Copy(Formula, i, j - i);
end;

function TStringSentence.ApplyFormula(Formula : String; i : Integer) : String;
// Formula trebuie sa inceapa cu o implicatie sau dubla implicatie.
// Programul verifica ca enuntul la pozitia i corespunde cu primul argument al formulei.
// Daca corespunde, programul inlocuieste partea din enunt de la pozitia i cu
// o portiune obtinuta conform celui de-al doilea argument al formulei.
  var
    u : Integer;
    Ip, Co, St : String;
    OK : Boolean;
    Ch : Char;
    j, k : Integer;
    p, q, r, s : String;
begin
  Result := '';
  u := FormPosAfter(Formula, 2);
  Ip := Copy(Formula, 2, u - 2);
  Co := Copy(Formula, u, Length(Formula) - u + 1);
  p := '';
  q := '';
  r := '';
  s := '';
  OK := SatisfyParams(Ip, Co);
  u := 1;
  j := i;
  while OK and (u <= Length(Ip)) do begin
    Ch := Ip[u];
    if                Ch = 'p' then begin
      k := j;
      j := FirstPosAfter(k);
      St := Copy(Sentence, k, j - k);
      OK := PartNotChanged(p, St);
    end else begin if Ch = 'q' then begin
      k := j;
      j := FirstPosAfter(k);
      St := Copy(Sentence, k, j - k);
      OK := PartNotChanged(q, St);
    end else begin if Ch = 'r' then begin
      k := j;
      j := FirstPosAfter(k);
      St := Copy(Sentence, k, j - k);
      OK := PartNotChanged(r, St);
    end else begin if Ch = 's' then begin
      k := j;
      j := FirstPosAfter(k);
      St := Copy(Sentence, k, j - k);
      OK := PartNotChanged(s, St);
    end else begin
      if Ch = Sentence[j] then begin
        Inc(j);
      end else begin
        OK := False;
      end;//if
    end end end end;//if
    Inc(u);
  end;//while
  if OK then begin
    Result := Copy(Sentence, 1, i - 1);
    u := 1;
    while u <= Length(Co) do begin
      Ch := Co[u];
      if                Ch = 'p' then begin
        Result := Result + p;
      end else begin if Ch = 'q' then begin
        Result := Result + q;
      end else begin if Ch = 'r' then begin
        Result := Result + r;
      end else begin if Ch = 's' then begin
        Result := Result + s;
      end else begin
        Result := Result + Ch;
      end end end end;//if
      Inc(u);
    end;//while
    j := FirstPosAfter(i);
    Result := Result + Copy(Sentence, j, Len - j + 1);
  end;//if
end;

function TStringSentence.VerifySentenceAndApplyFormula(Formula : String; i : Integer) : String;
  var
    ResLeft, ResRight : String;
begin
  Result := '';
  if Formula[1] = Sdou then begin
    Result := ApplyFormula(Formula, i);
    if Result = '' then begin
      MessageDlg(
        'The sentence does not match the formula.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin if Formula[1] = Simp then begin
    if CanBeImplied(i) then begin
      Result := ApplyFormula(Formula, i);
      if Result = '' then begin
        MessageDlg(
          'The sentence does not match the formula.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The current position on the grid cannot be implied.',
         mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'Formula must be an implication or a double implication.',
      mtWarning, [mbOK], 0
    );
  end end;//if
end;

function TStringSentence.DecodeBelonging(i : Integer) : String;
  var
    j, k, p : Integer;
    Nk, Np, Gp : Integer;
    St : String;
begin
  Result := '';
  if Sentence[i] = Sapa then begin
    if Sentence[i + 1] = Spoi then begin
      k := FirstPosAfter(i + 1);
      if Sentence[k] = Sgen then begin
        j := FirstPosAfter(i);
        Nk := GetNumberStay(i + 2);
        St := '';
        p := k + 1;
        while p < j do begin
          if Sentence[p] = Spoi then begin
            Gp := GetQuantifier(p);
            Inc(p);
            Np := GetNumber(p);
            if                Gp < k then begin
              St := St + Spoi + IntToStr(Np - 1);
            end else begin if Gp = k then begin
              St := St + Spoi + IntToStr(Nk + Np - 1);
            end else begin // GQ > k
              St := St + Spoi + IntToStr(Np);
            end end;
          end else begin
            St := St + Sentence[p];
            Inc(p);
          end;//if
        end;//while
        Result :=
          Copy(Sentence, 1, i - 1) +
          Sand + Sset + Spoi + IntToStr(Nk) +
          St +
          Copy(Sentence, j, Len - j + 1)
        ;
      end;//if
    end;//if
  end;//if
end;

function TStringSentence.ClassGeneratorExplanation(i : Integer) : String;
// i trebuie sa fie pe un Sgen.
  var
    s, t : Integer;
    q, n, Gq : Integer;
    LQ, LI : Integer;
    StK, StS : String;
begin
  Result := '';
  if Sentence[i] = Sgen then begin
    s := FirstFormulaAncestor(i);
    t := FirstPosAfter(s);
    StK := '';
    StS := '';
    n := FirstPosAfter(i);
    q := i;
    while q < n do begin
      if Sentence[q] = Spoi then begin
        Gq := GetQuantifier(q);
        if                Gq < i then begin  // extern
          LQ := QuantifierParentsNumber(Gq, s);
          LI := QuantifierParentsNumber(i, q);
          StK := StK + Spoi + IntToStr(LQ + LI + 1);
          StS := StS + Spoi + IntToStr(LQ + LI);
          q := FirstPosAfter(q);
        end else begin if Gq = i then begin
          LI := QuantifierParentsNumber(i, q);
          StK := StK + Spoi + IntToStr(LI);
          StS := StS + Spoi + IntToStr(LI);
          q := FirstPosAfter(q);
        end else begin
          Inc(q);
          Result := Result + Spoi + IntToStr(GetNumber(q));
        end end;//if
      end else begin
        StK := StK + Sentence[q];
        if q > i then begin
          StS := StS + Sentence[q];
        end;//if
        Inc(q);
      end;//if
    end;//while
    Result :=
      Copy(Sentence, 1, s - 1) +
      Sand +
      Copy(Sentence, s, t - s) +
      Suni + Stru +
      Sdou +
      Sapa + Spoi + '1' + StK +
      Sand + Sset + Spoi + '1' + StS +
      Copy(Sentence, t, Len - t + 1)
    ;
  end else begin
    MessageDlg(
      'The current position on the grid must be a class generator.',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.ClassGeneratorToForm(i : Integer) : String;
// Transforma apartenenta la un generator de clase intr-o forma
  var
    a, j, n : Integer;
    St : String;
begin
  if Sentence[i] = Sapa then begin
    a := i;
    i := i + 1;
    j := FirstPosAfter(i);
    n := FirstPosAfter(a);
    if Sentence[j] = Sgen then begin
      St :=
        Copy(Sentence, 1, a - 1) +
        Sand +
        Sset + Copy(Sentence, i, j - i) +
        Suni + Stru + Copy(Sentence, j + 1, n - j - 1) +
        Copy(Sentence, n, Len - n + 1)
      ;
      SetSentence(St);
      Inc(i);
      Inc(j);
      Result := KernelParticularization(i, j);
    end else begin
      MessageDlg(
        'The second argument of the belonging must be a class generator.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The current position on the grid must be a belonging.',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.FormToClassGenerator(i : Integer) : String;
  var
    k, n, p, x : Integer;
    Gx, Gk, Nk : Integer;
begin
  Result := '';
  if Sentence[i] = Sand then begin
    if Sentence[i + 1] = Sset then begin
      x := i + 2;
      p := FirstPosAfter(x);
      n := FirstPosAfter(p);
      Result :=
        Copy(Sentence, 1, i - 1) +
        Sapa + Copy(Sentence, x, p - x) +
        Sgen
      ;
      k := p;
      while k < n do begin
        if Sentence[k] = Spoi then begin
          Gk := GetQuantifier(k);
          if Gk < p then begin  // extern
            if Sentence[x] = Spoi then begin
              if GetQuantifier(x) = Gk then begin
                Nk := QuantifierParentsNumber(p, k);
                Result := Result + Spoi + IntToStr(Nk + 1);
                k := FirstPosAfter(k);
              end else begin
                Inc(k);
                Nk := GetNumber(k);
                Result := Result + Spoi + IntToStr(Nk + 1);
              end;//if
            end else begin
              Inc(k);
              Nk := GetNumber(k);
              Result := Result + Spoi + IntToStr(Nk + 1);
            end;//if
          end else begin
            Inc(k);
            Nk := GetNumber(k);
            Result := Result + Spoi + IntToStr(Nk);
          end;//if
        end else begin if Sentence[k] in ['(', Sgen] then begin
          if SameExpression(x, k) then begin
            Nk := QuantifierParentsNumber(p, k);
            Result := Result + Spoi + IntToStr(Nk + 1);
            k := FirstPosAfter(k);
          end else begin
            Result := Result + Sentence[k];
            Inc(k);
          end;//if
        end else begin
          Result := Result + Sentence[k];
          Inc(k);
        end end;//if
      end;//while
      Result :=
        Result +
        Copy(Sentence, n, Len - n + 1)
      ;
    end else begin
      MessageDlg(
        'The first argument of the conjunction must be the set operator.',
        mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'The current position on the grid must be a conjunction.',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.EncodeBelonging(i : Integer) : String;
  var
    j, k, p : Integer;
    Gk, Gp, Nk, Np  : integer;
    St : String;
begin
  Result := '';
  if Sentence[i] = Sand then begin
    if Sentence[i + 1] = Sset then begin
      if Sentence[i + 2] = Spoi then begin
        Gk := GetQuantifier(i + 2);
        k := FirstPosAfter(i + 1);
        j := FirstPosAfter(i);
        Nk := GetNumberStay(i + 3);
        St := '';
        p := k;
        while p < j do begin
          if Sentence[p] = Spoi then begin
            Gp := GetQuantifier(p);
            Inc(p);
            Np := GetNumber(p);
            if Gp < k then begin
              if Gp = Gk then begin
                St := St + Spoi + IntToStr(Np - Nk + 1);
              end else begin
                St := St + Spoi + IntToStr(Np + 1);
              end;//if
            end else begin
              St := St + Spoi + IntToStr(Np);
            end;//if
          end else begin
            St := St + Sentence[p];
            Inc(p);
          end;//if
        end;//while
        Result :=
          Copy(Sentence, 1, i - 1) +
          Sapa + Spoi + IntToStr(Nk) +
          Sgen + St +
          Copy(Sentence, j, Len - j + 1)
        ;
      end;//if
    end;//if
  end;//if
end;

function TStringSentence.SatisfyParams(I1, I2 : String) : Boolean;
  var
    p1, q1, r1, s1 : Boolean;
    p2, q2, r2, s2 : Boolean;
begin
  p1 := (Pos('p', I1) > 0);
  q1 := (Pos('q', I1) > 0);
  r1 := (Pos('r', I1) > 0);
  s1 := (Pos('s', I1) > 0);
  p2 := (Pos('p', I2) > 0);
  q2 := (Pos('q', I2) > 0);
  r2 := (Pos('r', I2) > 0);
  s2 := (Pos('s', I2) > 0);
  Result :=
    ((not p2) or p1)
    and ((not q2) or q1)
    and ((not r2) or r1)
    and ((not s2) or s1)
  ;
end;

procedure TStringSentence.SetSentenceFromDatabase(Sentence : Integer);
// Incarca o sentinta din baza de date (Details) in StringSentence.
begin
  SetSentence(HauptF.GetSentenceFromDatabase(Sentence));
end;

procedure TStringSentence.WriteDetail(
  Sent, Detail : Integer;
  Operation : String;
  Link : Integer
);
begin
  HauptF.DetailsIQ.ParamByName('Sentence').Value := Sent;
  HauptF.DetailsIQ.ParamByName('Detail').Value := Detail;
  if Operation = Spoi then begin
    HauptF.DetailsIQ.ParamByName('Operation').Value := SLLL;
  end else begin
    HauptF.DetailsIQ.ParamByName('Operation').Value := Operation;
  end;//if
  HauptF.DetailsIQ.ParamByName('Link').Value := Link;
  HauptF.DetailsIQ.ExecSQL;
end;

procedure TStringSentence.SetSentenceToDatabase(Sent : Integer);
// Sentence trebuie incarcata.
// Scrie in Details
  var
    Ch : Char;
    Operation : String;
    i, Detail, k, Link : Integer;
begin
  HauptF.SentencesDQ.ParamByName('Sentence').Value := Sent;
  HauptF.SentencesDQ.ExecSQL;
  i := 1;
  Detail := 1;
  while i <= Len do begin
    Ch := Sentence[i];
    if                Ch = Spoi then begin
      Operation := Ch;
      Inc(i);
      Link := GetNumber(i);
    end else begin if Ch = '(' then begin
      k := PosEx(')', Sentence, i + 1);
      Operation := Copy(Sentence, i + 1, k - i - 1);
      Link := 0;
      i := JumpOverNumber(k + 2);
    end else begin
      Operation := Ch;
      Link := 0;
      Inc(i);
    end end;//if
    WriteDetail(Sent, Detail, Operation, Link);
    Inc(Detail);
  end;//while
end;

procedure TStringSentence.SetSentenceToStep(Sent, Step : Integer);
// Sentence trebuie incarcata.
// Scrie in StepDetails
  var
    Ch : Char;
    Operation : String;
    i, Detail, k, Link : Integer;
begin
  i := 1;
  Detail := 1;
  while i <= Len do begin
    Ch := Sentence[i];
    if                Ch = Spoi then begin
      Operation := Ch;
      Inc(i);
      Link := GetNumber(i);
    end else begin if Ch = '(' then begin
      k := PosEx(')', Sentence, i + 1);
      Operation := Copy(Sentence, i + 1, k - i - 1);
      Link := 0;
      i := JumpOverNumber(k + 2);
    end else begin
      Operation := Ch;
      Link := 0;
      Inc(i);
    end end;//if
    HauptF.WriteStepDetail(
      Sent, Step, Detail,
      Operation,
      Link
    );
    Inc(Detail);
  end;//while
end;

function TStringSentence.InsertSentences(Sentence1, Sentence2 : String; i : Integer) : String;
  var
    n : Integer;
begin
  Result := '';
  SetSentence(Sentence2);
  //i := PosGridToString(i);
  if IsForm(i) then begin
    n := FirstPosAfter(i);
    Result :=
      Copy(Sentence, 1, i - 1) +
      Sand +
      Copy(Sentence, i, n - i) +
      Sentence1 +
      Copy(Sentence, n, Len - n + 1)
    ;
  end else begin
    MessageDlg(
      'The current position on the grid must be a form.',
      mtWarning, [mbOK], 0
    );
  end;//if
end;

function TStringSentence.ModusPonens(Sentence1, Sentence2 : String) : String;
  var
    Sent1, Sent2 : String;
    i : Integer;
begin
  Result := '';
  Sent1 := '';
  Sent2 := '';
  if Sentence2[1] = Simp then begin
    Sent1 := Sentence1;
    Sent2 := Sentence2;
  end else begin if Sentence1[1] = Simp then begin
    Sent1 := Sentence2;
    Sent2 := Sentence1;
  end else begin
    MessageDlg(
      'No modus ponens.',
      mtWarning, [mbOK], 0
    );
  end end;//if
  if Sent1 <> '' then begin
    SetSentence(Sent2);
    i := FirstPosAfter(2);
    if Sent1 = Copy(Sent2, 2, i - 2) then begin
      Result := Copy(Sent2, i, Len - i + 1);
    end;//if
  end;//if
end;

function TStringSentence.ExtractCondition(i : Integer) : String;
  var
    j : Integer;
    Op : Char;
    OK : Boolean;
    St : String;
begin
  Result := '';
  OK := True;
  if                Sentence[i] = Suni then begin
    Op := Simp;
  end else begin if Sentence[i] = Sexi then begin
    Op := Sand;
  end else begin
    MessageDlg('Select a quantifier.', mtWarning, [mbOK], 0);
    OK := False;
  end end;
  if OK then begin
    if                Sentence[i + 1] = Sand then begin
      j := FirstPosAfter(i + 2);
      St := Copy(Sentence, i + 2, j - i - 2);
      Result := Copy(Sentence, 1, i) + St + Op + Copy(Sentence, j, Len - j + 1);
    end else begin if Sentence[i + 1] <> Stru then begin
      j := i + 1;
      St := Stru;
      Result := Copy(Sentence, 1, i) + St + Op + Copy(Sentence, j, Len - j + 1);
    end else begin
      MessageDlg('The quantifier has no condition.', mtWarning, [mbOK], 0);
    end end;//if
  end;//if
end;

function TStringSentence.InsertCondition(i : Integer) : String;
  var
    j : Integer;
    Op : Char;
    OK : Boolean;
begin
  Result := '';
  OK := True;
  if                Sentence[i] = Suni then begin
    Op := Simp;
    j := FirstPosAfter(i + 1);
    if Sentence[j] <> Op then begin
      MessageDlg(
        'The second member of the qualifier must be an implication.',
        mtWarning, [mbOK], 0
      );
      OK := False;
    end;//if
  end else begin if Sentence[i] = Sexi then begin
    Op := Sand;
    j := FirstPosAfter(i + 1);
    if Sentence[j] <> Op then begin
      MessageDlg(
        'The second member of the qualifier must be a conjunction.',
        mtWarning, [mbOK], 0
      );
      OK := False;
    end;//if
  end else begin
    MessageDlg('Select a quantifier!', mtWarning, [mbOK], 0);
    OK := False;
  end end;
  if OK then begin
    if Copy(Sentence, i + 1, j - i - 1) <> Stru then begin
      Result :=
        Copy(Sentence, 1, i) +
        Sand +
        Copy(Sentence, i + 1, j - i - 1) +
        Copy(Sentence, j + 1, Len - j)
      ;
    end else begin
      Result := Copy(Sentence, 1, i) + Copy(Sentence, j + 1, Len - j);
    end;//if
  end;//if
end;

function TStringSentence.MoveRightNotOverQuant(i : Integer) : String;
  var
    j : Integer;
    OK : Boolean;
begin
  Result := '';
  if Sentence[i] = Snot then begin
    Result := Copy(Sentence, 1, i - 1);
    Inc(i);
    OK := True;
    while OK and (i <= Len) do begin
      if                Sentence[i] = Suni then begin
        j := FirstPosAfter(i + 1);
        Result := Result + Sexi + Copy(Sentence, i + 1, j - i - 1);
        i := j;
      end else begin if Sentence[i] = Sexi then begin
        j := FirstPosAfter(i + 1);
        Result := Result + Suni + Copy(Sentence, i + 1, j - i - 1);
        i := j;
      end else begin
        OK := False;
      end end;//if
    end;//while
    Result := Result + Snot + Copy(Sentence, i , Len - 1);
  end else begin
    MessageDlg('Select a negation!', mtWarning, [mbOK], 0);
  end;//if
end;

function TStringSentence.Negation(i : Integer) : String;
  var
    Ch : Char;
    j, k : Integer;
    p, q : String;
begin
  Result := '';
  if Sentence[i] = Snot then begin
    Ch := Sentence[i + 1];
    if                Ch = Snot then begin
      Result := Copy(Sentence, 1, i - 1) + Copy(Sentence, i + 2, Len - i - 1);
    end else begin if Ch = Sand then begin
      j := FirstPosAfter(i + 2);
      k := FirstPosAfter(j);
      p := Copy(Sentence, i + 2, j - i - 2);
      q := Copy(Sentence, j, k - j);
      Result :=
        Copy(Sentence, 1, i - 1) + Sorx +
        Snot + p +
        Snot + q +
        Copy(Sentence, k, Len - k + 1)
      ;
    end else begin if Ch = Sorx then begin
      j := FirstPosAfter(i + 2);
      k := FirstPosAfter(j);
      p := Copy(Sentence, i + 2, j - i - 2);
      q := Copy(Sentence, j, k - j);
      Result :=
        Copy(Sentence, 1, i - 1) + Sand +
        Snot + p +
        Snot + q +
        Copy(Sentence, k, Len - k + 1)
      ;
    end else begin if Ch = Simp then begin
      j := FirstPosAfter(i + 2);
      k := FirstPosAfter(j);
      p := Copy(Sentence, i + 2, j - i - 2);
      q := Copy(Sentence, j, k - j);
      Result :=
        Copy(Sentence, 1, i - 1) + Sand +
        p +
        Snot + q +
        Copy(Sentence, k, Len - k + 1)
      ;
    end else begin if Ch = Sdou then begin
      j := FirstPosAfter(i + 2);
      k := FirstPosAfter(j);
      p := Copy(Sentence, i + 2, j - i - 2);
      q := Copy(Sentence, j, k - j);
      Result :=
        Copy(Sentence, 1, i - 1) + Sorx +
        Sand + p + Snot + q +
        Sand + Snot + p + q +
        Copy(Sentence, k, Len - k + 1)
      ;
    end else begin if Ch in [Suni, Sexi] then begin
      Result := MoveRightNotOverQuant(i);
    end else begin
      MessageDlg('Negation it is not possible!', mtWarning, [mbOK], 0);
    end end end end end end;//if
  end else begin
    MessageDlg('Select a negation!', mtWarning, [mbOK], 0);
  end;//if
end;

function TStringSentence.IsAContradiction : Boolean;
begin
  Result := (Sentence = Snot + Stru);
end;

function TStringSentence.Generalization(i, j : Integer; Quant : Char) : String;
// i trebuie sa fie pe o form.
// j trebuie sa fie pe un term.
// i trebuie sa fie un stramos al lui j.
// j nu trebuie sa aibe referente in i.
  var
    k, m, n : Integer;
    Gk, Nk : Integer;
    OK : Boolean;
begin
  Result := '';
  OK := False;
  if IsForm(i) then begin
    if IsTerm(j) then begin
      if Ancestor(i, j) then begin
        OK := True;
      end else begin
        MessageDlg(
          'The selected form must be an ancestor of the selected term.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'First select a form and then select a term in this form.',
         mtWarning, [mbOK], 0
      );
    end;//if
  end else begin
    MessageDlg(
      'First select a form and then select a term in this form.',
       mtWarning, [mbOK], 0
    );
  end;
  if OK then begin
    n := FirstPosAfter(j);
    k := j;
    while OK and (k < n) do begin
      if Sentence[k] = Spoi then begin
        Gk := GetQuantifier(k);
        if (Gk < i) or (j <= Gk) then begin
          k := FirstPosAfter(k);
        end else begin
          OK := False;
        end;//if
      end else begin
        Inc(k);
      end;//if
    end;//while
    if not OK then begin
      MessageDlg(
        'The selected term has references to the selected form.',
         mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
  if OK then begin
    m := FirstPosAfter(i);
    Result :=
      Copy(Sentence, 1, i - 1) +
      Quant + Seqa + Spoi + '1' +
      AdaptExpressionToPos(j, i, 1)
    ;
    k := i;
    while k < m do begin
      if IsTerm(k) then begin
        if                SameExpression(j, k) then begin
          Nk := QuantifierParentsNumber(i, k) + 1;
          Result := Result + Spoi + IntToStr(Nk);
          k := FirstPosAfter(k);
        end else begin if Sentence[k] = Spoi then begin
          Gk := GetQuantifier(k);
          Inc(k);
          Nk := GetNumber(k);
          if Gk < i then begin
            Result := Result + Spoi + IntToStr(Nk + 1);
          end else begin
            Result := Result + Spoi + IntToStr(Nk);
          end;//if
        end else begin
          Result := Result + Sentence[k];
          Inc(k);
        end end;//if
      end else begin
        Result := Result + Sentence[k];
        Inc(k);
      end;//if
    end;//while
    Result := Result + Copy(Sentence, m, Len - m + 1);
  end;//if
end;

function TStringSentence.ExtractHypothesis : String;
  var
    Pref : TPref;
    p, q, r, s : Integer;
begin
  Result := '';
  Pref := Prefix(False, 1);
  s := Pref.SecArgOfLast;
  if                Sentence[s] = Simp then begin
    p := s + 1;
    q := FirstPosAfter(p);
    Result := Copy(Sentence, 1, q - 1) + Stru;
  end else begin if Sentence[s] = Sdou then begin
    p := s + 1;
    q := FirstPosAfter(p);
    r := FirstPosAfter(q);
    Result :=
      Copy(Sentence, 1, s - 1) +
      Sand +
      Simp + Copy(Sentence, p, q - p) + Stru +
      Simp + Copy(Sentence, q, r - q) + Stru
    ;
  end else begin
    Result := Copy(Sentence, 1, s - 1) + Stru;
  end end;//if
end;

function TStringSentence.ExtractConclusion : String;
// Tautologize
  var
    Pref : TPref;
    d, p, q, r, s, t : Integer;
begin
  Result := '';
  Pref := Prefix(False, 1);
  s := Pref.SecArgOfLast;
  p := s + 1;
  if                Sentence[s] = Simp then begin
    d := FirstPosAfter(p);
    if Sentence[d] = Sdou then begin
      q := d + 1;
      r := FirstPosAfter(q);
      t := FirstPosAfter(r);
      Result :=
        Copy(Sentence, 1, d - 1) +
        Sand +
        Sdou + Copy(Sentence, q, r - q) + Copy(Sentence, q, r - q) +
        Sdou + Copy(Sentence, r, t - r) + Copy(Sentence, r, t - r)
      ;
    end else begin
      q := FirstPosAfter(p);
      r := FirstPosAfter(q);
      Result :=
        Copy(Sentence, 1, s) +
        Copy(Sentence, p, q - p) +
        Sdou + Copy(Sentence, q, r - q) + Copy(Sentence, q, r - q)
      ;
    end;//if
  end else begin
    t := FirstPosAfter(s);
    Result :=
      Copy(Sentence, 1, s - 1) +
      Sdou + Copy(Sentence, s, t - s) + Copy(Sentence, s, t - s)
    ;
  end;//if
end;

// pentru reprezentarea ca tree
function TStringSentence.MakeNode(Tree : TTreeView; Node : TTreeNode; Text : String) : TTreeNode;
begin
  if Node = Nil then begin
    Result := Tree.Items.Add(Node, Text);
  end else begin
    Result := Tree.Items.AddChild(Node, Text);
  end;//if
end;

// scrie Sentence in Details
end.

