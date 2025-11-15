unit GridSentence;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, IB_Components, IB_Access, IBODataset,
  Connection, Data.DB, AZExtender, CommonDefs, Save;

type
  TGridSentence = class(TObject)
  private
    Grid : TStringGrid;
    SCol : Integer;
    SRow : Integer;
    Marcator : String;

    uniB : TSpeedButton;
    exiB : TSpeedButton;
    orxB : TSpeedButton;
    andB : TSpeedButton;
    douB : TSpeedButton;
    impB : TSpeedButton;
    notB : TSpeedButton;
    truB : TSpeedButton;
    apaB : TSpeedButton;
    eqaB : TSpeedButton;
    setB : TSpeedButton;
    genB : TSpeedButton;
    DefineB : TSpeedButton;
    DeleteB : TSpeedButton;
    SaveB : TSpeedButton;

    DatabaseLogic : IDatabaseLogic;

    function ColIsEmpty(ACol : Integer) : Boolean;
    function RowIsEmpty(ARow : Integer) : Boolean;
    function FirstEmptyCol : Integer;
    function FirstEmptyRow : Integer;
    procedure GrowGrid(DCol, DRow : Integer);
    function FirstColAfter(ACol, ARow : Integer) : Integer;
    procedure EmptyAfter(ACol, ARow : Integer);
    procedure Delete(ACol, ARow : Integer);
    function SecondArgOfLastUni : TCell;
    function DecodeSt(St : String) : TOper;
    function GetLink(St : String) : Integer;
    function OperationExists(Op : String) : Boolean;
    procedure MoveRightCol(ACol, Pos : Integer);
    procedure MoveRightAfterCol(ACol, Pos : Integer);
    procedure SetFocusPosition(ACol, ARow : Integer);
    procedure DefineRelFun;
    function UpIsEmpty(ACol, ARow : Integer) : Boolean;
    function FindQuantifier(ACol, ARow : Integer) : Integer;
    function FindTerm(ACol, ARow : Integer) : Integer;
    function FindPlus(ACol, ARow : Integer) : Integer;
    procedure SetLink(ACol, ARow : Integer);
    function SentenceIsReady : Boolean;
    function Parent(Cell : TCell) : TCell;
    function FindRow(ACol : Integer) : Integer;
    procedure SaveSentence;

    function InMarcator(ACol : Integer) : Boolean;
    procedure Marcate1(ACol, ARow : Integer);
    procedure Marcate2(ACol, ARow : Integer);
    procedure MarcateLinks;
    procedure MarcateQuantifier;
    procedure MarcateRelFun;
    procedure Demarcate;

    procedure SetButton(
      Button : TSpeedButton;
      Caption : String;
      Hint : String;
      OnClick : TNotifyEvent
    );
    procedure SetButtons;

    function NextOperation(Cell : TCell) : TCell;

    procedure uniBClick(Sender: TObject);
    procedure exiBClick(Sender: TObject);
    procedure orxBClick(Sender: TObject);
    procedure andBClick(Sender: TObject);
    procedure douBClick(Sender: TObject);
    procedure impBClick(Sender: TObject);
    procedure notBClick(Sender: TObject);
    procedure truBClick(Sender: TObject);
    procedure apaBClick(Sender: TObject);
    procedure eqaBClick(Sender: TObject);
    procedure setBClick(Sender: TObject);
    procedure genBClick(Sender: TObject);
    procedure DefineBClick(Sender: TObject);
    procedure DeleteBClick(Sender: TObject);
    procedure SaveBClick(Sender: TObject);
  public
    procedure DefineComponents(
      StringGrid : TStringGrid;
      uniB, exiB, orxB, andB, douB, impB, notB, truB, apaB, eqaB, setB, genB : TSpeedButton;
      DefineB, DeleteB, SaveB : TSpeedButton;
      DatabaseLogic : IDatabaseLogic
    );
    procedure GridDrawCell(
      Sender : TObject; ACol, ARow : Integer;
      Rect : TRect; State : TGridDrawState
    );
    procedure GridSelectCell(
      Sender : TObject; ACol, ARow : Integer;
      var CanSelect : Boolean
    );
    procedure WriteOperation(
      Operation, Title : String;
      IPut, OPut : Char;
      Number : Integer
    );
    function WriteSentence(
      Title, Description : String;
      Kind : Char;
      Operation : String
    ) : Integer;
    procedure WriteDetail(
      Sentence, Detail : Integer;
      Operation : String;
      Link : Integer
    );
    function SentenceToString : String;
    function GetQuantifier(Cell : TCell) : TCell;
    procedure ShowLinksOfQuantifier(Cell : TCell);
    function QuantifierIsUsed(Cell : TCell) : Boolean;
    function SecondArgOfLastQuantifier : TCell;
    function SentenceIsQQXqA : Boolean;
  end;

implementation

const
  DeltaL = 6;
  DeltaT = 3;

procedure TGridSentence.SetButton(
  Button : TSpeedButton;
  Caption : String;
  Hint : String;
  OnClick : TNotifyEvent
);
begin
  if Assigned(Button) then begin
    Button.Caption := Caption;
    Button.Hint := Hint;
    Button.ShowHint := True;
    Button.OnClick := OnClick;
  end;//if
end;

procedure TGridSentence.DefineComponents(
  StringGrid : TStringGrid;
  uniB, exiB, orxB, andB, douB, impB, notB, truB, apaB, eqaB, setB, genB : TSpeedButton;
  DefineB, DeleteB, SaveB : TSpeedButton;
  DatabaseLogic : IDatabaseLogic
);
begin
  Grid := StringGrid;
  Self.uniB := uniB;
  Self.exiB := exiB;
  Self.orxB := orxB;
  Self.andB := andB;
  Self.douB := douB;
  Self.impB := impB;
  Self.notB := notB;
  Self.truB := truB;
  Self.apaB := apaB;
  Self.eqaB := eqaB;
  Self.setB := setB;
  Self.genB := genB;
  Self.DefineB := DefineB;
  Self.DeleteB := DeleteB;
  Self.SaveB := SaveB;
  Self.DatabaseLogic := DatabaseLogic;

  SCol := 0;
  SRow := 0;

  if Assigned(Grid) then begin
    Grid.Cells[SCol, SRow] := ' ' + Ssent;
    Grid.OnDrawCell := GridDrawCell;
    Grid.OnSelectCell := GridSelectCell;
  end;//if

  SetButton(uniB, Suni, 'universal quantifier', uniBClick);
  SetButton(exiB, Sexi, 'existential quantifier', exiBClick);
  SetButton(orxB, Sorx, 'or', orxBClick);
  SetButton(andB, Sand, 'and', andBClick);
  SetButton(douB, Sdou, 'double implication', douBClick);
  SetButton(impB, Simp, 'implication', impBClick);
  SetButton(notB, Snot, 'negation', notBClick);
  SetButton(truB, Stru, 'true', truBClick);
  SetButton(apaB, Sapa, 'The first class belongs to the second.', apaBClick);
  SetButton(eqaB, Seqa, 'equality', eqaBClick);
  SetButton(setB, Sset, 'is a set', setBClick);
  SetButton(genB, Sgen, 'class generator', genBClick);
  SetButton(DefineB, 'Define', 'Define a relation or a function.', DefineBClick);
  SetButton(DeleteB, 'Delete', 'Delete a sentence.', DeleteBClick);
  SetButton(SaveB, 'Save', 'Save the sentence.', SaveBClick);

  SetButtons;
end;

procedure TGridSentence.GridDrawCell(
  Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState
);
  var
    St : String;
begin
  St := Grid.Cells[ACol, ARow];
  if                St = ' ' + Ssent then begin
    Grid.Canvas.Brush.Color := clAqua;
    Rect.Left := Rect.Left - 4;
    Grid.Canvas.FillRect(Rect);
  end else begin if St = ' ' + Sterm then begin
    Grid.Canvas.Brush.Color := clYellow;
    Rect.Left := Rect.Left - 4;
    Grid.Canvas.FillRect(Rect);
  end else begin if St <> '' then begin
    if                St[1] = Spoi then begin
      if InMarcator(ACol) then begin
        Grid.Canvas.Brush.Color := clMoneyGreen;
      end else begin
        Grid.Canvas.Brush.Color := Grid.Color;
      end;//if
    end else begin if St[1] = '+' then begin
      Grid.Canvas.Brush.Color := Grid.Color;
    end else begin
      if InMarcator(ACol) then begin
        Grid.Canvas.Brush.Color := clSkyBlue;
      end else begin
        Grid.Canvas.Brush.Color := Grid.Color;
      end;//if
    end end;//if
    Rect.Left := Rect.Left - 4;
    Grid.Canvas.FillRect(Rect);
    Grid.Canvas.TextOut(
      Rect.Left + DeltaL, Rect.Top + DeltaT,
      Grid.Cells[ACol, ARow][1]
    );
  end end end;//if
end;

procedure TGridSentence.GridSelectCell(
  Sender : TObject; ACol, ARow : Integer;
  var CanSelect : Boolean
);
begin
  SCol := ACol;
  SRow := ARow;
  SetLink(ACol, ARow);
  SetButtons;
end;

function TGridSentence.ColIsEmpty(ACol : Integer) : Boolean;
  var
    ARow : Integer;
begin
  Result := True;
  ARow := 0;
  while Result and (ARow < Grid.RowCount) do begin
    Result := (Grid.Cells[ACol, ARow] = '');
    Inc(ARow);
  end;//while
end;

function TGridSentence.RowIsEmpty(ARow : Integer) : Boolean;
  var
    ACol : Integer;
begin
  Result := True;
  ACol := 0;
  while Result and (ACol < Grid.ColCount) do begin
    Result := (Grid.Cells[ACol, ARow] = '');
    Inc(ACol);
  end;//while
end;

function TGridSentence.FirstEmptyCol : Integer;
  var
    found : Boolean;
begin
  Result := 0;
  found := False;
  while (not found) and (Result < Grid.ColCount) do begin
    if not ColIsEmpty(Result) then begin
      Inc(Result);
    end else begin
      found := True;
    end;//if
  end;//while
end;

function TGridSentence.FirstEmptyRow : Integer;
  var
    found : Boolean;
begin
  Result := 0;
  found := False;
  while (not found) and (Result < Grid.RowCount) do begin
    if not RowIsEmpty(Result) then begin
      Inc(Result);
    end else begin
      found := True;
    end;//if
  end;//while
end;

procedure TGridSentence.GrowGrid(DCol, DRow : Integer);
  var
    FCol : Integer;
    FRow : Integer;
begin
  FCol := FirstEmptyCol;
  if FCol + DCol > Grid.ColCount then begin
    Grid.ColCount := FCol + DCol;
  end;//if
  FRow := FirstEmptyRow;
  if FRow + DRow > Grid.RowCount then begin
    Grid.RowCount := FRow + DRow;
  end;//if
end;

function TGridSentence.DecodeSt(St : String) : TOper;
  var
    nr, i : Integer;
    Ch : Char;
begin
  Result.Operation := '';
  Result.OPut := Ssent;
  Result.Number := 0;
  nr := Length(St);
  if                nr = 1 then begin
    Ch := St[1];
    if Ch in [Suni, Sexi, Sorx, Sand, Sdou, Simp] then begin
      Result.Operation := St;
      Result.OPut := Ssent;
      Result.Number := 2;
    end else begin if Ch in [Sapa, Seqa] then begin
      Result.Operation := St;
      Result.OPut := Ssent;
      Result.Number := 2;
    end else begin if Ch = Sset then begin
      Result.Operation := St;
      Result.OPut := Ssent;
      Result.Number := 1;
    end else begin if Ch = Snot then begin
      Result.Operation := St;
      Result.OPut := Ssent;
      Result.Number := 1;
    end else begin if Ch = Stru then begin
      Result.Operation := St;
      Result.OPut := Ssent;
      Result.Number := 0;
    end else begin if Ch = Sgen then begin
      Result.Operation := St;
      Result.OPut := Sterm;
      Result.Number := 1;
    end end end end end end;//if
  end else begin if nr = 2 then begin
    if                St = ' ' + Ssent then begin
      Result.Operation := ' ';
      Result.OPut := Ssent;
      Result.Number := 0;
    end else begin            // St = ' ' + Sterm
      Result.Operation := ' ';
      Result.OPut := Sterm;
      Result.Number := 0;
    end;//if
  end else begin if nr >= 3 then begin
    if St[1] = Spoi then begin
      Result.Operation := Spoi;
      Result.OPut := Sterm;
      Result.Number := 0;
    end else begin
      i := nr;
      while (St[i] >= '0') and (St[i] <= '9') do begin
        Dec(i);
      end;//while
      Result.Operation := Copy(St, 1, i - 1);
      Result.OPut := St[i];
      Result.Number := StrToInt(Copy(St, i + 1, nr - i));
    end;//if
  end end end;
end;

function TGridSentence.GetLink(St : String) : Integer;
// Se aplica numai la Spoi ca sa scoata valoarea linkului.
// Prin DecodeSt nu obtinem ce trebuie.
begin
  Result := StrToInt(Copy(St, 3, Length(St) - 2));
end;

function TGridSentence.FirstColAfter(ACol, ARow : Integer) : Integer;
  var
    St : String;
    Col1, Row1 : Integer;
    Col2, Row2 : Integer;
    Oper : TOper;
    Number, i : Integer;
    MCol : Integer;
begin
  Result := -1;
  St := Grid.Cells[ACol, ARow];
  if (St = Suni) or (St = Sexi) then begin
    Col1 := ACol + 1;
    Row1 := ARow + 1;
    Col2 := FirstColAfter(Col1, Row1);
    Row2 := Row1;
    Result := FirstColAfter(Col2, Row2);
  end else begin if St = Sgen then begin
    Col1 := ACol + 1;
    Row1 := ARow + 1;
    Result := FirstColAfter(Col1, Row1);
  end else begin
    Oper := DecodeSt(St);
    Number := Oper.Number;
    if Number = 0 then begin
      Result := ACol + 1;
    end else begin
      MCol := ACol + 1;
      for i := 1 to Number do begin
        MCol := FirstColAfter(MCol, ARow);
      end;//for
      Result := MCol;
    end;
  end end;//if
end;

procedure TGridSentence.EmptyAfter(ACol, ARow : Integer);
  var
    FCol, ERow, MCol, MRow : Integer;
begin
  FCol := FirstColAfter(ACol, ARow);
  ERow := FirstEmptyRow;
  for MCol := ACol + 1 to FCol - 1 do begin
    for MRow := 0 to ERow - 1 do begin
      Grid.Cells[MCol, MRow] := '';
    end;//for
  end;//for
end;

procedure TGridSentence.Delete(ACol, ARow : Integer);
  var
    ECol, FCol, MCol, MRow, Pos : Integer;
    St : String;
    nr : Integer;
    Ch : Char;
    Oper : TOper;
begin
  ECol := FirstEmptyCol;
  FCol := FirstColAfter(ACol, ARow);
  Pos := FCol - ACol - 1;
  EmptyAfter(ACol, ARow);
  for MCol := FCol to ECol - 1 do begin
    MoveRightCol(MCol, -Pos);
  end;//for
  St := Grid.Cells[ACol, ARow];
  Ch := St[1];
  nr := Length(St);
  if nr = 1 then begin
    if Ch = Sgen then begin
      Grid.Cells[ACol, ARow] := ' ' + Sterm;
    end else begin
      Grid.Cells[ACol, ARow] := ' ' + Ssent;
    end;
  end else begin if nr >= 3 then begin
    if St[1] = Spoi then begin
      for MRow := 0 to FirstEmptyRow - 1 do begin
        Grid.Cells[ACol, MRow] := '';
      end;//for
      Grid.Cells[ACol, ARow] := ' ' + Sterm;
    end else begin
      Oper := DecodeSt(St);
      for MRow := 0 to FirstEmptyRow - 1 do begin
        Grid.Cells[ACol, MRow] := '';
      end;//for
      Grid.Cells[ACol, ARow] := ' ' + Oper.OPut;
    end;//if
  end end;//if
  SetButtons;
end;

function TGridSentence.SecondArgOfLastUni : TCell;
// Al doilea argument al rezultatului e si numarul de cuantificatori universali din Pre
  var
    ACol, ARow : Integer;
    OK : Boolean;
begin
  ACol := 0;
  ARow := 0;
  OK := True;
  while
    OK and
    (ACol < Grid.ColCount - 1)
    and (ARow < Grid.RowCount - 1)
  do begin
    if Grid.Cells[ACol, ARow] = Suni then begin
      Inc(ARow);
      ACol := FirstColAfter(ACol + 1, ARow);
    end else begin
      OK := False;
    end;
  end;//while
  Result.Col := ACol;
  Result.Row := ARow;
end;

function TGridSentence.SecondArgOfLastQuantifier : TCell;
// Al doilea argument al rezultatului e si numarul de cuantificatori din Prefix
  var
    ACol, ARow : Integer;
    OK : Boolean;
begin
  ACol := 0;
  ARow := 0;
  OK := True;
  while
    OK and
    (ACol < Grid.ColCount - 1)
    and (ARow < Grid.RowCount - 1)
  do begin
    if (Grid.Cells[ACol, ARow] = Suni) or (Grid.Cells[ACol, ARow] = Sexi) then begin
      Inc(ARow);
      ACol := FirstColAfter(ACol + 1, ARow);
    end else begin
      OK := False;
    end;
  end;//while
  Result.Col := ACol;
  Result.Row := ARow;
end;

function TGridSentence.SentenceIsQQXqA : Boolean;
  var
    Cell : TCell;
begin
  Result := False;
  Cell := SecondArgOfLastQuantifier;
  if Cell.Col > 0 then begin
    if Grid.Cells[Cell.Col, Cell.Row] = Sand then begin
      Cell.Col := Cell.Col + 1;
      Cell.Col := FirstColAfter(Cell.Col, Cell.Row);
      if Cell.Col > -1 then begin
        if Grid.Cells[Cell.Col, Cell.Row] = Suni then begin
          Result := True;
        end;//if
      end;//if
    end;//if
  end;//if
end;

{
  St := Grid.Cells[ACol, ARow]
  nr := Length(St)
  Daca nr = 0 atunci sunt casute nefolosite. Nu se face nimic.
  Daca nr = 1 atunci sunt operatii predefinite sau '^', '+'. Se tiparesc.
  Daca nr = 2 atunci pot fi numai ' ' + Ssent, ' ' + Sterm. Se coloreaza.
  Daca nr >= 3 atunci sunt relatii sau functii definite. Se poate scoate
    Operation, IPut, OPut, Number. Operation se tipareste in jos.
}

procedure TGridSentence.Demarcate;
  var
    i : Integer;
    Sub : String;
    MCol, MRow : Integer;
begin
  i := 1;
  Sub := '';
  while i <= Length(Marcator) do begin
    if (Marcator[i] >= '0') and (Marcator[i] <= '9') then begin
      Sub := Sub + Marcator[i];
    end else begin
      MCol := StrToInt(Sub);
      MRow := FindRow(MCol);
      if MRow > 0 then begin
        Grid.Cells[MCol, MRow] := Grid.Cells[MCol, MRow];
      end;//if
      Sub := '';
    end;//if
    Inc(i);
  end;//while
  Marcator := '';
end;

procedure TGridSentence.Marcate1(ACol, ARow : Integer);
begin
  Marcator := Marcator + IntToStr(ACol) + ';';
  Grid.Cells[ACol, ARow] := Grid.Cells[ACol, ARow];
end;

procedure TGridSentence.Marcate2(ACol, ARow : Integer);
begin
  Marcator := Marcator + IntToStr(ACol) + ';';
  Grid.Cells[ACol, ARow] := Grid.Cells[ACol, ARow];
  ACol := FirstColAfter(ACol, ARow);
  Marcator := Marcator + IntToStr(ACol) + ';';
  Grid.Cells[ACol, ARow] := Grid.Cells[ACol, ARow];
end;

procedure TGridSentence.MarcateLinks;
  var
    MCol, MRow : Integer;
    ECol : Integer;
    Cell : TCell;
begin
  MCol := SCol;
  ECol := FirstColAfter(SCol, SRow);
  while MCol < ECol do begin
    MRow := FindRow(MCol);
    if Grid.Cells[MCol, MRow][1] = Spoi then begin
      Cell.Col := MCol;
      Cell.Row := MRow;
      Cell := GetQuantifier(Cell);
      if SCol = Cell.Col then begin
        Marcate1(MCol, MRow);
      end;//if
    end;//if
    Inc(MCol);
  end;//for
end;

procedure TGridSentence.MarcateQuantifier;
  var
    St : String;
    MCol, MRow : Integer;
begin
  St := Grid.Cells[SCol, SRow];
  if Length(St) >= 3 then begin
    if St[1] = Spoi then begin
      MCol := SCol;
      MRow := SRow;
      MRow := FindPlus(MCol, MRow);
      MCol := FindQuantifier(MCol, MRow);
      Marcate1(MCol, MRow);
    end;//if
  end;//if
end;

procedure TGridSentence.MarcateRelFun;
// Se aplica numai la relatii sau functii definite
  var
    St : String;
    Oper : TOper;
    k : Integer;
    MCol, MRow : Integer;
begin
  St := Grid.Cells[SCol, SRow];
  Oper := DecodeSt(St);
  MCol := SCol + 1;
  MRow := SRow;
  for k := 1 to Oper.Number do begin
    Marcate1(MCol, MRow);
    MCol := FirstColAfter(MCol, MRow);
  end;//for
end;

procedure TGridSentence.SetButtons;
  var
    St : String;
    nr : Integer;
    Ch : Char;
    Cell : TCell;
begin
  Demarcate;
  if
    Assigned(uniB)
    and Assigned(exiB)
    and Assigned(orxB)
    and Assigned(andB)
    and Assigned(douB)
    and Assigned(impB)
    and Assigned(notB)
    and Assigned(truB)
    and Assigned(apaB)
    and Assigned(eqaB)
    and Assigned(setB)
    and Assigned(genB)
    and Assigned(DefineB)
    and Assigned(DeleteB)
    and Assigned(SaveB)
  then begin
    uniB.Enabled := False;
    exiB.Enabled := False;
    orxB.Enabled := False;
    andB.Enabled := False;
    douB.Enabled := False;
    impB.Enabled := False;
    notB.Enabled := False;
    truB.Enabled := False;
    apaB.Enabled := False;
    eqaB.Enabled := False;
    setB.Enabled := False;
    genB.Enabled := False;
    DefineB.Enabled := False;
    DeleteB.Enabled := False;
    St := Grid.Cells[SCol, SRow];
    nr := Length(St);
    if St = ' ' + Ssent then begin
      uniB.Enabled := True;
      exiB.Enabled := True;
      orxB.Enabled := True;
      andB.Enabled := True;
      douB.Enabled := True;
      impB.Enabled := True;
      notB.Enabled := True;
      truB.Enabled := True;
      apaB.Enabled := True;
      eqaB.Enabled := True;
      setB.Enabled := True;
      Cell := SecondArgOfLastUni;
      if Grid.Cells[Cell.Col, Cell.Row] = Sdou then begin
        if Cell.Col + 1 = SCol then begin
          DefineB.Enabled := True;
        end;//if
      end;//if
    end else begin if St = ' ' + Sterm then begin
      genB.Enabled := True;
      Cell := SecondArgOfLastUni;
      if Grid.Cells[Cell.Col, Cell.Row] = Seqa then begin
        if Cell.Col + 1 = SCol then begin
          DefineB.Enabled := True;
        end;//if
      end
    end else begin if nr = 1 then begin
      Ch := St[1];
      if                Ch in [Suni, Sexi] then begin
        uniB.Enabled := True;
        exiB.Enabled := True;
        DeleteB.Enabled := True;
        MarcateLinks;
        Marcate2(SCol + 1, SRow + 1);
      end else begin if Ch in [Sorx, Sand, SDou, Simp] then begin
        orxB.Enabled := True;
        andB.Enabled := True;
        douB.Enabled := True;
        impB.Enabled := True;
        DeleteB.Enabled := True;
        Marcate2(SCol + 1, SRow);
      end else begin if Ch = Snot then begin
        DeleteB.Enabled := True;
        Marcate1(SCol + 1, SRow);
      end else begin if Ch = Spoi then begin
        DeleteB.Enabled := True;
      end else begin if Ch = Sgen then begin
        DeleteB.Enabled := True;
        MarcateLinks;
        Marcate1(SCol + 1, SRow + 1);
      end else begin if Ch = Stru then begin
        truB.Enabled := True;
        DeleteB.Enabled := True;
      end else begin if Ch in [Sapa, Seqa] then begin
        apaB.Enabled := True;
        eqaB.Enabled := True;
        DeleteB.Enabled := True;
        Marcate2(SCol + 1, SRow);
      end else begin if Ch = Sset then begin
        setB.Enabled := True;
        DeleteB.Enabled := True;
        Marcate1(SCol + 1, SRow);
      end end end end end end end end;//if
    end else begin if nr >= 3 then begin
      if St[1] = Spoi then begin
        MarcateQuantifier;
      end else begin
        MarcateRelFun;
      end;//if
      DeleteB.Enabled := True;
    end end end end;//if
  end;//if
end;

function TGridSentence.OperationExists(Op : String) : Boolean;
begin
  Result := DatabaseLogic.OperationExists(Op);
end;

procedure TGridSentence.MoveRightCol(ACol, Pos : Integer);
// Cu minus la Pos merge la stinga.
  var
    DCol : Integer;
    ARow : Integer;
    ERow : Integer;
begin
  if Pos <> 0 then begin
    DCol := ACol + Pos;
    ERow := FirstEmptyRow;
    for ARow := 0 to ERow - 1 do begin
      Grid.Cells[DCol, ARow] := Grid.Cells[ACol, ARow];
      Grid.Cells[ACol, ARow] := '';
    end;//for
  end;//if
end;

procedure TGridSentence.MoveRightAfterCol(ACol, Pos : Integer);
  var
    MCol : Integer;
begin
  for MCol := FirstEmptyCol - 1 downto ACol + 1 do begin
    MoveRightCol(MCol, Pos);
  end;//for
end;

procedure TGridSentence.SetFocusPosition(ACol, ARow : Integer);
  var
    MyRect : TGridRect;
    CanSelect : Boolean;
begin
  MyRect.Left := ACol;
  MyRect.Top := ARow;
  MyRect.Right := ACol;
  MyRect.Bottom := ARow;
  Grid.Selection := MyRect;
  CanSelect := True;
  GridSelectCell(Grid, ACol, ARow, CanSelect);
end;

procedure TGridSentence.DefineRelFun;
  var
    Rel : Boolean;
    Op : String;
    nr, i : Integer;
begin
  if Grid.Cells[SCol - 1, SRow] = Sdou then begin  // Relation
    Rel := True;
  end else begin                                   // Function
    Rel := False;
  end;//if
  if Rel then begin
    Op := InputBox('Definition', 'Relation', '');
  end else begin
    Op := InputBox('Definition', 'Function', '');
  end;//if
  if Op <> '' then begin
    if (Op[1] < '0') or (Op[1] > '9') then begin
      if (Pos('(', Op) = 0) and (Pos(')', Op) = 0) and (Pos(Spoi, Op) = 0) then begin
        if not OperationExists(Op) then begin
          nr := Length(Op);
          GrowGrid(SRow, nr - 1);
          MoveRightAfterCol(SCol, SRow);
          if Rel then begin
            Grid.Cells[SCol, SRow] := Op + Ssent + IntToStr(SRow);
          end else begin
            Grid.Cells[SCol, SRow] := Op + Sterm + IntToStr(SRow);
          end;//if
          for i := 1 to nr - 1 do begin  // scrie pe verticala
            Grid.Cells[SCol, SRow + i] := Op[i + 1];
          end;//for
          for i := 1 to SRow do begin    // face linkurile
            Grid.Cells[SCol + i, i - 1] := Slnk;  // sus
            Grid.Cells[SCol + i, SRow] := Spoi + Sterm + IntToStr(SRow - i + 1);   // jos
          end;//for
          SetFocusPosition(SCol + SRow + 1, SRow);
        end else begin
          MessageDlg('Name already exists!', mtWarning, [mbOK], 0);
        end;//if
      end else begin
        MessageDlg('"(", ")" and "^" are not permited!', mtWarning, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('The first char cannot be a number!', mtWarning, [mbOK], 0);
    end;//if
  end else begin
    MessageDlg('Name is empty!', mtWarning, [mbOK], 0);
  end;//if
end;

procedure TGridSentence.WriteDetail(
  Sentence, Detail : Integer;
  Operation : String;
  Link : Integer
);
begin
  DatabaseLogic.WriteDetail(Sentence, Detail, Operation, Link);
end;

procedure TGridSentence.WriteOperation(Operation, Title : String; IPut, OPut : Char; Number : Integer);
begin
  DatabaseLogic.WriteOperation(Operation, Title, IPut, OPut, Number);
end;

function TGridSentence.WriteSentence(
  Title, Description : String;
  Kind : Char;
  Operation : String
) : Integer;
begin
  Result := DatabaseLogic.WriteSentence(Title, Description, Kind, Operation);
end;

function TGridSentence.FindRow(ACol : Integer) : Integer;
  var
    ERow : Integer;
    found : Boolean;
begin
  Result := 0;
  ERow := FirstEmptyRow;
  found := False;
  while (not found) and (Result < ERow) do begin
    if (Grid.Cells[ACol, Result] <> '') and (Grid.Cells[ACol, Result] <> Slnk) then begin
      found := True;
    end else begin
      Inc(Result);
    end;//if
  end;//while
  if Result = ERow then begin
    Result := -1;
  end;//if
end;

procedure TGridSentence.SaveSentence;
  var
    Prompt, Title, Description : String;
    Cell : TCell;
    MCol, MRow : Integer;
    Oper : TOper;
    Kind : Char;
    nr : Integer;
    St : String;
    Sentence : Integer;
begin
  if SentenceIsReady then begin
    Kind := 'A';
    Prompt := 'Save axiom';
    Cell := SecondArgOfLastUni;
    if Grid.Cells[Cell.Col, Cell.Row][1] in [Sdou, Seqa] then begin
      MCol := Cell.Col + 1;
      MRow := Cell.Row;
      if Grid.Cells[MCol, MRow].Length >= 3 then begin
        Oper := DecodeSt(Grid.Cells[MCol, MRow]);
        if Oper.OPut = Ssent then begin
          Kind := 'R';
          Prompt := 'Save relation';
        end else begin
          Kind := 'F';
          Prompt := 'Save function';
        end;
      end;//if
    end;//if
    SaveF := TSaveF.Create(Nil);
    try
      SaveF.Caption := Prompt;
      if SaveF.ShowModal = mrOK then begin
        Title := SaveF.TitleE.Text;
        Description := SaveF.DescriptionM.Text;
        DatabaseLogic.StartTransaction;
        try
          if Kind <> 'A' then begin
            WriteOperation(Oper.Operation, Title, Sterm, Oper.OPut, Oper.Number);
            Sentence := WriteSentence(Title, Description, Kind, Oper.Operation);
          end else begin
            Sentence := WriteSentence(Title, Description, Kind, '');
          end;//if
          // Details
          nr := FirstColAfter(0, 0);
          for MCol := 0 to nr - 1 do begin
            MRow := FindRow(MCol);
            St := Grid.Cells[MCol, MRow];
            Oper := DecodeSt(Grid.Cells[MCol, MRow]);
            if Oper.Operation = Spoi then begin
              WriteDetail(Sentence, MCol + 1, Oper.Operation, GetLink(St));
            end else begin
              WriteDetail(Sentence, MCol + 1, Oper.Operation, 0);
            end;//if
          end;//for
          DatabaseLogic.Commit;
        except
          on E : Exception do begin
            if E is EDatabaseError then begin
              MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
            end else begin
              MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
            DatabaseLogic.Rollback;
          end;//on
        end;
      end;//if
    finally
      SaveF.Free;
    end;
  end else begin
    MessageDlg('Sentence is not ready!', mtWarning, [mbOK], 0);
  end;//if
end;

procedure TGridSentence.uniBClick(Sender: TObject);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    GrowGrid(2, 1);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 2);
    end;//if
    Grid.Cells[SCol, SRow] := Suni;
    Grid.Cells[SCol + 1, SRow + 1] := Stru;
    Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
    SetFocusPosition(SCol + 2, SRow + 1);
  end else begin if Grid.Cells[SCol, SRow] = Sexi then begin
    Grid.Cells[SCol, SRow] := Suni;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.exiBClick(Sender: TObject);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    GrowGrid(2, 1);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 2);
    end;//if
    Grid.Cells[SCol, SRow] := Sexi;
    Grid.Cells[SCol + 1, SRow + 1] := Stru;
    Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
    SetFocusPosition(SCol + 2, SRow + 1);
  end else begin if Grid.Cells[SCol, SRow] = Suni then begin
    Grid.Cells[SCol, SRow] := Sexi;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.orxBClick(Sender: TObject);
  var
    St : String;
begin
  St := Grid.Cells[SCol, SRow];
  if St = ' ' + Ssent then begin
    GrowGrid(2, 0);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 2);
    end;//if
    Grid.Cells[SCol, SRow] := Sorx;
    Grid.Cells[SCol + 1, SRow] := ' ' + Ssent;
    Grid.Cells[SCol + 2, SRow] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow);
  end else begin if (St = Sand) or (St = Sdou) or (St = Simp) then begin
    Grid.Cells[SCol, SRow] := Sorx;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.andBClick(Sender: TObject);
  var
    St : String;
begin
  St := Grid.Cells[SCol, SRow];
  if St = ' ' + Ssent then begin
    GrowGrid(2, 0);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 2);
    end;//if
    Grid.Cells[SCol, SRow] := Sand;
    Grid.Cells[SCol + 1, SRow] := ' ' + Ssent;
    Grid.Cells[SCol + 2, SRow] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow);
  end else begin if (St = Sorx) or (St = Sdou) or (St = Simp) then begin
    Grid.Cells[SCol, SRow] := Sand;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.douBClick(Sender: TObject);
  var
    St : String;
begin
  St := Grid.Cells[SCol, SRow];
  if St = ' ' + Ssent then begin
    GrowGrid(2, 0);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 2);
    end;//if
    Grid.Cells[SCol, SRow] := Sdou;
    Grid.Cells[SCol + 1, SRow] := ' ' + Ssent;
    Grid.Cells[SCol + 2, SRow] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow);
  end else begin if (St = Sorx) or (St = Sand) or (St = Simp) then begin
    Grid.Cells[SCol, SRow] := Sdou;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.impBClick(Sender: TObject);
  var
    St : String;
begin
  St := Grid.Cells[SCol, SRow];
  if St = ' ' + Ssent then begin
    GrowGrid(2, 0);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 2);
    end;//if
    Grid.Cells[SCol, SRow] := Simp;
    Grid.Cells[SCol + 1, SRow] := ' ' + Ssent;
    Grid.Cells[SCol + 2, SRow] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow);
  end else begin if (St = Sorx) or (St = Sand) or (St = Sdou) then begin
    Grid.Cells[SCol, SRow] := Simp;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.notBClick(Sender: TObject);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    GrowGrid(1, 0);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 1);
    end;//if
    Grid.Cells[SCol, SRow] := Snot;
    Grid.Cells[SCol + 1, SRow] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow);
  end;//if
end;

procedure TGridSentence.truBClick(Sender: TObject);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    Grid.Cells[SCol, SRow] := Stru;
  end else begin
    Grid.Cells[SCol, SRow] := ' ' + Ssent;
  end;//if
  SetButtons;
end;

procedure TGridSentence.apaBClick(Sender: TObject);
  var
    St : String;
begin
  St := Grid.Cells[SCol, SRow];
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    GrowGrid(2, 0);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 2);
    end;//if
    Grid.Cells[SCol, SRow] := Sapa;
    Grid.Cells[SCol + 1, SRow] := ' ' + Sterm;
    Grid.Cells[SCol + 2, SRow] := ' ' +Sterm;
    SetFocusPosition(SCol + 1, SRow);
  end else begin if St = Seqa then begin
    Grid.Cells[SCol, SRow] := Sapa;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.eqaBClick(Sender: TObject);
  var
    St : String;
begin
  St := Grid.Cells[SCol, SRow];
  if St = ' ' + Ssent then begin
    GrowGrid(2, 0);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 2);
    end;//if
    Grid.Cells[SCol, SRow] := Seqa;
    Grid.Cells[SCol + 1, SRow] := ' ' + Sterm;
    Grid.Cells[SCol + 2, SRow] := ' ' + Sterm;
    SetFocusPosition(SCol + 1, SRow);
  end else begin if St = Sapa then begin
    Grid.Cells[SCol, SRow] := Seqa;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.setBClick(Sender: TObject);
  var
    St : String;
begin
  St := Grid.Cells[SCol, SRow];
  if St = ' ' + Ssent then begin
    GrowGrid(1, 0);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 1);
    end;//if
    Grid.Cells[SCol, SRow] := Sset;
    Grid.Cells[SCol + 1, SRow] := ' ' + Sterm;
    SetFocusPosition(SCol + 1, SRow);
  end;//if
end;

procedure TGridSentence.genBClick(Sender: TObject);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Sterm then begin
    GrowGrid(1, 1);
    if SCol + 1 < FirstEmptyCol then begin
      MoveRightAfterCol(SCol, 1);
    end;//if
    Grid.Cells[SCol, SRow] := Sgen;
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow + 1);
  end;//if
end;

procedure TGridSentence.DefineBClick(Sender: TObject);
begin
  DefineRelFun;
end;

procedure TGridSentence.DeleteBClick(Sender: TObject);
begin
  Delete(SCol, SRow);
end;

procedure TGridSentence.SaveBClick(Sender: TObject);
begin
  SaveSentence;
end;

function TGridSentence.UpIsEmpty(ACol, ARow : Integer) : Boolean;
  var
    URow : Integer;
begin
  Result := True;
  URow := ARow - 1;
  while Result and (URow >= 0) do begin
    if Grid.Cells[ACol, URow] <> '' then begin
      Result := False;
    end else begin
      Dec(URow);
    end;
  end;//while
end;

function TGridSentence.FindQuantifier(ACol, ARow : Integer) : Integer;
// Se aplica numai pe '+'
  var
    found : Boolean;
begin
  Result := ACol;
  found := False;
  while (not found) and (Result >= 0) do begin
    if
      (Grid.Cells[Result, ARow] <> '')
      and (Grid.Cells[Result, ARow] <> Slnk)
    then begin
      found := True;
    end else begin
      Dec(Result);
    end;
  end;//while
end;

function TGridSentence.FindTerm(ACol, ARow : Integer) : Integer;
// Se aplica numai la '+'
  var
    found : Boolean;
    ERow : Integer;
begin
  Result := ARow;
  found := False;
  ERow := FirstEmptyRow;
  while (not found) and (Result < ERow) do begin
    if Grid.Cells[ACol, Result] = ' ' + Sterm then begin
      found := True;
    end else begin
      Inc(Result);
    end;
  end;//while
  if Result = ERow then begin
    Result := -1;
  end;//if
end;

function TGridSentence.FindPlus(ACol, ARow : Integer) : Integer;
// Se aplica numai la Spoi
  var
    found : Boolean;
begin
  Result := ARow - 1;
  found := False;
  while (not found) and (Result >= 0) do begin
    if Grid.Cells[ACol, Result] = '+' then begin
      found := True;
    end else begin
      Dec(Result);
    end;
  end;//while
end;

procedure TGridSentence.SetLink(ACol, ARow : Integer);
  var
    LCol, DRow : Integer;
    St : String;
begin
  if UpIsEmpty(ACol, ARow) then begin
    LCol := FindQuantifier(ACol, ARow);
    DRow := FindTerm(ACol, ARow);
    if (LCol <> -1) and (DRow <> -1) then begin
      St := Grid.Cells[LCol, ARow];
      if (St = Suni) or (St = Sexi) or (St = Sgen) then begin
        if Grid.Cells[ACol, DRow] = ' ' + Sterm then begin
          Grid.Cells[ACol, ARow] := Slnk;  // sus
          Grid.Cells[ACol, DRow] := Spoi + Sterm + IntToStr(DRow - ARow);  // jos
        end;//if
      end;//if
    end;//if
  end;//if
end;

function TGridSentence.SentenceIsReady : Boolean;
  var
    MCol : Integer;
    ECol : Integer;
begin
  Result := True;
  MCol := 0;
  ECol := FirstEmptyCol;
  while Result and (MCol < ECol) do begin
    if Grid.Cells[MCol, FindRow(MCol)].Length = 2 then begin
      Result := False;
    end else begin
      Inc(MCol);
    end;//if
  end;//for
end;

function TGridSentence.InMarcator(ACol : Integer) : Boolean;
  var
    i : Integer;
    Sub : String;
begin
  Result := False;
  i := 1;
  Sub := '';
  while (not Result) and (i <= Length(Marcator)) do begin
    if (Marcator[i] >= '0') and (Marcator[i] <= '9') then begin
      Sub := Sub + Marcator[i];
    end else begin
      if StrToInt(Sub) = ACol then begin
        Result := True;
      end else begin
        Sub := '';
      end;//if
    end;//if
    Inc(i);
  end;//while
end;

function TGridSentence.Parent(Cell : TCell) : TCell;
  var
    found : Boolean;
begin
  Result.Col := Cell.Col - 1;
  Result.Row := Cell.Row;
  if (Result.Col >= 0) and (Result.Row >= 0) then begin
    if Grid.Cells[Result.Col, Result.Row] = '' then begin
      Result.Row := FindRow(Result.Col);
    end;//if
  end;//if
  found := False;
  while (not found) and (Result.Col >= 0) and (Result.Row >= 0) do begin
    if Cell.Col < FirstColAfter(Result.Col, Result.Row) then begin
      found := True;
    end else begin
      Result.Col := Result.Col - 1;
      if (Result.Col >= 0) and (Result.Row >= 0) then begin
        if Grid.Cells[Result.Col, Result.Row] = '' then begin
          Result.Row := FindRow(Result.Col);
        end;//if
      end;//if
    end;//if
  end;//while
end;

function TGridSentence.GetQuantifier(Cell : TCell) : TCell;
// Se aplica numai la Spoi
  var
    St : String;
    Number, k : Integer;
begin
  St := Grid.Cells[Cell.Col, Cell.Row];
  Number := StrToInt(Copy(St, 3, Length(St) - 2));
  k := 1;
  Result := Cell;
  while (Result.Col > -1) and (k <= Number) do begin
    Result := Parent(Result);
    if Grid.Cells[Result.Col, Result.Row][1] in [Suni, Sexi, Sgen]  then begin
      Inc(k);
    end;//
  end;//while
end;

function TGridSentence.SentenceToString : String;
  var
    MCol, MRow : Integer;
    nr : Integer;
    St : String;
    Oper : TOper;
begin
  Result := '';
  nr := FirstColAfter(0, 0);
  for MCol := 0 to nr - 1 do begin
    MRow := FindRow(MCol);
    St := Grid.Cells[MCol, MRow];
    if Length(St) >= 3 then begin
      Oper := DecodeSt(Grid.Cells[MCol, MRow]);
      if Oper.Operation = Spoi then begin
        Result := Result + St[1] + Copy(St, 3, Length(St) - 2);
      end else begin
        Result :=
          Result +
          '(' + Oper.Operation + ')' +
          Oper.OPut +
          IntToStr(Oper.Number)
        ;
      end;//if
    end else begin  // Length(St) = 1
      Result := Result + St;
    end;//if
  end;//for
end;

function TGridSentence.NextOperation(Cell : TCell) : TCell;
begin
  Result.Col := Cell.Col + 1;
  Result.Row := FindRow(Result.Col);
end;

procedure TGridSentence.ShowLinksOfQuantifier(Cell : TCell);
  var
    FCol : Integer;
    Kell : TCell;
    Oper : TOper;
begin
  FCol := FirstColAfter(Cell.Col, Cell.Row);
  Kell := NextOperation(Cell);
  while (Kell.Col > -1) and (Kell.Col < FCol) do begin
    Oper := DecodeSt(Grid.Cells[Kell.Col, Kell.Row]);
    if Oper.Operation = Spoi then begin
      if
        (Cell.Col = GetQuantifier(Kell).Col) and
        (Cell.Row = GetQuantifier(Kell).Row)
      then begin
        ShowMessage(IntToStr(Kell.Col));
      end;//if
    end;//if
    Kell := NextOperation(Kell);
  end;//while
end;

function TGridSentence.QuantifierIsUsed(Cell : TCell) : Boolean;
  var
    FCol : Integer;
    Kell, Mell : TCell;
    Oper : TOper;
begin
  Result := False;
  FCol := FirstColAfter(Cell.Col, Cell.Row);
  Kell := NextOperation(Cell);
  while (not Result) and (Kell.Col > -1) and (Kell.Col < FCol) do begin
    Oper := DecodeSt(Grid.Cells[Kell.Col, Kell.Row]);
    if Oper.Operation = Spoi then begin
      Mell := GetQuantifier(Kell);
      if (Cell.Col = Mell.Col) and (Cell.Row = Mell.Row) then begin
        Result := True;
      end;//if
    end;//if
    Kell := NextOperation(Kell);
  end;//while
end;

end.
