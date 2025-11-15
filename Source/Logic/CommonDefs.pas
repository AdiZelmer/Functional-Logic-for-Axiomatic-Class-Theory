unit CommonDefs;
interface

const
  Suni = 'A';
  Sexi = 'E';
  Sand = 'X';
  Sorx = 'V';
  Sdou = 'D';
  Simp = 'C';
  Snot = 'N';
  Stru = 'T';
  Sapa = '@';
  Seqa = '=';
  Sset = 'S';

  Sgen = 'K';

  Slnk = '+';
  Smin = '-';
  Spoi = Char($5E);

  Ssent = 's';
  Sterm = 't';

  Sblank = ' ';
  SLLL = 'L';

  AllOperations = [
    Suni, Sexi, Sand, Sorx, Sdou, Simp, Snot, Stru, Sapa, Seqa, Sset, Sgen, SLLL
  ];
  Operators = [Suni, Sexi, Sand, Sorx, Sdou, Simp, Snot, Stru];
  PredRelatins = [Sapa, Seqa, Sset];

  MessageDeleteQuantifier =
    'You must point to a quantifier. You can delete the quantifier if:' + #13#10 +
    '   ' + #13#10 +
    '1. the condition of the quantifier is True.' + #13#10 +
    '2. the condition of the quantifier is an equality having as first argument' + #13#10 +
    '   a reference to the quantifier and the second argument having' + #13#10 +
    '   no references to the quantifier.' + #13#10 +
    '3. the quantifier is existential and implicable.' + #13#10 +
    '4. the quantifier has a condition and you have loaded in the proof' + #13#10 +
    '   an existence axiom or theorem for this condition.'
  ;
  BadChars = ['A', 'B', 'E'..'M', 'O'..'S', 'U', 'Y', 'Z', 'a'..'o', 't'..'z'];

type
  TCell = record
    Col : Integer;
    Row : Integer;
  end;

  TOper = record
    Operation : String;
    OPut : Char;
    Number : Integer;
  end;

function LogicV(x, y : Boolean) : Boolean;
function LogicX(x, y : Boolean) : Boolean;
function LogicD(x, y : Boolean) : Boolean;
function LogicC(x, y : Boolean) : Boolean;
function LogicN(x : Boolean) : Boolean;
function FirstDifferentPosition(St1, St2 : String) : Integer;

implementation

function LogicV(x, y : Boolean) : Boolean;
begin
  if x or y then begin
    Result := True;
  end else begin
    Result := False;
  end;//if
end;

function LogicX(x, y : Boolean) : Boolean;
begin
  if x and y then begin
    Result := True;
  end else begin
    Result := False;
  end;//if
end;

function LogicD(x, y : Boolean) : Boolean;
begin
  if x = y then begin
    Result := True;
  end else begin
    Result := False;
  end;//if
end;

function LogicC(x, y : Boolean) : Boolean;
begin
  if x and not(y) then begin
    Result := False;
  end else begin
    Result := True;
  end;//if
end;

function LogicN(x : Boolean) : Boolean;
begin
  Result := not(x);
end;

function FirstDifferentPosition(St1, St2 : String) : Integer;
// -1 lungimi diferite
// 0 egale
// 1, 2, 3, ... pozitia unde difera
  var
    nr, i : Integer;
begin
  Result := 0;
  nr := Length(St1);
  if nr = Length(St2) then begin
    i := 1;
    while (Result = 0) and (i <= nr) do begin
      if St1[i] = St2[i] then begin
        Inc(i);
      end else begin
        Result := i;
      end;//if
    end;//while
  end else begin
    Result := -1;
  end;//if
end;

end.
