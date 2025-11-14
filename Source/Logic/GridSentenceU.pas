unit GridSentenceU;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, System.StrUtils,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ClipBrd, IB_Components, IB_Access, IBODataset, DBGrids,
  Connection, Data.DB, AZExtender, CommonDefs, StringSentenceU;

{
Gridul contine celule
- nefolosite
    nr = 0, goale
- definitorii (contin informatia despre sentinta)
    nr = 1 si nu e Slnk
      un caracter care nu are nimic deasupra
        Suni, Sexi, Sgen, Sand, Sorx, etc.
    nr = 2 (doua caractere)
      arata felul unei celule care trebuie completata
        ' ' + Ssent
        ' ' + Sterm
    nr >= 3, trei sau mai multe caractere
      Spoi + Sterm + un numar
      functii sau relatii definite, de exemplu pentru (Nim)t2 avem
        'Nimt2' in celula, iar in jos se scrie restul din 'Nim', adica 'i' si 'm'.
- auxiliare
    nr = 1
      Slnk, semnul de sus de la linkuri.
      are ceva deasupra, (la functii si relatii definite, ce e scris in jos

Vezi implementarea la IsDefinitCell si la SetButtons!
}

type
  TGridSentence = class(TObject)
  private
    Grid : TStringGrid;
    GridKeyDown : TKeyEvent;
    GridColCount : Integer;
    GridRowCount : Integer;
    SCol : Integer;
    SRow : Integer;
    OldSCol : Integer;
    OldSRow : Integer;
    Marcator : String;

    StringSentence : TStringSentence;
    StringList : TStringList;
    OperationsG : TDBGrid;
    SentencesDS : TDataSet;
    ControlSetLink : Boolean;  // Daca e True, atunci GridSelectCell nu cheama SetLink.

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
    SearchB : TSpeedButton;

    procedure OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    function ColIsEmpty(ACol : Integer) : Boolean;
    function RowIsEmpty(ARow : Integer) : Boolean;
    function FirstEmptyCol : Integer;
    function FirstEmptyRow : Integer;
    procedure GrowGrid(DCol, DRow : Integer);
    procedure GrowGridTilPos(ACol, ARow : Integer);
    function FirstColAfter(ACol, ARow : Integer) : Integer;
    procedure EmptyAfter(ACol, ARow : Integer);
    function SecondArgOfLastUni : TCell;
    function DecodeSt(St : String) : TOper;
    function GetLink(St : String) : Integer;
    procedure MoveRightCol(ACol, Pos : Integer);
    procedure MoveRightAfterCol(ACol, Pos : Integer);
    procedure SetFocusPosition(ACol, ARow : Integer);
    procedure DefineRelFun;
    procedure PutRelFun(Oper : TOper);
    function UpIsEmpty(ACol, ARow : Integer) : Boolean;
    function IsDefinitCell(ACol, ARow : Integer) : Boolean;
    function FindLeft(ACol, ARow : Integer) : Integer;
    function FindTerm(ACol, ARow : Integer) : Integer;
    function FindPlus(ACol, ARow : Integer) : Integer;
    procedure SetLink(ACol, ARow : Integer);
    function SentenceIsReady : Boolean;
    function Parent(Cell : TCell) : TCell;
    function FindRow(ACol : Integer) : Integer;
    procedure SaveSentence(Sentence : Integer);
    procedure SaveSentence0;
    procedure SearchSentence;

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
    procedure SearchBClick(Sender: TObject);
    procedure Switch(OPut : Char);
    procedure OperationsGDblClick(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    procedure DefineComponents(
      StringGrid : TStringGrid;
      uniB, exiB, orxB, andB, douB, impB, notB, truB, apaB, eqaB, setB, genB : TSpeedButton;
      DefineB, DeleteB, SaveB, SearchB : TSpeedButton;
      OperationsG : TDBGrid;
      SentencesDS : TDataSet
    );
    procedure GridDrawCell(
      Sender : TObject; ACol, ARow : Integer;
      Rect : TRect; State : TGridDrawState
    );
    procedure GridSelectCell(
      Sender : TObject; ACol, ARow : Integer;
      var CanSelect : Boolean
    );
    function SentenceToString : String;
    function GetStepsToQuant(Sell, Qell : TCell) : Integer;
    function GetQuantRow(ACol, ARow, Number : Integer) : Integer;
    function SecondArgOfLastQuantifier : TCell;
    procedure Delete(ACol, ARow : Integer);
    procedure PutStringSentence(Sentence : String);
    function GetStepForLink(Sent, Link : Integer) : Integer;
    function GetStepForSentence(
      Sent, Arg, SArg, Rule, Col, SCol : Integer;
      Sentence : String
    ) : Integer;
    function GetSCol : Integer;
    function GetSRow : Integer;
    function GetOldSCol : Integer;
    function GetOldSRow : Integer;
    function GetCurrCell : String;
    function ColInContent : Boolean;
    function ColsInContent : Boolean;
    procedure CopyToClipboard;
    procedure ClientSetPosition(i : Integer);
    procedure Clear;
    procedure SetFocusUser(i : Integer);
    procedure MakeUni(Ch : Char);
    procedure MakeExi(Ch : Char);
    procedure SaveSentenceAt;
  end;

implementation

uses
  Save, Haupt;

const
  DeltaL = 6;
  DeltaT = 3;

constructor TGridSentence.Create;
begin
  inherited Create;
  StringSentence := TStringSentence.Create;
  StringList := TStringList.Create;
  ControlSetLink := False;
end;

destructor TGridSentence.Destroy;
begin
  StringSentence.Free;
  StringList.Free;
  inherited Destroy;
end;

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
    and Assigned(SearchB)
    and Assigned(OperationsG)
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
    Switch('X');
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
      Switch(Ssent);
      Cell := SecondArgOfLastUni;
      if Grid.Cells[Cell.Col, Cell.Row] = Sdou then begin
        if Cell.Col + 1 = SCol then begin
          DefineB.Enabled := True;
        end;//if
      end;//if
    end else begin if St = ' ' + Sterm then begin
      genB.Enabled := True;
      Switch(Sterm);
      Cell := SecondArgOfLastUni;
      if Grid.Cells[Cell.Col, Cell.Row] = Seqa then begin
        if Cell.Col + 1 = SCol then begin
          DefineB.Enabled := True;
        end;//if
      end
    end else begin if nr = 1 then begin
      if UpIsEmpty(SCol, SRow) then begin
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
          Marcate2(SCol + 1, SRow + 1);
        end else begin if Ch = Snot then begin
          DeleteB.Enabled := True;
          Marcate1(SCol + 1, SRow + 1);
        end else begin if Ch = Spoi then begin
          DeleteB.Enabled := True;
        end else begin if Ch = Sgen then begin
          DeleteB.Enabled := True;
          MarcateLinks;
          Marcate1(SCol + 1, SRow + 1);
        end else begin if Ch = Stru then begin
          DeleteB.Enabled := True;
        end else begin if Ch in [Sapa, Seqa] then begin
          apaB.Enabled := True;
          eqaB.Enabled := True;
          DeleteB.Enabled := True;
          Marcate2(SCol + 1, SRow + 1);
        end else begin if Ch = Sset then begin
          DeleteB.Enabled := True;
          Marcate1(SCol + 1, SRow + 1);
        end end end end end end end end;//if
      end;//if
    end else begin if nr >= 3 then begin
      if St[1] = Spoi then begin
        MarcateQuantifier;
      end else begin
        MarcateRelFun;
      end;//if
      DeleteB.Enabled := True;
    end end end end;//if
  end else begin
    St := Grid.Cells[SCol, SRow];
    nr := Length(St);
    if nr = 1 then begin
      if UpIsEmpty(SCol, SRow) then begin
        Ch := St[1];
        if                Ch in [Suni, Sexi] then begin
          MarcateLinks;
          Marcate2(SCol + 1, SRow + 1);
        end else begin if Ch in [Sorx, Sand, SDou, Simp] then begin
          Marcate2(SCol + 1, SRow + 1);
        end else begin if Ch in [Snot, Sset] then begin
          Marcate1(SCol + 1, SRow + 1);
        end else begin if Ch = Sgen then begin
          MarcateLinks;
          Marcate1(SCol + 1, SRow + 1);
        end else begin if Ch in [Sapa, Seqa] then begin
          Marcate2(SCol + 1, SRow + 1);
        end end end end end;//if
      end;//if
    end else begin if nr >= 3 then begin
      if St[1] = Spoi then begin
        MarcateQuantifier;
      end else begin
        MarcateRelFun;
      end;//if
    end end;//if
  end;//if
end;

procedure TGridSentence.DefineComponents(
  StringGrid : TStringGrid;
  uniB, exiB, orxB, andB, douB, impB, notB, truB, apaB, eqaB, setB, genB : TSpeedButton;
  DefineB, DeleteB, SaveB, SearchB : TSpeedButton;
  OperationsG : TDBGrid;
  SentencesDS : TDataSet
);
begin
  Grid := StringGrid;
  GridKeyDown := Grid.OnKeyDown;
  Grid.OnKeyDown := Self.OnKeyDown;
  GridColCount := Grid.ColCount;
  GridRowCount := Grid.RowCount;

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
  Self.SearchB := SearchB;

  Self.OperationsG := OperationsG;
  Self.SentencesDS := SentencesDS;

  SCol := 0;
  SRow := 0;
  OldSCol := 0;
  OldSRow := 0;

  Grid.Cells[SCol, SRow] := ' ' + Ssent;
  Grid.ShowHint := True;
  Grid.OnDrawCell := GridDrawCell;
  Grid.OnSelectCell := GridSelectCell;

  if Assigned(OperationsG) then begin
    OperationsG.OnDblClick := OperationsGDblClick;
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
  SetButton(DefineB, 'Define', 'Define a relation or a function Ctrl+Shift+D', DefineBClick);
  SetButton(DeleteB, 'Delete', 'Delete Del, BkSp', DeleteBClick);
  SetButton(SaveB, 'Save', 'Save the sentence Ctrl+Shift+S', SaveBClick);
  SetButton(SearchB, 'Search', 'Search the sentence', SearchBClick);

  SetButtons;
end;

function TGridSentence.IsDefinitCell(ACol, ARow : Integer) : Boolean;
  var
    St : String;
    nr : Integer;
begin
  Result := False;
  St := Grid.Cells[ACol, ARow];
  nr := Length(St);
  if (nr = 1) and (St <> Slnk) then begin
    if UpIsEmpty(ACol, ARow) then begin
      Result := True;
    end;//if
  end else begin if nr >= 2 then begin
    Result := True;
  end end;//if
end;

function TGridSentence.FindRow(ACol : Integer) : Integer;
// Se poate aplica pe orice coloana.
// Poate da FirstEmptyRow.
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
end;

function TGridSentence.FirstColAfter(ACol, ARow : Integer) : Integer;
// Se aplica la celulele definitorii si la cele auxiliare de doua pozitii.
// Poate da FirstEmptyCol
  var
    St : String;
    Ch : Char;
    Col1, Row1 : Integer;
    Col2, Row2 : Integer;
    Oper : TOper;
    nr, Number, i : Integer;
    MCol : Integer;
begin
  St := Grid.Cells[ACol, ARow];
  nr := Length(St);
  if nr = 1 then begin
    Ch := St[1];
    if Ch in [Suni, Sexi, Sand, Sorx, Sdou, Simp, Sapa, Seqa] then begin  // 2
      Col1 := ACol + 1;
      Row1 := ARow + 1;
      Col2 := FirstColAfter(Col1, Row1);
      Row2 := Row1;
      Result := FirstColAfter(Col2, Row2);
    end else begin if Ch in [Sgen, Snot, Sset] then begin  // 1
      Col1 := ACol + 1;
      Row1 := ARow + 1;
      Result := FirstColAfter(Col1, Row1);
    end else begin if Ch in [Stru] then begin  // 0
      Result := ACol + 1;
    end end end;//if
  end else begin if nr = 2 then begin
    Result := ACol + 1;
  end else begin if nr >= 3 then begin
    Ch := St[1];
    if Ch = Spoi then begin  // 0
      Result := ACol + 1;
    end else begin
      Oper := DecodeSt(St);
      Number := Oper.Number;
      if Number = 0 then begin
        Result := ACol + 1;
      end else begin
        MCol := ACol + 1;
        Row1 := ARow + 1;
        for i := 1 to Number do begin
          MCol := FirstColAfter(MCol, Row1);
        end;//for
        Result := MCol;
      end;
    end;//if
  end end end;//if
end;

function TGridSentence.FindLeft(ACol, ARow : Integer) : Integer;
// Se poate aplica oriunde
// Poate da rezultatul -1.
// Aplicata pe Slnk da sigur rezultat bun.
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

function TGridSentence.Parent(Cell : TCell) : TCell;
// Se aplica numai la celulele definitorii si
// la celulele pe care tocmai vrem sa le completam.
// La root da rezultatul (-1, -1).
begin
  Result.Col := FindLeft(Cell.Col, Cell.Row - 1);
  Result.Row := Cell.Row - 1;
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
  ControlSetLink := True;
  try
    CanSelect := True;
    GridSelectCell(Grid, ACol, ARow, CanSelect);
  finally
    ControlSetLink := False;
  end;
end;

procedure TGridSentence.OnKeyDown(
  Sender: TObject; var Key: Word;
  Shift: TShiftState
);
  var
    Cell : TCell;
    StringList : TStringList;
    MCol, MRow : Integer;
begin
  if Assigned(GridKeyDown) then begin
    GridKeyDown(Sender, Key, Shift);
  end;//if
  if                Chr(Key) = 'M' then begin
    if [ssCtrl, ssShift] = Shift then begin
      Self.CopyToClipboard;
    end;//if
  end else begin if Char(Key) = 'T' then begin
    if [ssCtrl, ssShift] = Shift then begin
      if SentenceIsReady then begin
        StringList := TStringList.Create;
        try
          StringSentence.SetSentence(Self.SentenceToString);
          StringSentence.SentenceAsStringList(0, StringList);
          Clipboard.AsText := StringList.Text;
        finally
          StringList.Free;
        end;
      end else begin
        MessageDlg('Sentence is not ready!', mtWarning, [mbOK], 0);
      end;//if
    end;//if
  end else begin if Char(Key) = 'P' then begin
    if [ssCtrl, ssShift] = Shift then begin
      if SCol > 0 then begin  // Sa nu fie root.
        if IsDefinitCell(SCol, SRow) then begin
          Cell.Col := SCol;
          Cell.Row := SRow;
          Cell := Parent(Cell);
          SetFocusPosition(Cell.Col, Cell.Row);
        end;//if
      end;//if
    end;//if
  end else begin if Char(Key) = 'N' then begin
    if [ssShift, ssCtrl] = Shift then begin
      if IsDefinitCell(SCol, SRow) then begin
        if SCol >= 0 then begin
          MCol := SCol + 1;
          if MCol < FirstEmptyCol then begin
            MRow := FindRow(MCol);
            if MRow > -1 then begin
              SetFocusPosition(MCol, MRow);
            end;//if
          end;//if
        end;//if
      end;//if
    end;//if
  end end end end;//if
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
    end else begin if St[1] = Slnk then begin
      Grid.Canvas.Brush.Color := Grid.Color;
    end else begin
      if InMarcator(ACol) and (FindRow(ACol) = ARow) then begin
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
  OldSCol := SCol;
  OldSRow := SRow;
  SCol := ACol;
  SRow := ARow;
  Grid.Hint := ' ' + IntToStr(SCol + 1) + ' ';
  if not ControlSetLink then begin
    SetLink(ACol, ARow);
  end;//if
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

procedure TGridSentence.GrowGridTilPos(ACol, ARow : Integer);
begin
  if ACol >= Grid.ColCount then begin
    Grid.ColCount := ACol + 1;
  end;//if
  if ARow >= Grid.RowCount then begin
    Grid.RowCount := ARow + 1;
  end;//if
end;

function TGridSentence.DecodeSt(St : String) : TOper;
// de aplicat numai le celulele definitorii
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
    Result.Operation := St;
    if Ch in [Suni, Sexi, Sorx, Sand, Sdou, Simp] then begin
      Result.OPut := Ssent;
      Result.Number := 2;
    end else begin if Ch in [Sapa, Seqa] then begin
      Result.OPut := Ssent;
      Result.Number := 2;
    end else begin if Ch = Sset then begin
      Result.OPut := Ssent;
      Result.Number := 1;
    end else begin if Ch = Snot then begin
      Result.OPut := Ssent;
      Result.Number := 1;
    end else begin if Ch = Stru then begin
      Result.OPut := Ssent;
      Result.Number := 0;
    end else begin if Ch = Sgen then begin
      Result.OPut := Sterm;
      Result.Number := 1;
    end end end end end end;//if
  end else begin if nr = 2 then begin  // n-ar trebui sa fie niciodata!
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
begin
  Result := StrToInt(Copy(St, 3, Length(St) - 2));
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
  if IsDefinitCell(ACol, ARow) then begin
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
  end;//if
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
      if MRow < FirstEmptyRow then begin
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
    QCol, QRow : Integer;
begin
  MCol := SCol;
  ECol := FirstColAfter(SCol, SRow);
  while MCol < ECol do begin
    MRow := FindRow(MCol);
    if Grid.Cells[MCol, MRow][1] = Spoi then begin
      QRow := FindPlus(MCol, MRow);
      QCol := FindLeft(MCol, QRow);
      if SCol = QCol then begin
        Marcate1(MCol, MRow);
      end;//if
    end;//if
    Inc(MCol);
  end;//for
end;

procedure TGridSentence.MarcateQuantifier;
// Se aplica numai pe Spoi.
  var
    St : String;
    MCol, MRow : Integer;
begin
  MCol := SCol;
  MRow := SRow;
  MRow := FindPlus(MCol, MRow);
  MCol := FindLeft(MCol, MRow);
  Marcate1(MCol, MRow);
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
  MRow := SRow + 1;
  for k := 1 to Oper.Number do begin
    Marcate1(MCol, MRow);
    MCol := FirstColAfter(MCol, MRow);
  end;//for
end;

procedure TGridSentence.Switch(OPut : Char);
begin
  if                OPut = Ssent then begin
    HauptF.OperationsDS.DataSet := HauptF.FormsQ;
  end else begin if Oput = Sterm then begin
    HauptF.OperationsDS.DataSet := HauptF.TermsQ;
  end else begin
    HauptF.OperationsDS.DataSet := HauptF.NixQ;
  end end;//
  HauptF.OperationsE.Text := '';
  HauptF.OperationsDS.DataSet.Filtered := False;
  HauptF.Extender.SynchronizeFilter(HauptF.OperationsDS.DataSet);
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

procedure TGridSentence.DefineRelFun;
  var
    Rel : Boolean;
    Op : String;
    nr, i : Integer;
begin
  if Grid.Cells[SCol - 1, SRow - 1] = Sdou then begin  // Relation
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
    if (Pos('(', Op) = 0) and (Pos(')', Op) = 0) and (Pos(Spoi, Op) = 0) then begin
      if not HauptF.OperationExists(Op) then begin
        nr := Length(Op);
        GrowGrid(0, nr - 1);
        // SRow - 1 e numarul de quantificatori.
        MoveRightAfterCol(SCol, SRow - 1);
        if Rel then begin
          Grid.Cells[SCol, SRow] := Op + Ssent + IntToStr(SRow - 1);
        end else begin
          Grid.Cells[SCol, SRow] := Op + Sterm + IntToStr(SRow - 1);
        end;//if
        for i := 1 to nr - 1 do begin  // scrie pe verticala
          Grid.Cells[SCol, SRow + i] := Op[i + 1];
        end;//for
        for i := 1 to SRow - 1 do begin  // face linkurile
          Grid.Cells[SCol + i, i - 1] := Slnk;  // sus
          Grid.Cells[SCol + i, SRow + 1] := Spoi + Sterm + IntToStr(SRow - i);   // jos
        end;//for
        SetFocusPosition(SCol + SRow, SRow);
      end else begin
        MessageDlg('Name already exists!', mtWarning, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('"(", ")" and "^" are not permited!', mtWarning, [mbOK], 0);
    end;//if
  end;//if
end;

procedure TGridSentence.PutRelFun(Oper : TOper);
  var
    nr, i : Integer;
    MRow : Integer;
begin
  nr := Length(Oper.Operation);
  GrowGrid(SRow, nr - 1);
  MoveRightAfterCol(SCol, Oper.Number);
  Grid.Cells[SCol, SRow] := Oper.Operation + Oper.OPut + IntToStr(Oper.Number);
  for i := 1 to nr - 1 do begin  // scrie pe verticala
    Grid.Cells[SCol, SRow + i] := Oper.Operation[i + 1];
  end;//for
  for i := 1 to Oper.Number do begin
    Grid.Cells[SCol + i, SRow + 1] := ' ' + Sterm;
  end;//for
  if Oper.Number > 0 then begin
    SetFocusPosition(SCol + 1, SRow + 1);
  end else begin
    MRow := FindRow(SCol + 1);
    if MRow = FirstEmptyRow then begin
      SetFocusPosition(0, 0);
    end else begin
      SetFocusPosition(SCol + 1, MRow);
    end;//if
  end;//if
  Grid.SetFocus;
end;

procedure TGridSentence.SaveSentence(Sentence : Integer);
  var
    Prompt, Title, Description : String;
    Cell : TCell;
    MCol, MRow : Integer;
    Oper : TOper;
    Kind : Char;
    nr : Integer;
    St : String;
    DSentence : Integer;
    mr : Integer;
begin
  Kind := 'U';
  Prompt := 'Save as';
  Title := '';
  Cell := SecondArgOfLastUni;
  St := Grid.Cells[Cell.Col, Cell.Row];
  if (St = Sdou) or (St = Seqa) then begin
    MCol := Cell.Col + 1;
    MRow := Cell.Row + 1;
    if Grid.Cells[MCol, MRow].Length >= 3 then begin
      Oper := DecodeSt(Grid.Cells[MCol, MRow]);
      if Oper.Operation <> Spoi then begin
        if not HauptF.OperationExists(Oper.Operation) then begin
          if Oper.OPut = Ssent then begin
            Kind := 'R';
            Prompt := 'Save relation';
            Title := Oper.Operation + ' definition';
          end else begin
            Kind := 'F';
            Prompt := 'Save function';
            Title := Oper.Operation + ' definition';
          end;
        end;//if
      end;//if
    end;//if
  end;//if
  SaveF := TSaveF.Create(Nil);
  try
    SaveF.Caption := Prompt;
    SaveF.TitleE.Text := Title;
    if (Kind <> 'R') and (Kind <> 'F') then begin
      SaveF.SaveB.Caption := 'Undefined';
      SaveF.AxiomB.Visible := True;
    end;//if
    mr := SaveF.ShowModal;
    if mr in [mrOK, mrYes] then begin
      Title := SaveF.TitleE.Text;
      Description := SaveF.DescriptionM.Text;
      HauptF.LogicDB.StartTransaction;
      try
        if Kind in ['R', 'F'] then begin
          HauptF.WriteOperation(Oper.Operation, Title, Sterm, Oper.OPut, Oper.Number);
          Sentence := HauptF.WriteSentence(Sentence, Title, Description, Kind, Oper.Operation);
        end else begin
          if mr = mrOK then begin
            Sentence := HauptF.WriteSentence(Sentence, Title, Description, 'U', '');
            HauptF.USentencesT.Refresh;
            HauptF.USentencesT.Locate('Sentence', Sentence, []);
            HauptF.EditProofPC.ActivePage := HauptF.ProofTS;
          end else begin  // mr = mrYes
            Sentence := HauptF.WriteSentence(Sentence, Title, Description, 'A', '');
          end;//if
        end;//if
        // Details
        nr := FirstColAfter(0, 0);
        for MCol := 0 to nr - 1 do begin
          MRow := FindRow(MCol);
          St := Grid.Cells[MCol, MRow];
          Oper := DecodeSt(Grid.Cells[MCol, MRow]);
          if Oper.Operation = Spoi then begin
            HauptF.WriteDetail(Sentence, MCol + 1, Oper.Operation, GetLink(St));
          end else begin
            HauptF.WriteDetail(Sentence, MCol + 1, Oper.Operation, 0);
          end;//if
        end;//for
        HauptF.SentenceExistsSP.ParamByName('CSentence').Value := Sentence;
        HauptF.SentenceExistsSP.ExecProc;
        DSentence := HauptF.SentenceExistsSP.ParamByName('DSentence').Value;
        HauptF.LogicDB.Commit;
      except
        on E : Exception do begin
          if E is EDatabaseError then begin
            MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
          end else begin
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
          HauptF.LogicDB.Rollback;
        end;//on
      end;
      Clear;
      SentencesDS.Refresh;
      SentencesDS.Locate('Sentence', Sentence, []);
      HauptF.FormsQ.Refresh;
      HauptF.TermsQ.Refresh;
      if DSentence <> 0 then begin
        MessageDlg(
          'The newly created sentence is identical to sentence ' + IntToStr(DSentence) + '!',
          mtWarning, [mbOK], 0
        );
      end;//if
    end;//if
  finally
    SaveF.Free;
  end;
end;

procedure TGridSentence.SaveSentence0;
begin
  if SentenceIsReady then begin
    SaveSentence(0);
  end else begin
    MessageDlg('Sentence is not ready!', mtWarning, [mbOK], 0);
  end;//if
end;

procedure TGridSentence.SaveSentenceAt;
  var
    Sentence : Integer;
begin
  if SentenceIsReady then begin
    Sentence := 0;
    HauptF.SentView.Value := 0;
    if HauptF.SentView.Execute then begin
      Sentence := HauptF.SentView.Value;
    end;//if
    SaveSentence(Sentence);
  end else begin
    MessageDlg('Sentence is not ready!', mtWarning, [mbOK], 0);
  end;//if
end;

procedure TGridSentence.SearchSentence;
  var
    MCol, MRow : Integer;
    Oper : TOper;
    nr : Integer;
    St : String;
    Sentence, DSentence : Integer;
    mr : Integer;
begin
  if SentenceIsReady then begin
    Sentence := 0;
    HauptF.LogicDB.StartTransaction;
    try
      Sentence := HauptF.WriteSentence(Sentence, '', '', 'U', '');
      // Details
      nr := FirstColAfter(0, 0);
      for MCol := 0 to nr - 1 do begin
        MRow := FindRow(MCol);
        St := Grid.Cells[MCol, MRow];
        Oper := DecodeSt(Grid.Cells[MCol, MRow]);
        if Oper.Operation = Spoi then begin
          HauptF.WriteDetail(Sentence, MCol + 1, Oper.Operation, GetLink(St));
        end else begin
          HauptF.WriteDetail(Sentence, MCol + 1, Oper.Operation, 0);
        end;//if
      end;//for
      HauptF.SentenceExistsSP.ParamByName('CSentence').Value := Sentence;
      HauptF.SentenceExistsSP.ExecProc;
      DSentence := HauptF.SentenceExistsSP.ParamByName('DSentence').Value;
      if DSentence <> 0 then begin
        HauptF.SentencesRulesPC.ActivePage := HauptF.SentencesTS;
        SentencesDS.Refresh;
        if not SentencesDS.Locate('Sentence', DSentence, []) then begin
          MessageDlg(
            'The sentence is not visible!',
            mtWarning, [mbOK], 0
          );
        end;//if
      end else begin
        MessageDlg(
          'No such a sentence!',
          mtWarning, [mbOK], 0
        );
      end;//if
      HauptF.LogicDB.Rollback;
    except
      on E : Exception do begin
        if E is EDatabaseError then begin
          MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
        end else begin
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
        HauptF.LogicDB.Rollback;
      end;//on
    end;
    SentencesDS.Refresh;
  end else begin
    MessageDlg('Sentence is not ready!', mtWarning, [mbOK], 0);
  end;//if
end;

procedure TGridSentence.MakeUni(Ch : Char);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    if                Ch = '1' then begin
      GrowGrid(2, 1);
      if SCol + 1 < FirstEmptyCol then begin
        MoveRightAfterCol(SCol, 2);
      end;//if
      Grid.Cells[SCol, SRow] := Suni;
      Grid.Cells[SCol + 1, SRow + 1] := Stru;
      Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
      SetFocusPosition(SCol + 2, SRow + 1);
    end else begin if Ch = '2' then begin
      GrowGrid(3, 2);
      if SCol + 1 < FirstEmptyCol then begin
        MoveRightAfterCol(SCol, 3);
      end;//if
      Grid.Cells[SCol, SRow] := Suni;
      Grid.Cells[SCol + 1, SRow] := '';
      Grid.Cells[SCol + 1, SRow + 1] := Sset;
      Grid.Cells[SCol + 3, SRow + 1] := ' ' + Ssent;
      Grid.Cells[SCol + 2, SRow] := Slnk;  // sus
      Grid.Cells[SCol + 2, SRow + 2] := Spoi + Sterm + '1';   // jos
      SetFocusPosition(SCol + 3, SRow + 1);
    end else begin
      GrowGrid(2, 1);
      if SCol + 1 < FirstEmptyCol then begin
        MoveRightAfterCol(SCol, 2);
      end;//if
      Grid.Cells[SCol, SRow] := Suni;
      Grid.Cells[SCol + 1, SRow + 1] := ' ' + Ssent;
      Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
      SetFocusPosition(SCol + 1, SRow + 1);
    end end;//if
  end else begin if Grid.Cells[SCol, SRow] = Sexi then begin
    Grid.Cells[SCol, SRow] := Suni;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.uniBClick(Sender: TObject);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    if                GetKeyState(VK_SHIFT) < 0 then begin
      MakeUni('1');
    end else begin if GetKeyState(VK_MENU) < 0 then begin
      MakeUni('2');
    end else begin
      MakeUni('0');
    end end;//if
  end else begin if Grid.Cells[SCol, SRow] = Sexi then begin
    Grid.Cells[SCol, SRow] := Suni;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.MakeExi(Ch : Char);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    if                Ch = '1' then begin
      GrowGrid(2, 1);
      if SCol + 1 < FirstEmptyCol then begin
        MoveRightAfterCol(SCol, 2);
      end;//if
      Grid.Cells[SCol, SRow] := Sexi;
      Grid.Cells[SCol + 1, SRow + 1] := Stru;
      Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
      SetFocusPosition(SCol + 2, SRow + 1);
    end else begin if Ch = '2' then begin
      GrowGrid(3, 2);
      if SCol + 1 < FirstEmptyCol then begin
        MoveRightAfterCol(SCol, 3);
      end;//if
      Grid.Cells[SCol, SRow] := Sexi;
      Grid.Cells[SCol + 1, SRow] := '';
      Grid.Cells[SCol + 1, SRow + 1] := Sset;
      Grid.Cells[SCol + 3, SRow + 1] := ' ' + Ssent;
      Grid.Cells[SCol + 2, SRow] := Slnk;  // sus
      Grid.Cells[SCol + 2, SRow + 2] := Spoi + Sterm + '1';   // jos
      SetFocusPosition(SCol + 3, SRow + 1);
    end else begin
      GrowGrid(2, 1);
      if SCol + 1 < FirstEmptyCol then begin
        MoveRightAfterCol(SCol, 2);
      end;//if
      Grid.Cells[SCol, SRow] := Sexi;
      Grid.Cells[SCol + 1, SRow + 1] := ' ' + Ssent;
      Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
      SetFocusPosition(SCol + 1, SRow + 1);
    end end;//if
  end else begin if Grid.Cells[SCol, SRow] = Suni then begin
    Grid.Cells[SCol, SRow] := Sexi;
    SetButtons;
  end end;//if
end;

procedure TGridSentence.exiBClick(Sender: TObject);
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    if                GetKeyState(VK_SHIFT) < 0 then begin
      MakeExi('1');
    end else begin if GetKeyState(VK_MENU) < 0 then begin
      MakeExi('2');
    end else begin
      MakeExi('0');
    end end;//if
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
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Ssent;
    Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow + 1);
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
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Ssent;
    Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow + 1);
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
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Ssent;
    Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow + 1);
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
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Ssent;
    Grid.Cells[SCol + 2, SRow + 1] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow + 1);
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
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Ssent;
    SetFocusPosition(SCol + 1, SRow + 1);
  end;//if
end;

procedure TGridSentence.truBClick(Sender: TObject);
  var
    MRow : Integer;
begin
  if Grid.Cells[SCol, SRow] = ' ' + Ssent then begin
    Grid.Cells[SCol, SRow] := Stru;
    MRow := FindRow(SCol + 1);
    if MRow = FirstEmptyRow then begin
      SetFocusPosition(0, 0);
    end else begin
      SetFocusPosition(SCol + 1, MRow);
    end;//if
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
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Sterm;
    Grid.Cells[SCol + 2, SRow + 1] := ' ' +Sterm;
    SetFocusPosition(SCol + 1, SRow + 1);
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
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Sterm;
    Grid.Cells[SCol + 2, SRow + 1] := ' ' + Sterm;
    SetFocusPosition(SCol + 1, SRow + 1);
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
    Grid.Cells[SCol + 1, SRow + 1] := ' ' + Sterm;
    SetFocusPosition(SCol + 1, SRow + 1);
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
  SaveSentence0;
end;

procedure TGridSentence.SearchBClick(Sender: TObject);
begin
  SearchSentence;
end;

procedure TGridSentence.OperationsGDblClick(Sender: TObject);
  var
    Oper : TOper;
    St : String;
begin
  if HauptF.OperationsDS.DataSet <> Nil then begin
    Oper.Operation := HauptF.OperationsDS.DataSet.FieldByName('Operation').Value;
    St := HauptF.OperationsDS.DataSet.FieldByName('OPut').Value;
    Oper.OPut := St[1];
    Oper.Number := HauptF.OperationsDS.DataSet.FieldByName('Number').Value;
    PutRelFun(Oper);
  end;//if
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

function TGridSentence.FindTerm(ACol, ARow : Integer) : Integer;
// Se aplica numai la '+' adica la Slnk
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
    if Grid.Cells[ACol, Result] = Slnk then begin
      found := True;
    end else begin
      Dec(Result);
    end;
  end;//while
end;

function TGridSentence.GetStepsToQuant(Sell, Qell : TCell) : Integer;
// Qell trebuie sa fie un cuantificator.
// Sell trebuie sa fie in dreapta lui Qell.
// Citi cuantificatori sunt de la Sell la Qell.
  var
    Cell : TCell;
    found : Boolean;
begin
  Result := 0;
  Cell := Parent(Sell);
  found := False;
  while (Cell.Col > -1) and (Qell.Col <= Cell.Col) and (not found) do begin
    if
      (Grid.Cells[Cell.Col, Cell.Row] = Suni)
      or (Grid.Cells[Cell.Col, Cell.Row] = Sexi)
      or (Grid.Cells[Cell.Col, Cell.Row] = Sgen)
    then begin
      Inc(Result);
    end;//if
    if Qell.Col = Cell.Col then begin
      found := True;
    end else begin
      Cell := Parent(Cell);
    end;//if
  end;//while
  if not found then begin
    Result := 0;
  end;//if
end;

procedure TGridSentence.SetLink(ACol, ARow : Integer);
// Defineste un link nou.
  var
    LCol, DRow : Integer;
    St : String;
    Qell, Sell : TCell;
    nr : Integer;
begin
  if UpIsEmpty(ACol, ARow) then begin
    LCol := FindLeft(ACol, ARow);
    DRow := FindTerm(ACol, ARow);
    if (LCol <> -1) and (DRow <> -1) then begin
      St := Grid.Cells[LCol, ARow];
      if (St = Suni) or (St = Sexi) or (St = Sgen) then begin
        if Grid.Cells[ACol, DRow] = ' ' + Sterm then begin
          Qell.Col := LCol;
          Qell.Row := ARow;
          Sell.Col := ACol;
          Sell.Row := DRow;
          nr := GetStepsToQuant(Sell, Qell);
          if nr > 0 then begin
            Grid.Cells[ACol, ARow] := Slnk;  // sus
            Grid.Cells[ACol, DRow] := Spoi + Sterm + IntToStr(nr);  // jos
          end;//if
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

function TGridSentence.GetQuantRow(ACol, ARow, Number : Integer) : Integer;
// Se aplica pe o celula in care vrem sa facem un Spoi.
// Resultatul e linia celui de-al Number-lea cuantificator.
  var
    k : Integer;
    St : String;
    QCol, QRow : Integer;
begin
  QRow := ARow - 1;
  k := 0;
  while (QRow >= 0) and (k < Number) do begin
    QCol := FindLeft(ACol, QRow);
    St := Grid.Cells[QCol, QRow];
    if (St = Suni) or (St = Sexi) or (St = Sgen) then begin
      Inc(k);
    end;//
    if k < Number then begin
      QRow := QRow - 1;
    end;//if
  end;//while
  Result := QRow;
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
// Poate da FirstEmptyRow
begin
  Result.Col := Cell.Col + 1;
  Result.Row := FindRow(Result.Col);
end;

procedure TGridSentence.PutStringSentence(Sentence : String);
  var
    i, j : Integer;
    Ch : Char;
    Number : Integer;
    nr, p, k : Integer;
    ACol, ARow : Integer;
    Cell : TCell;
begin
  StringList.Clear;
  if Sentence <> '' then begin
    Grid.ColCount := GridColCount;
    Grid.RowCount := GridRowCount;
    i := 1;
    nr := Length(Sentence);
    for i := 1 to nr do begin
      StringList.Append('0');
    end;//for
    StringSentence.SetSentence(Sentence);
    i := 1;
    ACol := 0;
    //ARow := 0;
    while i <= nr do begin
      Ch := Sentence[i];
      ARow := StrToInt(StringList.Strings[i - 1]);
      if Ch = '(' then begin
        j := StringSentence.FirstPosAfter(i);
        for k := i + 1 to j - 1 do begin
          StringList.Strings[k - 1] := IntToStr(StrToInt(StringList.Strings[k - 1]) + 1);
        end;//for
        p := PosEx(')', Sentence, i + 1);
        j := StringSentence.JumpOverNumber(p + 2);
        GrowGridTilPos(ACol, ARow + p - i - 2);
        Grid.Cells[ACol, ARow] :=
          Copy(Sentence, i + 1, p - i - 1) +
          Sentence[p + 1] +
          Copy(Sentence, p + 2, j - p - 2)
        ;
        for k := 1 to p - i - 2 do begin
          Grid.Cells[ACol, ARow + k] := Sentence[i + k + 1];
        end;//for
        i := j;
        Inc(ACol);
      end else begin if Ch = Spoi then begin
        GrowGridTilPos(ACol, ARow);
        Inc(i);
        Number := StringSentence.GetNumber(i);
        Grid.Cells[ACol, ARow] := Spoi + Sterm + IntToStr(Number);
        Grid.Cells[ACol, GetQuantRow(ACol, ARow, Number)] := Slnk;
        Inc(ACol);
      end else begin
        GrowGridTilPos(ACol, ARow);
        Grid.Cells[ACol, ARow] := Ch;
        j := StringSentence.FirstPosAfter(i);
        for k := i + 1 to j - 1 do begin
          StringList.Strings[k - 1] := IntToStr(StrToInt(StringList.Strings[k - 1]) + 1);
        end;//for
        Inc(i);
        Inc(ACol);
      end end;//if
    end;//while
    SetFocusPosition(0, 0);
  end;//if
end;

function TGridSentence.GetStepForLink(Sent, Link : Integer) : Integer;
// Result e 0 la esec.
begin
  Result := 0;
  if Link <> 0 then begin
    try
      HauptF.StepSP.ParamByName('Sentence').Value := Sent;
      HauptF.StepSP.ExecProc;
      Result := HauptF.StepSP.ParamByName('Step').Value;

      HauptF.StepsIQ.ParamByName('Sentence').Value := Sent;
      HauptF.StepsIQ.ParamByName('Step').Value := Result;
      HauptF.StepsIQ.ParamByName('Arg').Clear;
      HauptF.StepsIQ.ParamByName('SArg').Clear;
      HauptF.StepsIQ.ParamByName('Rule').Value := 0;
      HauptF.StepsIQ.ParamByName('Link').Value := Link;
      HauptF.StepsIQ.ParamByName('Col').Clear;
      HauptF.StepsIQ.ParamByName('SCol').Clear;
      HauptF.StepsIQ.ExecSQL;

      HauptF.SetSentenceToStep(
        HauptF.GetSentenceFromDatabase(Link),
        Sent,
        Result
      );
    except
      on E : Exception do begin
        if E is EDatabaseError then begin
          Beep;
          //MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
        end else begin
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
        Result := 0;
      end;//on
    end;//try
  end;//if
end;

function TGridSentence.GetStepForSentence(
  Sent, Arg, SArg, Rule, Col, SCol : Integer;
  Sentence : String
) : Integer;
// Result e 0 la esec.
// Trebuie sa fie apelata intr-o tranzactie.
begin
  Result := 0;
  if Sentence <> '' then begin
    HauptF.StepSP.ParamByName('Sentence').Value := Sent;
    HauptF.StepSP.ExecProc;
    Result := HauptF.StepSP.ParamByName('Step').Value;

    HauptF.StepsIQ.ParamByName('Sentence').Value := Sent;
    HauptF.StepsIQ.ParamByName('Step').Value := Result;
    if Arg <> 0 then begin
      HauptF.StepsIQ.ParamByName('Arg').Value := Arg;
    end else begin
      HauptF.StepsIQ.ParamByName('Arg').Clear;
    end;//if
    if SArg <> 0 then begin
      HauptF.StepsIQ.ParamByName('SArg').Value := SArg;
    end else begin
      HauptF.StepsIQ.ParamByName('SArg').Clear;
    end;//if
    HauptF.StepsIQ.ParamByName('Rule').Value := Rule;
    HauptF.StepsIQ.ParamByName('Link').Clear;
    if Col >= 0 then begin
      HauptF.StepsIQ.ParamByName('Col').Value := Col;
    end else begin
      HauptF.StepsIQ.ParamByName('Col').Clear;
    end;//if
    if SCol >= 0 then begin
      HauptF.StepsIQ.ParamByName('SCol').Value := SCol;
    end else begin
      HauptF.StepsIQ.ParamByName('SCol').Clear;
    end;//if
    HauptF.StepsIQ.ExecSQL;
    HauptF.SetSentenceToStep(
      Sentence,
      Sent,
      Result
    );
  end;//if
end;

function TGridSentence.GetSCol : Integer;
begin
  Result := SCol;
end;

function TGridSentence.GetSRow : Integer;
begin
  Result := SRow;
end;

function TGridSentence.GetOldSCol : Integer;
begin
  Result := OldSCol;
end;

function TGridSentence.GetOldSRow : Integer;
begin
  Result := OldSRow;
end;

function TGridSentence.GetCurrCell : String;
begin
  Result := Grid.Cells[SCol, SRow];
end;

procedure TGridSentence.CopyToClipboard;
  var
    ORect, NRect : TRect;
    W, H : Integer;
    Width, Height : Integer;
    Bitmap : TBitmap;
    AData : THandle;
    APalette : HPALETTE;
    MyFormat : Word;
begin
  W := Grid.DefaultColWidth + 1;
  H := Grid.DefaultRowHeight + 1;
  Width := FirstEmptyCol * W;
  Height := FirstEmptyRow * H;

  ORect := Rect(2, 2, Width + 2, Height + 2);
  NRect := Rect(0, 0, Width, Height);

  Bitmap := TBitmap.Create;
  try
    Bitmap.SetSize(Width + 3, Height + 3);
    Bitmap.Canvas.CopyRect(ORect, Grid.Canvas, NRect);
    Bitmap.Canvas.Pen.Color := clSilver;
    Bitmap.Canvas.Pen.Width := 1;
    Bitmap.Canvas.PenPos := Point(0, 0);
    Bitmap.Canvas.LineTo(Width + 2, 0);
    Bitmap.Canvas.LineTo(Width + 2, Height + 2);
    Bitmap.Canvas.LineTo(0, Height + 2);
    Bitmap.Canvas.LineTo(0, 0);
    Bitmap.SaveToClipboardFormat(MyFormat, AData, APalette);
    ClipBoard.SetAsHandle(MyFormat, AData);
  finally
    Bitmap.Free;
  end;//try
end;

function TGridSentence.ColInContent : Boolean;
begin
  Result := False;
  if SCol < FirstEmptyCol then begin
    Result := True;
  end else begin
    MessageDlg('The position on the grid must be in the content!', mtWarning, [mbOK], 0);
  end;//if
end;

function TGridSentence.ColsInContent : Boolean;
  var
    fec : Integer;
begin
  Result := False;
  fec := FirstEmptyCol;
  if SCol < fec then begin
    if OldSCol < fec then begin
      if SCol <> OldSCol then begin
        Result := True;
      end else begin
        MessageDlg('The positions on the grid must be different!', mtWarning, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('The positions on the grid must be in the content!', mtWarning, [mbOK], 0);
    end;//if
  end else begin
    MessageDlg('The positions on the grid must be in the content!', mtWarning, [mbOK], 0);
  end;//if
end;

procedure TGridSentence.ClientSetPosition(i : Integer);
  var
    ACol, ARow : Integer;
begin
  if i > 0 then begin
    ACol := i - 1;
    ARow := FindRow(ACol);
    if ARow < FirstEmptyRow then begin
      SetFocusPosition(ACol, ARow);
    end else begin
      Beep;
    end;//if
  end else begin
    Beep;
  end;//if
end;

procedure TGridSentence.Clear;
begin
  SetFocusPosition(0, 0);
  Delete(0, 0);
end;

procedure TGridSentence.SetFocusUser(i : Integer);
begin
  SetFocusPosition(i - 1, FindRow(i - 1));
end;

end.
