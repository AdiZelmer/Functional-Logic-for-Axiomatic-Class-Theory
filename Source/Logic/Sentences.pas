unit Sentences;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AZExtender, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBCtrls, Vcl.DBGrids, Data.DB, IBODataset, GridSentenceU, StringSentenceU;

type
  TSentencesF = class(TForm)
    Extender: TAZExtender;
    Panel1: TPanel;
    Navigator: TAZNavigator;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    SentencesT: TIBOTable;
    SentencesTSENTENCE: TIntegerField;
    SentencesTTITLE: TStringField;
    SentencesTDESCRIPTION: TMemoField;
    SentencesTKIND: TStringField;
    SentencesDS: TDataSource;
    Panel3: TPanel;
    SentencesG: TDBGrid;
    DBMemo1: TDBMemo;
    CurrGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure SentencesGDblClick(Sender: TObject);
    procedure SentencesGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure SentencesTAfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    GridCurrSent : TGridSentence;
    StringSentence : TStringSentence;
  public
    { Public declarations }
  end;

var
  SentencesF: TSentencesF;

implementation

{$R *.dfm}

procedure TSentencesF.Button1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSentencesF.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSentencesF.FormCreate(Sender: TObject);
begin
  GridCurrSent := TGridSentence.Create;
  GridCurrSent.DefineComponents(
    CurrGrid,
    Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil,
    Nil, Nil, Nil, Nil, Nil,
    Nil
  );
  StringSentence := TStringSentence.Create;
  SentencesT.Open;
end;

procedure TSentencesF.FormDestroy(Sender: TObject);
begin
  GridCurrSent.Free;
  StringSentence.Free;
end;

procedure TSentencesF.SentencesGDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSentencesF.SentencesGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Ord('C') then begin
    if [ssShift, ssCtrl] = Shift then begin
      ModalResult := mrOK;
    end;//if
  end;//if
end;

procedure TSentencesF.SentencesTAfterScroll(DataSet: TDataSet);
begin
  GridCurrSent.Delete(0, 0);
  if not SentencesT.IsEmpty then begin
    GridCurrSent.PutStringSentence(
      StringSentence.GetSentenceFromDatabase(SentencesT.FieldByName('Sentence').Value)
    );
  end;//if
end;

end.
