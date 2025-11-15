unit Haupt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, StdCtrls, Grids, DBGrids, Mask, DBCtrls, AZExtender, System.Variants,
  Menus, IB_Components, IBODataset, System.UITypes, IB_Access, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ClipBrd, CommonDefs, GridSentenceU, StringSentenceU, View;

type
  THauptF = class(TForm)
    Panel1: TPanel;
    Navigator: TAZNavigator;
    Panel2: TPanel;
    StatusPanel: TPanel;
    MessagePanel: TPanel;
    Activator: TAZActivator;
    LogicDB: TIBODatabase;
    OperationQ: TIBOQuery;
    OperationQIPUT: TStringField;
    OperationQOPUT: TStringField;
    OperationQNUMBER: TIntegerField;
    OperationsIQ: TIBOQuery;
    SentencesIQ: TIBOQuery;
    DetailsIQ: TIBOQuery;
    SentenceSP: TIBOStoredProc;
    DetailsQ: TIBOQuery;
    DetailsQOPERATION: TStringField;
    DetailsQLINK: TIntegerField;
    DetailsQOPUT: TStringField;
    DetailsQNUMBER: TIntegerField;
    StepsIQ: TIBOQuery;
    StepSP: TIBOStoredProc;
    EditProofPC: TPageControl;
    SentencesRulesPC: TPageControl;
    EditTS: TTabSheet;
    ProofTS: TTabSheet;
    SentencesTS: TTabSheet;
    InferencesTS: TTabSheet;
    SentencesT: TIBOTable;
    SentencesTSENTENCE: TIntegerField;
    SentencesTTITLE: TStringField;
    SentencesTDESCRIPTION: TMemoField;
    SentencesTKIND: TStringField;
    SentencesDS: TDataSource;
    EditGrid: TStringGrid;
    Panel3: TPanel;
    uniB: TSpeedButton;
    exiB: TSpeedButton;
    apaB: TSpeedButton;
    orxB: TSpeedButton;
    eqaB: TSpeedButton;
    douB: TSpeedButton;
    impB: TSpeedButton;
    notB: TSpeedButton;
    andB: TSpeedButton;
    truB: TSpeedButton;
    DefineB: TSpeedButton;
    genB: TSpeedButton;
    SaveB: TSpeedButton;
    DeleteB: TSpeedButton;
    setB: TSpeedButton;
    Splitter1: TSplitter;
    SentencesG: TDBGrid;
    Extender: TAZExtender;
    USentencesT: TIBOTable;
    USentencesTSENTENCE: TIntegerField;
    USentencesTTITLE: TStringField;
    USentencesTDESCRIPTION: TMemoField;
    USentencesTKIND: TStringField;
    USentencesTOPERATION: TStringField;
    USentencesDS: TDataSource;
    StepsDS: TDataSource;
    RulesT: TIBOTable;
    RulesTRULE: TIntegerField;
    RulesTTITLE: TStringField;
    RulesTDESCRIPTION: TMemoField;
    RulesTFUNC: TStringField;
    RulesTNUMBER: TIntegerField;
    RulesDS: TDataSource;
    RulesG: TDBGrid;
    DBMemo3: TDBMemo;
    ChangeKindQ: TIBOQuery;
    ChangeKindOpUQ: TIBOQuery;
    SentencesDQ: TIBOQuery;
    OperationsDS: TDataSource;
    FormsQ: TIBOQuery;
    FormsQOPERATION: TStringField;
    FormsQTITLE: TStringField;
    FormsQOPUT: TStringField;
    FormsQNUMBER: TIntegerField;
    FormsQSENTENCE: TIntegerField;
    FormsQSTITLE: TStringField;
    StepsQ: TIBOQuery;
    StepsQSTEP: TIntegerField;
    StepsQARG: TIntegerField;
    StepsQSARG: TIntegerField;
    StepsQRULE: TIntegerField;
    StepsQLINK: TIntegerField;
    StepsQTITLE: TStringField;
    StepsQFORMULA: TStringField;
    StepsQSENTENCE: TIntegerField;
    StepsQCOL: TIntegerField;
    StepsQSCOL: TIntegerField;
    FormulasT: TIBOTable;
    FormulasTRULE: TIntegerField;
    FormulasTTITLE: TStringField;
    FormulasTDESCRIPTION: TMemoField;
    FormulasTFORMULA: TStringField;
    FormulasDS: TDataSource;
    FormulasTS: TTabSheet;
    FormulasG: TDBGrid;
    FormulasM: TDBMemo;
    ReductioQ: TIBOQuery;
    ReductioQSTEP: TIntegerField;
    RulesTC: TIBOTable;
    RulesTCRULE: TIntegerField;
    RulesTCTITLE: TStringField;
    RulesTCDESCRIPTION: TMemoField;
    RulesTCFORMULA: TStringField;
    RulesTCARG1: TStringField;
    RulesTCARG2: TStringField;
    RulesTCFUNC: TStringField;
    RulesTCNUMBER: TIntegerField;
    Panel6: TPanel;
    Label1: TLabel;
    FilterE: TEdit;
    FormulaB: TButton;
    EmptyFilterB: TButton;
    StepsPM: TPopupMenu;
    SaveDialog1: TSaveDialog;
    TermsQ: TIBOQuery;
    NixQ: TIBOQuery;
    TermsQOPERATION: TStringField;
    TermsQTITLE: TStringField;
    TermsQOPUT: TStringField;
    TermsQNUMBER: TIntegerField;
    TermsQSENTENCE: TIntegerField;
    TermsQSTITLE: TStringField;
    NixQOPERATION: TStringField;
    NixQTITLE: TStringField;
    NixQOPUT: TStringField;
    NixQNUMBER: TIntegerField;
    NixQSENTENCE: TIntegerField;
    NixQSTITLE: TStringField;
    OperationsG: TDBGrid;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    USentencesG: TDBGrid;
    DBMemo2: TDBMemo;
    ProoGrid: TStringGrid;
    Panel7: TPanel;
    StepsG: TDBGrid;
    StepGrid: TStringGrid;
    Panel8: TPanel;
    DBMemo1: TDBMemo;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    Splitter8: TSplitter;
    DeleteProofSP: TIBOStoredProc;
    Panel9: TPanel;
    AxiomCB: TCheckBox;
    TheoremCB: TCheckBox;
    RelationCB: TCheckBox;
    FunctionCB: TCheckBox;
    UnprovedCB: TCheckBox;
    SentencesPM: TPopupMenu;
    ProofPM: TPopupMenu;
    Saveproof2: TMenuItem;
    Savethesentencesoftheproof1: TMenuItem;
    Deleteproof2: TMenuItem;
    View1: TView;
    StepsTQ: TIBOQuery;
    StepsTQSTEP: TIntegerField;
    StepsTQARG: TIntegerField;
    StepsTQSARG: TIntegerField;
    StepsTQRULE: TIntegerField;
    StepsTQLINK: TIntegerField;
    StepsTQCOL: TIntegerField;
    StepsTQSCOL: TIntegerField;
    StepsTQFORMULA: TStringField;
    StepsTQTITLE: TStringField;
    Gotosentences1: TMenuItem;
    Gotofunctions1: TMenuItem;
    Gotoformulas1: TMenuItem;
    DeleteQuantifierQ: TIBOQuery;
    DeleteQuantifierQSENTENCE: TIntegerField;
    N1: TMenuItem;
    Loadproof1: TMenuItem;
    OpenDialog1: TOpenDialog;
    StepsVQ: TIBOQuery;
    StepsVQSTEP: TIntegerField;
    StepsVQARG: TIntegerField;
    StepsVQSARG: TIntegerField;
    StepsVQRULE: TIntegerField;
    StepsVQLINK: TIntegerField;
    StepsVQCOL: TIntegerField;
    StepsVQSCOL: TIntegerField;
    StepsVQFORMULA: TStringField;
    DefinitionsTS: TTabSheet;
    DefinitionsQ: TIBOQuery;
    DefinitionsQOPERATION: TStringField;
    DefinitionsQNUMBER: TIntegerField;
    DefinitionsQSENTENCE: TIntegerField;
    DefinitionsQTITLE: TStringField;
    DefinitionsQKIND: TStringField;
    DefinitionsDS: TDataSource;
    DefinitionsQDESCRIPTION: TMemoField;
    Panel10: TPanel;
    DefinitionsG: TDBGrid;
    DBMemo4: TDBMemo;
    OSentencesQ: TIBOQuery;
    OSentencesQSENTENCE: TIntegerField;
    OSentencesQTITLE: TStringField;
    OSentencesQDESCRIPTION: TMemoField;
    OSentencesQKIND: TStringField;
    OSentencesDS: TDataSource;
    Panel11: TPanel;
    OSentencesG: TDBGrid;
    DefiGrid: TStringGrid;
    Splitter9: TSplitter;
    Splitter10: TSplitter;
    DBMemo5: TDBMemo;
    QuantifiersQ: TIBOQuery;
    QuantifiersQQNR: TIntegerField;
    QuantifiersQQNAME: TStringField;
    MatrixTextPC: TPageControl;
    MatrixTS: TTabSheet;
    SentGrid: TStringGrid;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel12: TPanel;
    TextTS: TTabSheet;
    QuantifiersT: TIBOTable;
    QuantifiersTSENTENCE: TIntegerField;
    QuantifiersTQNR: TIntegerField;
    QuantifiersTQNAME: TStringField;
    QuantifiersDS: TDataSource;
    SentencesM: TMemo;
    QuantifiersG: TDBGrid;
    QuantifiersNumberQ: TIBOQuery;
    QuantifiersNumberQNUMBER: TIntegerField;
    UsedTS: TTabSheet;
    UsingTS: TTabSheet;
    UsedQ: TIBOQuery;
    UsedQSENTENCE: TIntegerField;
    UsedQTITLE: TStringField;
    UsedQDESCRIPTION: TMemoField;
    UsedQKIND: TStringField;
    UsedDS: TDataSource;
    UsingQ: TIBOQuery;
    UsingQSENTENCE: TIntegerField;
    UsingQTITLE: TStringField;
    UsingQDESCRIPTION: TMemoField;
    UsingQKIND: TStringField;
    UsingDS: TDataSource;
    UsedG: TDBGrid;
    UsingG: TDBGrid;
    CategoriesT: TIBOTable;
    CategoriesTCATEGORY: TIntegerField;
    CategoriesTTITLE: TStringField;
    CategoriesDS: TDataSource;
    CategoriesTS: TTabSheet;
    CategorySP: TIBOStoredProc;
    Panel15: TPanel;
    CategoriesG: TDBGrid;
    Splitter3: TSplitter;
    VCatSenT: TIBOTable;
    VCatSenTSENTENCE: TIntegerField;
    VCatSenTCATEGORY: TIntegerField;
    VCatSenTTITLE: TStringField;
    VCatSenTKIND: TStringField;
    VCatSenTDESCRIPTION: TMemoField;
    VCatSenDS: TDataSource;
    VCatSenG: TDBGrid;
    Splitter4: TSplitter;
    CateGrid: TStringGrid;
    VSenCatT: TIBOTable;
    VSenCatTSENTENCE: TIntegerField;
    VSenCatTCATEGORY: TIntegerField;
    VSenCatTTITLE: TStringField;
    VSenCatDS: TDataSource;
    CategoryTS: TTabSheet;
    VSenCatG: TDBGrid;
    Memo1: TMemo;
    SentencesTAUX: TStringField;
    UsedQAUX: TStringField;
    UsingQAUX: TStringField;
    OSentencesQAUX: TStringField;
    VCatSenTAUX: TStringField;
    USentencesTAUX: TStringField;
    AuxCB: TCheckBox;
    CopySentence1: TMenuItem;
    SwitchAux1: TMenuItem;
    ProofHasSentenceQ: TIBOQuery;
    GetKindQ: TIBOQuery;
    SentView: TView;
    GeneralPM: TPopupMenu;
    Verifyalltheproofs1: TMenuItem;
    Extractallthesentences1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GeneralB: TBitBtn;
    SentencesTQ: TIBOQuery;
    SentencesTQSENTENCE: TIntegerField;
    SentencesTQTITLE: TStringField;
    SentencesTQKIND: TStringField;
    Verifyproof1: TMenuItem;
    SentenceExistsSP: TIBOStoredProc;
    Panel16: TPanel;
    Label2: TLabel;
    OperationsB: TButton;
    OperationsE: TEdit;
    SearchB: TSpeedButton;
    StepDetailsIQ: TIBOQuery;
    StepDetailsQ: TIBOQuery;
    SentencesQ: TIBOQuery;
    FirstDifPosSP: TIBOStoredProc;
    N2: TMenuItem;
    Sevesentenceat1: TMenuItem;
    Loadproofat1: TMenuItem;
    N3: TMenuItem;
    Copysentencetoclipboard1: TMenuItem;
    Savethestepsoftheproof1: TMenuItem;
    Extractsentencesastext1: TMenuItem;
    FromToView1: TFromToView;
    QuantIQ: TIBOQuery;
    procedure Empty1Click(Sender: TObject);
    procedure Time1Click(Sender: TObject);
    procedure Forward1Click(Sender: TObject);
    procedure Backward1Click(Sender: TObject);
    procedure Sidebyside1Click(Sender: TObject);
    procedure Overlapping1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SentencesTDESCRIPTIONGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure SentencesTAfterScroll(DataSet: TDataSet);
    procedure EditGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SentencesGExit(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure USentencesTAfterScroll(DataSet: TDataSet);
    procedure SentencesTAfterPost(DataSet: TDataSet);
    procedure SentencesTBeforeInsert(DataSet: TDataSet);
    procedure SentencesGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SentencesTAfterDelete(DataSet: TDataSet);
    procedure SentencesGDblClick(Sender: TObject);
    procedure RulesGDblClick(Sender: TObject);
    procedure RulesGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SentencesTAfterRefresh(DataSet: TDataSet);
    procedure USentencesGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure OperationsGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure USentencesTAfterRefresh(DataSet: TDataSet);
    procedure StepsQAfterScroll(DataSet: TDataSet);
    procedure FormulasGDblClick(Sender: TObject);
    procedure FormulasGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterEChange(Sender: TObject);
    procedure FormulaBClick(Sender: TObject);
    procedure FormulasTBeforeInsert(DataSet: TDataSet);
    procedure EmptyFilterBClick(Sender: TObject);
    procedure FilterEKeyPress(Sender: TObject; var Key: Char);
    procedure ProoGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StepGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SentGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure USentencesGDblClick(Sender: TObject);
    procedure StepsGDblClick(Sender: TObject);
    procedure AxiomCBClick(Sender: TObject);
    procedure TheoremCBClick(Sender: TObject);
    procedure RelationCBClick(Sender: TObject);
    procedure FunctionCBClick(Sender: TObject);
    procedure UnprovedCBClick(Sender: TObject);
    procedure Saveproof2Click(Sender: TObject);
    procedure Savethesentencesoftheproof1Click(Sender: TObject);
    procedure Deleteproof2Click(Sender: TObject);
    procedure Gotosentences1Click(Sender: TObject);
    procedure Gotofunctions1Click(Sender: TObject);
    procedure Gotoformulas1Click(Sender: TObject);
    procedure Loadproof1Click(Sender: TObject);
    procedure Verifyproof1Click(Sender: TObject);
    procedure OSentencesQAfterScroll(DataSet: TDataSet);
    procedure OSentencesQAfterRefresh(DataSet: TDataSet);
    procedure DefinitionsDSDataChange(Sender: TObject; Field: TField);
    procedure OSentencesGDblClick(Sender: TObject);
    procedure QuantifiersGExit(Sender: TObject);
    procedure MatrixTextPCChange(Sender: TObject);
    procedure QuantifiersTAfterPost(DataSet: TDataSet);
    procedure QuantifiersTAfterDelete(DataSet: TDataSet);
    procedure StepsQDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure StepsQPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure SentencesTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure SentencesTDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure RulesTDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure RulesTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormulasGExit(Sender: TObject);
    procedure RulesGExit(Sender: TObject);
    procedure FormulasTDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormulasTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QuantifiersTDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QuantifiersTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QuantifiersTNewRecord(DataSet: TDataSet);
    procedure QuantifiersTBeforePost(DataSet: TDataSet);
    procedure UsedQDESCRIPTIONGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UsingQDESCRIPTIONGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UsedGDblClick(Sender: TObject);
    procedure UsingGDblClick(Sender: TObject);
    procedure EditGridKeyPress(Sender: TObject; var Key: Char);
    procedure USentencesGKyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StepsGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DefinitionsGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OSentencesGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CategoriesTDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CategoriesTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CategoriesTNewRecord(DataSet: TDataSet);
    procedure CategoriesTAfterPost(DataSet: TDataSet);
    procedure CategoriesTAfterInsert(DataSet: TDataSet);
    procedure VCatSenTDESCRIPTIONGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure VCatSenTDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VCatSenTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CategoriesGExit(Sender: TObject);
    procedure VCatSenGExit(Sender: TObject);
    procedure VCatSenTAfterPost(DataSet: TDataSet);
    procedure VCatSenTBeforeEdit(DataSet: TDataSet);
    procedure VCatSenTAfterScroll(DataSet: TDataSet);
    procedure CategoriesTAfterScroll(DataSet: TDataSet);
    procedure VSenCatGExit(Sender: TObject);
    procedure VSenCatTDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VSenCatTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VSenCatTBeforeEdit(DataSet: TDataSet);
    procedure VCatSenTAfterDelete(DataSet: TDataSet);
    procedure VSenCatTAfterPost(DataSet: TDataSet);
    procedure VSenCatTAfterDelete(DataSet: TDataSet);
    procedure CategoriesGDblClick(Sender: TObject);
    procedure VSenCatTBeforeInsert(DataSet: TDataSet);
    procedure VCatSenGDblClick(Sender: TObject);
    procedure CategoriesTAfterDelete(DataSet: TDataSet);
    procedure DefiGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CateGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SentencesGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure UsedGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure UsingGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure OSentencesGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure VCatSenGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DefinitionsGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AuxCBClick(Sender: TObject);
    procedure CopySentence1Click(Sender: TObject);
    procedure SwitchAux1Click(Sender: TObject);
    procedure Verifyalltheproofs1Click(Sender: TObject);
    procedure Extractallthesentences1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure OperationsEChange(Sender: TObject);
    procedure OperationsBClick(Sender: TObject);
    procedure OperationsEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OperationsBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CategoriesGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VCatSenGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SentencesMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuantifiersGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UsedGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UsingGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VSenCatGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EmptyFilterBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormulaBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditProofPCChanging(Sender: TObject; var AllowChange: Boolean);
    procedure SentencesRulesPCChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Sevesentenceat1Click(Sender: TObject);
    procedure Loadproofat1Click(Sender: TObject);
    procedure Copysentencetoclipboard1Click(Sender: TObject);
    procedure Savethestepsoftheproof1Click(Sender: TObject);
    procedure DefinitionsGKeyPress(Sender: TObject; var Key: Char);
    procedure Extractsentencesastext1Click(Sender: TObject);
  private
    { Private declarations }
    EditGridSentence : TGridSentence;
    SentGridSentence : TGridSentence;
    ProoGridSentence : TGridSentence;
    StepGridSentence : TGridSentence;
    DefiGridSentence : TGridSentence;
    CateGridSentence : TGridSentence;
    StringSentence : TStringSentence;
    StepStringSentence : TStringSentence;

    CanInsert : Boolean;

    procedure DrawSentences(DataSet : TDataSet; Grid : TDBGrid);
    procedure SetSentenceFilter;
    procedure PutSentence(Sent : Integer);

    function AllQuantifAreUsed(
      SourceSentence : TStringSentence;
      StringList : TStringList;
      s : Integer
    ) : Boolean;
    function SatisfyCondition(
      SourceSentence : TStringSentence;
      DestinSentence : TStringSentence;
      StringList : TStringList;
      Qj, j, i : Integer
    ) : Boolean;
    function RecCondition(
      SourceSentence : TStringSentence;
      DestinSentence : TStringSentence;
      StringList : TStringList;
      Qj, j, i : Integer
    ) : Boolean;
    function Match(
      SourceSentence : TStringSentence;
      DestinSentence : TStringSentence;
      StringList : TStringList;
      i, j : Integer
    ) : String;
    function PrepareTheSecondArgument(
      SourceSentence : TStringSentence;
      DestinSentence : TStringSentence;
      StringList : TStringList;
      i, j : Integer
    ) : String;

    function ExecuteFunction(
      Sent, Arg, SArg, Rule, Link, Col, SCol : Integer;
      Formula : String
    ) : Integer;

    procedure ProofExistUnique;
    function HasExistence(Destin : String; i, Sent, Step : Integer) : Boolean;
    function DeleteQuantifier(Sent, Arg, Rule, Col, i : Integer) : Integer;
    function DeleteQuantifiers(Sent, Arg, Rule, Col, i : Integer) : Integer;
    function DeleteQuantifiersSentence(Sent, Arg, i : Integer) : String;
    function Reductio(Sentence : Integer) : Boolean;
    function FirstDifPos(Sentence, Step : Integer) : Integer;
    procedure VerifiesTheProof;
    function CrossReplacement(Source, Destin : String; j : Integer) : String;
    function ReducedCrossReplacement(Source, Destin : String; j : Integer) : String;
    function CrossAttachment(Source, Destin : String; j : Integer) : String;

    procedure VerifyProof(Msg : Boolean);
    function GetStepLineFromStepTQ : String;
    procedure GetColNr(nr : Integer; var ZLine, ULine : String);

    procedure ShowSentenceAsTree;  // nu e folosita
    procedure LoadProof(NewSent : Integer);
    procedure SetOperationsFilter(Ch : Char);
  public
    function OperationExists(Op : String) : Boolean;
    procedure WriteOperation(
      Operation, Title : String;
      IPut, OPut : Char;
      Number : Integer
    );
    function WriteSentence(
      Sentence : Integer;
      Title, Description : String;
      Kind : Char;
      Operation : String
    ) : Integer;
    procedure WriteDetail(
      Sentence, Detail : Integer;
      Operation : String;
      Link : Integer
    );
    procedure WriteStepDetail(
      Sentence, Step, Detail : Integer;
      Operation : String;
      Link : Integer
    );
    function GetSentenceFromStep(Sent, Step : Integer) : String;
    function GetSentenceFromDatabase(Sentence : Integer) : String;
    // Extrage din Details sententa.
    procedure GetQuantifierNames(Sent : Integer; Quanti : TStringList);
    function GetVariables(Sent : Integer) : String;
    procedure WriteVariables(Sent : Integer; Rind : String);
    procedure HVStringList(H, V : TStringList);  // Nu e folosita.
    procedure SetSentenceToStep(Sentence : String; Sent, Step : Integer);
    function FindSentence(Sentence : String) : Integer;
  end;

var
  HauptF: THauptF;
  LoginMitarbeiter : String;
  LoginRechte : SmallInt;

procedure MyNotNull(
  Sender: TField;
  const Text: String
);
procedure MyExitGrid(Sender: TObject);
function DataSetOK(DataSet : TDataSet) : Boolean;
function DataOK(Form : TForm) : Boolean;
function LowerChar(Ch : Char) : Char;
function UpperChar(Ch : Char) : Char;
procedure FormRefresh(Form : TForm);
function IsInteger(St : String) : Boolean;
function IsDatum(St : String) : Boolean;
procedure FillComboBox(
  DataSet : TDataSet;
  ComboBox : TComboBox;
  EmptyField : Boolean
);
procedure ChangeIndexFieldNames(Table : TIBOTable; IndexFieldNames : String);
procedure AutoIncrement(DataSet : TDataSet; StoredProc : TIBOStoredProc);
procedure RefreshRecord(DataSet : TIBODataSet);
function CtrlDown : Boolean;

implementation

{$R *.DFM}

uses
  Connection, ExistUniqueU, Save, Formula, VarSentence, TreeSentence, Functions;

procedure MyNotNull(Sender: TField; const Text: String);
begin
  if Text <> '' then begin
    Sender.AsString := Text;
  end else begin
    Sender.Clear;
  end;//if
end;

procedure MyExitGrid(Sender: TObject);
begin
  with (Sender as TDBGrid).DataSource do begin
    if DataSet.State in [dsInsert, dsEdit] then begin
      try
        DataSet.Post;
      except
        (Sender as TDBGrid).SetFocus;
      end;//try
    end;//if
  end;//with
end;//MyExitGrid

function DataSetOK(DataSet : TDataSet) : Boolean;
begin
  Result := True;
  if DataSet.State in [dsInsert, dsEdit] then begin
    try
      DataSet.Post;
    except
      Result := False;
    end;//try
  end;//if
end;

function DataOK(Form : TForm) : Boolean;
begin
  Result := True;
  with Form do begin
    if ActiveControl is TDBGrid then begin
      with (ActiveControl as TDBGrid).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end else begin if ActiveControl is TDBEdit then begin
      with (ActiveControl as TDBEdit).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end else begin if ActiveControl is TDBMemo then begin
      with (ActiveControl as TDBMemo).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end else begin if ActiveControl is TDBListBox then begin
      with (ActiveControl as TDBListBox).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end else begin if ActiveControl is TDBComboBox then begin
      with (ActiveControl as TDBComboBox).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end else begin if ActiveControl is TDBCheckBox then begin
      with (ActiveControl as TDBCheckBox).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end else begin if ActiveControl is TDBRadioGroup then begin
      with (ActiveControl as TDBRadioGroup).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end else begin if ActiveControl is TRadioButton then begin
      if TRadioButton(ActiveControl).Parent <> Nil then begin
        if TRadioButton(ActiveControl).Parent is TDBRadioGroup then begin
          with
            TDBRadioGroup(TRadioButton(ActiveControl).Parent).DataSource.DataSet
          do begin
            if State in [dsEdit, dsInsert] then begin
              try
                Post;
              except
                Result := False;
              end;//try
            end;//if
          end;//with
        end;//if
      end;//if
    end else begin if ActiveControl is TDBLookupComboBox then begin
      with (ActiveControl as TDBLookupComboBox).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end else begin if ActiveControl is TDBRichEdit then begin
      with (ActiveControl as TDBRichEdit).DataSource.DataSet do begin
        if State in [dsEdit, dsInsert] then begin
          try
            Post;
          except
            Result := False;
          end;//try
        end;//if
      end;//with
    end end end end end end end end end end;//if
  end;//with
end;//DataOK

function LowerChar(Ch : Char) : Char;
  var
    st : String;
begin
  st := LowerCase(Ch);
  Result := st[1];
end;

function UpperChar(Ch : Char) : Char;
  var
    st : String;
begin
  st := UpperCase(Ch);
  Result := st[1];
end;

function MyFindNextControl(
  ActiveForm : TForm;
  CurControl: TWinControl;
  GoForward, CheckTabStop, CheckParent: Boolean
): TWinControl;
  var
    I, StartIndex: Integer;
    List: TList;
begin
  Result := nil;
  List := TList.Create;
  try
    ActiveForm.GetTabOrderList(List);
    if List.Count > 0 then begin
      StartIndex := List.IndexOf(CurControl);
      if StartIndex = -1 then begin
        if GoForward then begin
          StartIndex := List.Count - 1;
        end else begin
          StartIndex := 0;
        end;//if
      end;//if
      I := StartIndex;
      repeat
        if GoForward then begin
          Inc(I);
          if I = List.Count then I := 0;
        end else begin
          if I = 0 then I := List.Count;
          Dec(I);
        end;
        CurControl := List[I];
        if
          CurControl.CanFocus and
          (not CheckTabStop or CurControl.TabStop) and
          (not CheckParent or (CurControl.Parent = ActiveForm))
        then begin
          Result := CurControl;
        end;//if
      until (Result <> nil) or (I = StartIndex);
    end;//if
  finally
    List.Destroy;
  end;
end;

procedure SendToControl(
  Control : TWinControl;
  st : String
);
  var
    hControl : HWND;
    nr, i : Integer;
begin
  hControl := Control.Handle;
  nr := Length(st);
  for i := 1 to nr do begin
    PostMessage(
      hControl,
      WM_CHAR,
      Word(st[i]),
      $00000001
    );
  end;//for
end;//SendToControl

procedure ClearField;
  const
    Work = [dsInsert, dsEdit];
begin
  if HauptF.ActiveMDIChild <> nil then begin
    with HauptF.ActiveMDIChild do begin
      if ActiveControl <> nil then begin
        if ActiveControl is TCustomDBGrid then begin
          if
            (ActiveControl as TCustomDBGrid).SelectedField.DataSet.State in Work
          then begin
            (ActiveControl as TCustomDBGrid).SelectedField.Clear;
          end else begin
            MessageDlg('Zuerst Edit!', mtWarning, [mbOK], 0);
          end;//if
        end else begin if ActiveControl is TDBEdit then begin
          with (ActiveControl as TDBEdit).DataSource.DataSet do begin
            if State in Work then begin
              FieldByName((ActiveControl as TDBEdit).DataField).Clear;
            end else begin
              MessageDlg('Zuerst Edit!', mtWarning, [mbOK], 0);
            end;//if
          end;//with
        end else begin if ActiveControl is TDBComboBox then begin
          with (ActiveControl as TDBComboBox).DataSource.DataSet do begin
            if State in Work then begin
              FieldByName((ActiveControl as TDBComboBox).DataField).Clear;
            end else begin
              MessageDlg('Zuerst Edit!', mtWarning, [mbOK], 0);
            end;//if
          end;//with
        end end end;//if
      end;//if
    end;//with
  end;//if
end;//ClearField

procedure TimeToField;
begin
  if HauptF.ActiveMDIChild <> nil then begin
    with HauptF.ActiveMDIChild do begin
      if ActiveControl <> nil then begin
        SendToControl(ActiveControl, DateTimeToStr(Now));
      end;//if
    end;//with
  end;//if
end;//FieldFromClipboard

procedure FormRefresh(Form : TForm);
  var
    Index : Integer;
begin
  with Form do begin
    for Index := 0 to ComponentCount - 1 do begin
      if Components[Index] is TIBOTable then begin
        if (Components[Index] as TIBOTable).Active then begin
          (Components[Index] as TIBOTable).Refresh;
        end;//if
      end else begin if Components[Index] is TIBOQuery then begin
        if (Components[Index] as TIBOQuery).Active then begin
          (Components[Index] as TIBOQuery).Refresh;
        end;//if
      end else begin if Components[Index] is TDataSet then begin
        if (Components[Index] as TDataSet).Active then begin
          (Components[Index] as TDataSet).Refresh;
        end;//if
      end end end;//if
    end;//for
  end;//with
end;

function IsInteger(St : String) : Boolean;
  var
    i : Integer;
begin
  Result := True;
  if St <> '' then begin
    try
      i := StrToInt(St);
    except
      MessageDlg(St + ' ist keine ganze Zahl!', mtError, [mbOK], 0);
      Result := False;
    end;//if
  end;//if
end;

function IsDatum(St : String) : Boolean;
  var
    Datum : TDateTime;
begin
  Result := True;
  if St <> '' then begin
    try
      Datum := StrToDateTime(St);
    except
      MessageDlg(St + ' ist kein Datum!', mtWarning, [mbOK], 0);
      Result := False;
    end;//if
  end;//if
end;

procedure FillComboBox(
  DataSet : TDataSet;
  ComboBox : TComboBox;
  EmptyField : Boolean
);
begin
  DataSet.Open;
  try
    if EmptyField then begin
      ComboBox.Items.Add('');
    end;//if
    while not DataSet.EOF do begin
      ComboBox.Items.Add(DataSet.Fields[0].AsString);
      DataSet.Next;
    end;//while
    if ComboBox.Items.Count > 0 then begin
      ComboBox.ItemIndex := 0;
    end;//if
  finally
    DataSet.Close;
  end;//try
end;

procedure ChangeIndexFieldNames(Table : TIBOTable; IndexFieldNames : String);
  var
    Bookmark : TBookmark;
begin
  Bookmark := Table.GetBookmark;
  try
    Table.Close;
    try
      Table.IndexFieldNames := IndexFieldNames;
    finally
      Table.Open;
    end;//try
    try
      Table.GotoBookmark(Bookmark);
    except
    end;//try
  finally
    Table.FreeBookmark(Bookmark);
  end;//try
end;

procedure THauptF.FilterEChange(Sender: TObject);
  const
    Filter = '(Rule > 0) and (Func is Null)';
begin
  if FilterE.Text <> '' then begin
    FormulasT.Filter :=
      Filter + ' and (Arg1 like ''' + FilterE.Text + '%'')';
    {
    FormulasT.Filter :=
      Filter +
      ' and ((Arg1 like ''' + FilterE.Text + '%'') or (Arg2 like ''' + FilterE.Text + '%''))'
    ;
    }
  end else begin
    FormulasT.Filter := Filter;
  end;//if
  Extender.SynchronizeFilter(FormulasT);
end;

procedure THauptF.FilterEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      FormulasG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      EmptyFilterB.SetFocus;
    end end;//if
  end else begin if Key = VK_RETURN then begin
    FormulasG.SetFocus;
  end end;//if
end;

procedure THauptF.FilterEKeyPress(Sender: TObject; var Key: Char);
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

procedure THauptF.FormActivate(Sender: TObject);
begin
  FormRefresh(Self);
  {
  if EditProofPC.ActivePage = EditTS then begin
    EditGrid.SetFocus;
  end;//if
  }
  OperationsE.Height := 19;
end;

procedure THauptF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DataOK(Self) then begin
    CanClose := True;
  end else begin
    CanClose := False;
    Show;
  end;//if
end;

procedure THauptF.FormCreate(Sender: TObject);
begin
  ConnectionToDatabase('Logic', LogicDB);
  EditGridSentence := TGridSentence.Create;
  EditGridSentence.DefineComponents(
    EditGrid,
    uniB, exiB, orxB, andB, douB, impB, notB, truB, apaB, eqaB, setB, genB,
    DefineB, DeleteB, SaveB, SearchB,
    OperationsG,
    SentencesT
  );
  SentGridSentence := TGridSentence.Create;
  SentGridSentence.DefineComponents(
    SentGrid,
    Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil,
    Nil, Nil, Nil, Nil,
    Nil,
    Nil
  );
  ProoGridSentence := TGridSentence.Create;
  ProoGridSentence.DefineComponents(
    ProoGrid,
    Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil,
    Nil, Nil, Nil, Nil,
    Nil,
    Nil
  );
  StepGridSentence := TGridSentence.Create;
  StepGridSentence.DefineComponents(
    StepGrid,
    Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil,
    Nil, Nil, Nil, Nil,
    Nil,
    Nil
  );
  DefiGridSentence := TGridSentence.Create;
  DefiGridSentence.DefineComponents(
    DefiGrid,
    Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil,
    Nil, Nil, Nil, Nil,
    Nil,
    Nil
  );
  CateGridSentence := TGridSentence.Create;
  CateGridSentence.DefineComponents(
    CateGrid,
    Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil,
    Nil, Nil, Nil, Nil,
    Nil,
    Nil
  );
  StringSentence := TStringSentence.Create;
  StepStringSentence := TStringSentence.Create;
  SentencesT.Open;
  SentencesT.Last;
  QuantifiersT.Open;
  USentencesT.Open;
  USentencesT.Last;
  StepsQ.Open;
  StepsQ.Last;
  RulesT.Open;
  FormulasT.Open;
  FormsQ.Open;
  TermsQ.Open;
  DefinitionsQ.Open;
  OSentencesQ.Open;
  UsedQ.Open;
  UsingQ.Open;
  CategoriesT.Open;
  VCatSenT.Open;
  VSenCatT.Open;
  SetSentenceFilter;
  CanInsert := False;
end;

procedure THauptF.FormDestroy(Sender: TObject);
begin
  EditGridSentence.Free;
  SentGridSentence.Free;
  ProoGridSentence.Free;
  StepGridSentence.Free;
  DefiGridSentence.Free;
  CateGridSentence.Free;
  StringSentence.Free;
  StepStringSentence.Free;
end;

procedure THauptF.FormulaBClick(Sender: TObject);
begin
  FormulaF := TFormulaF.Create(Nil);
  try
    FormulaF.ShowModal;
  finally
    FormulaF.Free;
  end;//try
end;

procedure THauptF.FormulaBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      EmptyFilterB.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      SentencesRulesPC.SetFocus;
    end end;//if
  end;//if
end;

function THauptF.GetSentenceFromStep(Sent, Step : Integer) : String;
// Extrage din StepDetails sententa.
  var
    Operation : String;
begin
  Result := '';
  StepDetailsQ.ParamByName('Sentence').Value := Sent;
  StepDetailsQ.ParamByName('Step').Value := Step;
  StepDetailsQ.Open;
  try
    while not StepDetailsQ.Eof do begin
      Operation := StepDetailsQ.FieldByName('Operation').Value;
      if (Length(Operation) = 1) and (Operation[1] in   AllOperations) then begin
        if Operation[1] <> SLLL then begin
          Result := Result + Operation[1];
        end else begin
          Result := Result + Spoi + StepDetailsQ.FieldByName('Link').AsString;
        end;//if
      end else begin
        Result :=
          Result +
          '(' + Operation + ')' +
          StepDetailsQ.FieldByName('Oput').AsString +
          StepDetailsQ.FieldByName('Number').AsString
        ;
      end;//if
      StepDetailsQ.Next;
    end;//while
  finally
    StepDetailsQ.Close;
  end;
end;

procedure THauptF.FormulasGDblClick(Sender: TObject);
  var
    Sent, Step, Arg, Rule, i, SCol : Integer;
begin
  HauptF.LogicDB.StartTransaction;
  try
    if EditProofPC.ActivePage = ProofTS then begin
      StepsG.SetFocus;
      if not USentencesT.IsEmpty then begin
        if USentencesT.FieldByName('Kind').Value = 'U' then begin
          if not FormulasT.IsEmpty then begin
            Rule := FormulasT.FieldByName('Rule').Value;
            if not StepsQ.IsEmpty then begin
              Sent := StepsQ.FieldByName('Sentence').Value;
              Arg := StepsQ.FieldByName('Step').Value;
              StringSentence.SetSentence(GetSentenceFromStep(Sent, Arg));
              if StepGridSentence.ColInContent then begin
                SCol := StepGridSentence.GetSCol;
                i := StringSentence.PosGridToString(SCol);
                Step := StepGridSentence.GetStepForSentence(
                  Sent,
                  Arg, 0, Rule, SCol + 1, -1,
                  StringSentence.VerifySentenceAndApplyFormula(
                    FormulasT.FieldByName('Formula').AsString,
                    i
                  )
                );
                if Step <> 0 then begin
                  StepsQ.Refresh;
                  StepsQ.Locate('Sentence;Step', VarArrayOf([Sent, Step]), []);
                  USentencesT.Refresh;
                end;//if
              end;//if
            end else begin
              MessageDlg('No step!', mtWarning, [mbOK], 0);
            end;//if
            StepsG.SelectedRows.Clear;
          end else begin
            MessageDlg('No formula!', mtWarning, [mbOK], 0);
          end;//if
        end else begin  // 'T'
          MessageDlg('A proof of a theorem cannot be changed!', mtWarning, [mbOK], 0);
        end;
      end else begin
        MessageDlg('No sentence to proof!', mtWarning, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('The page "Proofs" is not open!', mtWarning, [mbOK], 0);
    end;//if
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
end;

procedure THauptF.FormulasGExit(Sender: TObject);
begin
  MyExitGrid(Sender);
end;

procedure THauptF.FormulasGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if                Chr(Key) = 'C' then begin
    if [ssCtrl, ssShift] = Shift then begin
      FormulasGDblClick(Sender);
    end;//if
  end else begin if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      FilterE.SetFocus;
    end end;//if
  end end;//if
end;

procedure THauptF.FormulasTBeforeInsert(DataSet: TDataSet);
begin
  Beep;
  Abort;
end;

procedure THauptF.FormulasTDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.FormulasTPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.OSentencesGDblClick(Sender: TObject);
  var
    Sent : Integer;
begin
  if DataOK(Self) then begin
    if not OSentencesQ.IsEmpty then begin
      Sent := OSentencesQ.FieldByName('Sentence').Value;
      if SentencesT.Locate('Sentence', Sent, []) then begin
         SentencesRulesPC.ActivePage := SentencesTS;
      end else begin
        MessageDlg(
          'The sentence is not visible.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'No sentence!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.DrawSentences(DataSet : TDataSet; Grid : TDBGrid);
begin
  if DataSet.FieldByName('Aux').AsString = '1' then begin
    Grid.Canvas.Brush.Color := clSilver;
  end else begin
    if                DataSet.FieldByName('Kind').AsString = 'T' then begin
      Grid.Canvas.Brush.Color := clWindow;
    end else begin if DataSet.FieldByName('Kind').AsString = 'F' then begin
      Grid.Canvas.Brush.Color := clMoneyGreen;
    end else begin if DataSet.FieldByName('Kind').AsString = 'R' then begin
      Grid.Canvas.Brush.Color := clSkyBlue;
    end else begin if DataSet.FieldByName('Kind').AsString = 'A' then begin
      Grid.Canvas.Brush.Color := clAqua;
    end else begin if DataSet.FieldByName('Kind').AsString = 'U' then begin
      Grid.Canvas.Brush.Color := clYellow;
    end else begin
      Grid.Canvas.Brush.Color := clWindow;
    end end end end end;
  end;//if
end;

procedure THauptF.OSentencesGDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DrawSentences(OSentencesQ, OSentencesG);
  OSentencesG.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure THauptF.OSentencesGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      DefinitionsG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      DefiGrid.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.DBMemo1Exit(Sender: TObject);
begin
  if not DataOK(Self) then begin
    DBMemo1.SetFocus;
  end;//if
end;

procedure THauptF.DBMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      SentencesG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      MatrixTextPC.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.DBMemo3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      RulesG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      SentencesRulesPC.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.DefiGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if                Key = VK_UP then begin
    if                [ssCtrl] = Shift then begin
      if OSentencesG.Height >= 57 then begin
        DefiGrid.Height := DefiGrid.Height + 22;
      end;//if
    end;//if
  end else begin if Key = VK_DOWN then begin
    if                [ssCtrl] = Shift then begin
      if DefiGrid.Height >= 201 then begin
        DefiGrid.Height := DefiGrid.Height - 22;
      end;//if
    end;//if
  end else begin if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      OSentencesG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      EditProofPC.SetFocus;
    end end;//if
  end end end;//if
end;

procedure THauptF.DefinitionsDSDataChange(Sender: TObject; Field: TField);
begin
  OSentencesQAfterScroll(Nil);
end;

procedure THauptF.DefinitionsGDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if                DefinitionsQ.FieldByName('Kind').AsString = 'F' then begin
    DefinitionsG.Canvas.Brush.Color := clMoneyGreen;
  end else begin if DefinitionsQ.FieldByName('Kind').AsString = 'R' then begin
    DefinitionsG.Canvas.Brush.Color := clSkyBlue;
  end else begin
    DefinitionsG.Canvas.Brush.Color := clWindow;
  end end;//if
  DefinitionsG.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure THauptF.DefinitionsGKeyDown(
  Sender: TObject; var Key: Word;
  Shift: TShiftState
);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      OSentencesG.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.DefinitionsGKeyPress(Sender: TObject; var Key: Char);
begin
  DefinitionsQ.Locate('Operation', UpperCase(Key), [loCaseInsensitive, loPartialKey]);
end;

procedure THauptF.Deleteproof2Click(Sender: TObject);
begin
  if DataOK(Self) then begin
    if not StepsQ.IsEmpty then begin
      if MessageDlg('Delete proof?', mtConfirmation, [mbOK], 0) = mrOK then begin
        HauptF.LogicDB.StartTransaction;
        try
          DeleteProofSP.ParamByName('Sentence').Value := StepsQ.FieldByName('Sentence').Value;
          DeleteProofSP.ExecProc;
          StepsQ.Refresh;
          StepGridSentence.Clear;
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
      end;//if
    end else begin
      MessageDlg(
        'No proof!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.Empty1Click(Sender: TObject);
begin
  ClearField;
end;

procedure THauptF.EmptyFilterBClick(Sender: TObject);
begin
  FilterE.Text := '';
  FilterE.SetFocus;
end;

procedure THauptF.EmptyFilterBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      FilterE.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      FormulaB.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.TheoremCBClick(Sender: TObject);
begin
  SetSentenceFilter;
end;

procedure THauptF.Time1Click(Sender: TObject);
begin
  TimeToField;
end;

procedure THauptF.UnprovedCBClick(Sender: TObject);
begin
  SetSentenceFilter;
end;

procedure THauptF.UsedGDblClick(Sender: TObject);
  var
    Sent, Used, Using : Integer;
begin
  if DataOK(Self) then begin
    if not UsedQ.IsEmpty then begin
      Sent := SentencesT.FieldByName('Sentence').Value;
      Used := UsedQ.FieldByName('Sentence').Value;
      if SentencesT.Locate('Sentence', Used, []) then begin
        UsingQ.Locate('Sentence', Sent, []);
        SentencesG.SetFocus;
      end else begin
        MessageDlg(
          'The sentence is not visible.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'No sentence!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.UsedGDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DrawSentences(UsedQ, UsedG);
  UsedG.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure THauptF.UsedGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      MatrixTextPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      SentencesRulesPC.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.UsedQDESCRIPTIONGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := UsedQ.FieldByName('Description').AsString;
end;

procedure THauptF.USentencesGDblClick(Sender: TObject);
  var
    Sentence : Integer;
begin
  if DataOK(Self) then begin
    if not USentencesT.IsEmpty then begin
      Sentence := USentencesT.FieldByName('Sentence').Value;
      if SentencesT.Locate('Sentence', Sentence, []) then begin
        SentencesRulesPC.ActivePage := SentencesTS;
      end else begin
        MessageDlg(
          'The sentence is not visible.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'No sentence!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.USentencesGDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if USentencesT.FieldByName('Aux').AsString = '1' then begin
    USentencesG.Canvas.Brush.Color := clSilver;
  end else begin
    if                USentencesT.FieldByName('Kind').AsString = 'T' then begin
      USentencesG.Canvas.Brush.Color := clWindow;
    end else begin if USentencesT.FieldByName('Kind').AsString = 'U' then begin
      USentencesG.Canvas.Brush.Color := clYellow;
    end else begin
      USentencesG.Canvas.Brush.Color := clWindow;
    end end;//if
  end;//if
  DrawSentences(USentencesT, USentencesG);
  USentencesG.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure THauptF.USentencesGKyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      ProoGrid.SetFocus;
    end end;//if
  end;//if
end;

function THauptF.GetSentenceFromDatabase(Sentence : Integer) : String;
// Extrage din Details sententa.
  var
    Operation : String;
begin
  Result := '';
  HauptF.DetailsQ.ParamByName('Sentence').Value := Sentence;
  HauptF.DetailsQ.Open;
  try
    while not HauptF.DetailsQ.Eof do begin
      Operation := HauptF.DetailsQ.FieldByName('Operation').Value;
      if (Length(Operation) = 1) and (Operation[1] in   AllOperations) then begin
        if Operation[1] <> SLLL then begin
          Result := Result + Operation[1];
        end else begin
          Result := Result + Spoi + HauptF.DetailsQ.FieldByName('Link').AsString;
        end;//if
      end else begin
        Result :=
          Result +
          '(' + Operation + ')' +
          HauptF.DetailsQ.FieldByName('Oput').AsString +
          HauptF.DetailsQ.FieldByName('Number').AsString
        ;
      end;//if
      HauptF.DetailsQ.Next;
    end;//while
  finally
    HauptF.DetailsQ.Close;
  end;
end;

procedure THauptF.USentencesTAfterRefresh(DataSet: TDataSet);
begin
  USentencesTAfterScroll(Nil);
end;

procedure THauptF.USentencesTAfterScroll(DataSet: TDataSet);
begin
  if not USentencesT.ControlsDisabled then begin
    ProoGridSentence.Delete(0, 0);
    if not USentencesT.IsEmpty then begin
      ProoGridSentence.PutStringSentence(
        GetSentenceFromDatabase(USentencesT.FieldByName('Sentence').Value)
      );
    end;//if
    StepsG.SelectedRows.Clear;
    StepsQAfterScroll(Nil);
  end;//if
end;

procedure THauptF.UsingGDblClick(Sender: TObject);
  var
    Sent, Used, Using : Integer;
begin
  if DataOK(Self) then begin
    if not UsingQ.IsEmpty then begin
      Sent := SentencesT.FieldByName('Sentence').Value;
      Using := UsingQ.FieldByName('Sentence').Value;
      if SentencesT.Locate('Sentence', Using, []) then begin
        UsedQ.Locate('Sentence', Sent, []);
        SentencesG.SetFocus;
      end else begin
        MessageDlg(
          'The sentence is not visible.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'No sentence!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.UsingGDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DrawSentences(UsingQ, UsingG);
  UsingG.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure THauptF.UsingGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      MatrixTextPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      SentencesRulesPC.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.UsingQDESCRIPTIONGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := UsingQ.FieldByName('Description').AsString;
end;

procedure THauptF.Forward1Click(Sender: TObject);
  var
    ActiveForm : TForm;
    NextControl : TWinControl;
begin
  ActiveForm := HauptF.ActiveMDIChild;
  if ActiveForm <> nil then begin
    NextControl := MyFindNextControl(
      ActiveForm,
      ActiveForm.ActiveControl,
      True, True, False
    );
    if NextControl <> nil then begin
      NextControl.SetFocus;
    end;//if
  end;//if
end;

procedure THauptF.FunctionCBClick(Sender: TObject);
begin
  SetSentenceFilter;
end;

procedure THauptF.EditGridKeyPress(Sender: TObject; var Key: Char);
  var
    UpCh : String;
begin
  UpCh := UpperCase(Key);
  if UpCh = Sorx then begin
    if orxB.Enabled then begin
      orxB.OnClick(Self);
    end;//if
  end else begin if UpCh = Sand then begin
    if andB.Enabled then begin
      andB.OnClick(Self);
    end;//if
  end else begin if UpCh = Simp then begin
    if impB.Enabled then begin
      impB.OnClick(Self);
    end;//if
  end else begin if UpCh = Snot then begin
    if notB.Enabled then begin
      notB.OnClick(Self);
    end;//if
  end else begin if UpCh = Stru then begin
    if truB.Enabled then begin
      truB.OnClick(Self);
    end;//if
  end else begin if Key = Sapa then begin
    if apaB.Enabled then begin
      apaB.OnClick(Self);
    end;//if
  end else begin if Key = Seqa then begin
    if eqaB.Enabled then begin
      eqaB.OnClick(Self);
    end;//if
  end else begin if UpCh = Sgen then begin
    if genB.Enabled then begin
      genB.OnClick(Self);
    end;//if
  end end end end end end end end;//if
end;

procedure THauptF.EditProofPCChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if EditProofPC.ActivePage = CategoriesTS then begin
    if DataSetOK(CategoriesT) then begin
      if not DataSetOK(VCatSenT) then begin
        AllowChange := False;
      end;//if
    end else begin
      AllowChange := False;
    end;//if
  end;//if
end;

procedure THauptF.EditGridKeyDown(
  Sender: TObject; var Key: Word;
  Shift: TShiftState
);
  var
    Ch : Char;
    UpCh : String;
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      OperationsG.SetFocus;
    end end;//if
  end else begin if (Key = VK_DELETE) or (Key = VK_BACK) then begin
    if DeleteB.Enabled then begin
      DeleteB.OnClick(Self);
    end;//if
  end else begin
    Ch := Chr(Key);
    UpCh := UpperCase(Ch);
    if                UpCh = Sdou then begin
      if                [ssCtrl, ssShift] = Shift then begin
        if DefineB.Enabled then begin
          DefineB.OnClick(Self);
        end;//if
      end else begin if [] = Shift then begin
        if douB.Enabled then begin
          douB.OnClick(Self);
        end;//if
      end end;//if
    end else begin if Ch = 'O' then begin
      if [ssCtrl, ssShift] = Shift then begin
        OperationsG.OnDblClick(Self);
      end;//if
    end else begin if UpCh = Sset then begin
      if [ssCtrl, ssShift] = Shift then begin
        if SaveB.Enabled then begin
          SaveB.OnClick(Self);
        end;//if
      end else begin if [] = Shift then begin
        if setB.Enabled then begin
          setB.OnClick(Self);
        end;//if
      end end;//if
    end else begin if UpCh = Suni then begin
      if                [ssShift] = Shift then begin
        EditGridSentence.MakeUni('1');
      end else begin if [ssAlt] = Shift then begin
        EditGridSentence.MakeUni('2');
      end else begin
        EditGridSentence.MakeUni('0');
      end end;//
    end else begin if UpCh = Sexi then begin
      if                [ssShift] = Shift then begin
        EditGridSentence.MakeExi('1');
      end else begin if [ssAlt] = Shift then begin
        EditGridSentence.MakeExi('2');
      end else begin
        EditGridSentence.MakeExi('0');
      end end;//
    end end end end end;//if
  end end;//if
end;

procedure THauptF.Backward1Click(Sender: TObject);
  var
    ActiveForm : TForm;
    NextControl : TWinControl;
begin
  ActiveForm := HauptF.ActiveMDIChild;
  if ActiveForm <> nil then begin
    NextControl := MyFindNextControl(
      ActiveForm,
      ActiveForm.ActiveControl,
      False, True, False
    );
    if NextControl <> nil then begin
      NextControl.SetFocus;
    end;//if
  end;//if
end;

procedure THauptF.BitBtn1Click(Sender: TObject);
begin
  if SentencesRulesPC.Width >= 649then begin
    SentencesRulesPC.Width := 372;
  end else begin
    SentencesRulesPC.Width := 649
  end;//if
end;

procedure THauptF.BitBtn2Click(Sender: TObject);
begin
  EditGrid.Height := 355;
  Panel4.Height := 272;
  ProoGrid.Height := 179;
  StepGrid.Height := 179;
  DefiGrid.Height := 179;
  Panel15.Height := 183;
  CateGrid.Height := 179;
  SentGrid.Height := 179;
  DBMemo1.Height := 58;
  DBMemo3.Height := 109;
  Panel8.Height := 336;
  DBMemo1.Height := 58;
  SentencesRulesPC.Width := 649
end;

procedure THauptF.OperationsBClick(Sender: TObject);
begin
  OperationsE.Text := '';
  OperationsE.SetFocus;
end;

procedure THauptF.OperationsBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      OperationsE.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      EditProofPC.SetFocus;
    end end;//if
  end;//if
end;

function THauptF.ExecuteFunction(
  Sent, Arg, SArg, Rule, Link, Col, SCol : Integer;
  Formula : String
) : Integer;
// Result e Step sau 0.
  var
    Source, Destin, Sentence : String;
    i, j : Integer;
begin
  Result := 0;
  i := 0;
  j := 0;
  Source := '';
  Destin := '';
  if SArg > 0 then begin
    Source := GetSentenceFromStep(Sent, Arg);
    Destin := GetSentenceFromStep(Sent, SArg);
    StringSentence.SetSentence(Destin);
    if SCol > 0 then begin
      i := StringSentence.PosGridToString(Col - 1);
      j := StringSentence.PosGridToString(SCol - 1);
    end else begin
      if Col > 0 then begin
        i := StringSentence.PosGridToString(Col - 1);
      end;//if
    end;//if
  end else begin if Arg > 0 then begin
    Source := GetSentenceFromStep(Sent, Arg);
    StringSentence.SetSentence(Source);
    if SCol > 0 then begin
      i := StringSentence.PosGridToString(Col - 1);
      j := StringSentence.PosGridToString(SCol - 1);
    end else begin
      if Col > 0 then begin
        i := StringSentence.PosGridToString(Col - 1);
      end;//if
    end;//if
  end else begin  // pentru Rule 15, 20, 29
    StringSentence.SetSentenceFromDatabase(Sent);
  end end;//if
  if Link > 0 then begin  // Load
    Result := StepGridSentence.GetStepForLink(Sent, Link);
  end else begin if Formula <> '' then begin  // Formulas
    Result := StepGridSentence.GetStepForSentence(
      Sent,
      Arg, 0, Rule, Col, -1,
      StringSentence.VerifySentenceAndApplyFormula(Formula, i)
    );
  end else begin
    if                Rule = 1 then begin   // InsertSentences
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, SArg, Rule, Col, -1,
        StringSentence.InsertSentences(Source, Destin, i)
      );
    end else begin if Rule = 3 then begin   // ExtractCondition
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.ExtractCondition(i)
      );
    end else begin if Rule = 4 then begin   // InsertCondition
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.InsertCondition(i)
      );
    end else begin if Rule = 5 then begin   // ClassGeneratorToForm
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.ClassGeneratorToForm(i)
      );
    end else begin if Rule = 6 then begin   // Particularization
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, SCol,
        StringSentence.Particularization(i, j)
      );
    end else begin if Rule = 8 then begin   // QuantifierDistrib
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.QuantifierDistrib(i)
      );
    end else begin if Rule = 9 then begin   // RestrictedQuantifierDistrib
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.RestrictedQuantifierDistrib(i)
      );
    end else begin if Rule = 10 then begin  // PartialQuantifierDistrib
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.PartialQuantifierDistrib(i)
      );
    end else begin if Rule = 11 then begin  // DualQuantifierDistrib
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.DualQuantifierDistrib(i)
      );
    end else begin if Rule = 12 then begin  // DeleteQuantifier
      Result := DeleteQuantifier(Sent, Arg, Rule, Col, i);
    end else begin if Rule = 13 then begin  // DeleteQuantifiers
      Result := DeleteQuantifiers(Sent, Arg, Rule, Col, i);
    end else begin if Rule = 14 then begin  // InterchangeQuantifiers
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.InterchangeQuantifiers(i)
      );
    end else begin if Rule = 15 then begin  // ReductioAdAbsurdum
      Sentence := GetSentenceFromDatabase(Sent);
      if Sentence[1] in [Suni, Sexi, Sand, Sorx, Sdou, Simp, Snot] then begin
        StringSentence.SetSentence(Snot + Sentence);
        Sentence := StringSentence.Negation(1);
      end else begin
        Sentence := Snot + Sentence;
      end;
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, -1, -1,
        Sentence
      );
    end else begin if Rule = 16 then begin  // Negation
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.Negation(i)
      );
    end else begin if Rule = 18 then begin  // ExistentialGeneralization
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, SCol,
        StringSentence.Generalization(i, j, Sexi)
      );
    end else begin if Rule = 19 then begin  // Replacement
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, SCol,
        StringSentence.Replacement(i, j)
      );
    end else begin if Rule = 20 then begin  // ExtractHypothesis
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, -1, -1,
        StringSentence.ExtractHypothesis
      );
    end else begin if Rule = 21 then begin  // FormToClassGenerator
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.FormToClassGenerator(i)
      );
    end else begin if Rule = 22 then begin  // Commutativity
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.Commutativity(i)
      );
    end else begin if Rule = 23 then begin  // CrossReplacement
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, SArg, Rule, Col, -1,
        CrossReplacement(Source, Destin, i)
      );
    end else begin if Rule = 24 then begin  // Reflexivity
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, -1,
        StringSentence.Reflexivity(i)
      );
    end else begin if Rule = 25 then begin  // UniversalGeneralization
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, SCol,
        StringSentence.Generalization(i, j, Suni)
      );
    end else begin if Rule = 28 then begin  // CrossAttachment
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, SArg, Rule, Col, -1,
        CrossAttachment(Source, Destin, i)
      );
    end else begin if Rule = 29 then begin  // ExtractConclusion
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, -1, -1,
        StringSentence.ExtractConclusion
      );
    end else begin if Rule = 30 then begin  // DuplicationAnd
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, SCol,
        StringSentence.DuplicationAnd(i, j)
      );
    end else begin if Rule = 31 then begin  // DuplicationImp
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, SCol,
        StringSentence.DuplicationImp(i, j)
      );
    end else begin if Rule = 2 then begin  // Attachment
      Result := StepGridSentence.GetStepForSentence(
        Sent,
        Arg, 0, Rule, Col, SCol,
        StringSentence.Attachment(i, j)
      );
    end end end end end end end end end end end end end end
    end end end end end end end end end end end end end;//if
  end end;//if
end;

procedure THauptF.GetColNr(nr : Integer; var ZLine, ULine : String);
  var
    i, q, r : Integer;
begin
  ZLine := '';
  ULine := '';
  q := nr div 10;
  r := nr mod 10;
  for i := 1 to q do begin
    ZLine := ZLine + '                   ' + IntToStr(i mod 10);
  end;//for
  for i := 1 to q do begin
    ULine := ULine + ' 1 2 3 4 5 6 7 8 9 0';
  end;//for
  for i := 1 to r do begin
    ULine := ULine + ' ' + IntToStr(i);
  end;//for
end;

procedure THauptF.Extractallthesentences1Click(Sender: TObject);
  var
    Von, Bis : Integer;
    FileName : String;
    F : TextFile;
    Sent, SArg, nr, i : Integer;
    StringList : TStringList;
    GridSentence : TGridSentence;
    Sentence, St, Kind : String;
    ZLine, ULine : String;
begin
  if DataOK(Self) then begin
    FromToView1.FromValue := 1;
    FromToView1.ToValue := 1;
    if FromToView1.Execute then begin
      Von := FromToView1.FromValue;
      Bis := FromToView1.ToValue;
      SaveDialog1.DefaultExt := '*.txt';
      SaveDialog1.Title := 'Save all the sentences';
      SaveDialog1.FileName := IntToStr(Von) + '-' + IntToStr(Bis) + '.txt';
      if SaveDialog1.Execute then begin
        HauptF.LogicDB.StartTransaction;
        try
          FileName := SaveDialog1.FileName;
          AssignFile(F, FileName);
          Rewrite(F);
          try
            SentencesTQ.Open;
            try
              while not SentencesTQ.Eof do begin
                if
                  (SentencesTQ.FieldByName('Sentence').Value >= Von) and
                  (SentencesTQ.FieldByName('Sentence').Value <= Bis)
                then begin
                  Sent := SentencesTQ.FieldByName('Sentence').Value;
                  Kind := SentencesTQ.FieldByName('Kind').Value;
                  Sentence := GetSentenceFromDatabase(Sent);
                  St :=
                    IntToStr(Sent) + '(' + Kind + ') ' +
                    SentencesTQ.FieldByName('Title').AsString + ' '
                  ;
                  WriteLn(F, '====================================================================================================');
                  WriteLn(F, St);
                  // Sentence
                  StringList := TStringList.Create;
                  try
                    StringSentence.SetSentence(Sentence);
                    StringSentence.SentenceAsStringList(0, StringList);
                    nr := Length(StringList[0]) div 2;
                    GetColNr(nr, ZLine, ULine);
                    WriteLn(F, ZLine);
                    WriteLn(F, ULine);
                    for i := 0 to StringList.Count - 1 do begin
                      WriteLn(F, StringList[i]);
                    end;//for
                  finally
                    StringList.Free;
                  end;
                  WriteLn(F, '');
                  // Sentence as usual
                  StringSentence.SetSentence(GetSentenceFromDatabase(Sent));
                  WriteLn(F, StringSentence.SentenceAsUsual(Sent));
                  // Proof
                  if Kind = 'T' then begin
                    WriteLn(F, '');
                    WriteLn(F, 'Proof');
                    WriteLn(F, '');
                    StepsTQ.ParamByName('Sentence').Value := Sent;
                    StepsTQ.Open;
                    try
                      while not StepsTQ.Eof do begin
                        SArg := StepsTQ.FieldByName('Step').Value;
                        Sentence := GetSentenceFromStep(Sent, SArg);
                        WriteLn(F, GetStepLineFromStepTQ);
                        StringList := TStringList.Create;
                        try
                          StringSentence.SetSentence(Sentence);
                          StringSentence.SentenceAsStringList(0, StringList);
                          if StringList.Count > 0 then begin
                            nr := Length(StringList[0]) div 2;
                            GetColNr(nr, ZLine, ULine);
                            WriteLn(F, ZLine);
                            WriteLn(F, ULine);
                            for i := 0 to StringList.Count - 1 do begin
                              WriteLn(F, StringList[i]);
                            end;//for
                          end;//if
                        finally
                          StringList.Free;
                        end;
                        WriteLn(F, '');
                        StepsTQ.Next;
                      end;//while;
                    finally
                      StepsTQ.Close;
                    end;
                  end else begin
                    WriteLn(F, '');
                  end;//if
                end;//if
                SentencesTQ.Next;
              end;//while
            finally
              SentencesTQ.Close;
            end;
          finally
            CloseFile(F);
          end;
          HauptF.LogicDB.Commit;
        except
          on E : Exception do begin
            if E is EDatabaseError then begin
              MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
            end else begin
              MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
            HauptF.LogicDB.Commit;
          end;//on
        end;
      end;//if
    end;//if
  end;//if
end;

procedure THauptF.Extractsentencesastext1Click(Sender: TObject);
  var
    FileName : String;
    F : TextFile;
    Sent, SArg, nr, i : Integer;
    StringList : TStringList;
    GridSentence : TGridSentence;
    Sentence, St, Kind : String;
    ZLine, ULine : String;
begin
  if DataOK(Self) then begin
    SaveDialog1.DefaultExt := '*.txt';
    SaveDialog1.Title := 'Save sentences as text';
    SaveDialog1.FileName := 'Logic.txt';
    if SaveDialog1.Execute then begin
      HauptF.LogicDB.StartTransaction;
      try
        FileName := SaveDialog1.FileName;
        AssignFile(F, FileName);
        Rewrite(F);
        try
          SentencesTQ.Open;
          try
            while not SentencesTQ.Eof do begin
              Sent := SentencesTQ.FieldByName('Sentence').Value;
              Kind := SentencesTQ.FieldByName('Kind').Value;
              Sentence := GetSentenceFromDatabase(Sent);
              St :=
                IntToStr(Sent) + '(' + Kind + ') ' +
                SentencesTQ.FieldByName('Title').AsString + ' '
              ;
              WriteLn(F, St);
              StringSentence.SetSentence(GetSentenceFromDatabase(Sent));
              St := StringSentence.SentenceAsUsual(Sent);
              if St = '' then begin
                St := 'No variables!';
              end;//if
              WriteLn(F, St);
              WriteLn(F, '');
              SentencesTQ.Next;
            end;//while
          finally
            SentencesTQ.Close;
          end;
        finally
          CloseFile(F);
        end;
        HauptF.LogicDB.Commit;
      except
        on E : Exception do begin
          if E is EDatabaseError then begin
            MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
          end else begin
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
          HauptF.LogicDB.Commit;
        end;//on
      end;
    end;//if
  end;//if
end;

procedure THauptF.Saveproof2Click(Sender: TObject);
  var
    FileName : String;
    F : TextFile;
    Sentence, Title, Quantifiers : String;
    Bookmark : TBookmark;
begin
  if DataOK(Self) then begin
    if not StepsQ.IsEmpty then begin
      SaveDialog1.DefaultExt := '*.csv';
      SaveDialog1.Title := 'Save proof';
      SaveDialog1.FileName := StepsQ.FieldByName('Sentence').AsString + '.csv';
      if SaveDialog1.Execute then begin
        HauptF.LogicDB.StartTransaction;
        try
          FileName := SaveDialog1.FileName;
          AssignFile(F, FileName);
          Rewrite(F);
          try
            Title := USentencesT.FieldByName('Title').AsString;
            Sentence := GetSentenceFromDatabase(
              USentencesT.FieldByName('Sentence').Value
            );
            WriteLn(F, Title);
            WriteLn(F, Sentence);
            Quantifiers := GetVariables(USentencesT.FieldByName('Sentence').Value);
            WriteLn(F, Quantifiers);
            WriteLn(F, '================================================================');
            StepsQ.DisableControls;
            try
              Bookmark := StepsQ.GetBookmark;
              try
                StepsQ.First;
                while not StepsQ.Eof do begin
                  WriteLn(
                    F,
                    StepsQ.FieldByName('Step').AsString + ';' +
                    StepsQ.FieldByName('Arg').AsString + ';' +
                    StepsQ.FieldByName('SArg').AsString + ';' +
                    StepsQ.FieldByName('Rule').AsString + ';' +
                    '"' + StepsQ.FieldByName('Formula').AsString + '";' +
                    StepsQ.FieldByName('Link').AsString + ';' +
                    StepsQ.FieldByName('Col').AsString + ';' +
                    StepsQ.FieldByName('SCol').AsString + ';' +
                    '"' + StepsQ.FieldByName('Title').AsString + '"'
                  );
                  if not StepsQ.FieldByName('Link').IsNull then begin
                    WriteLn(F, GetSentenceFromDatabase(StepsQ.FieldByName('Link').Value));
                  end;//if
                  StepsQ.Next;
                end;//while;
              finally
                StepsQ.GotoBookmark(Bookmark);
              end;
            finally
              StepsQ.EnableControls;
            end;
          finally
            CloseFile(F);
          end;
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
      end;//if
    end else begin
      MessageDlg(
        'No proof!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

function THauptF.GetStepLineFromStepTQ : String;
  var
    SArg : Integer;
    Ft, St : String;
begin
  Result := '';
  SArg := StepsTQ.FieldByName('Step').Value;
  if StepsTQ.FieldByName('Formula').AsString <> '' then begin
    Ft := IntToStr(SArg) + '. ' + StepsTQ.FieldByName('Formula').AsString;
  end else begin
    Ft := IntToStr(SArg) + '. ' + StepsTQ.FieldByName('Title').AsString;
  end;//
  St := '';
  if not StepsTQ.FieldByName('Arg').IsNull then begin
    St := St + 'Step: ' + StepsTQ.FieldByName('Arg').AsString + ', ';
  end;//if
  if not StepsTQ.FieldByName('SArg').IsNull then begin
    St := St + 'SStep: ' + StepsTQ.FieldByName('SArg').AsString + ', ';
  end;//if
  if not StepsTQ.FieldByName('Link').IsNull then begin
    St := St + 'Sentence: ' + StepsTQ.FieldByName('Link').AsString + ', ';
  end;//if
  if not StepsTQ.FieldByName('Col').IsNull then begin
    St := St + 'Col: ' + StepsTQ.FieldByName('Col').AsString + ', ';
  end;//if
  if not StepsTQ.FieldByName('SCol').IsNull then begin
    St := St + 'SCol: ' + StepsTQ.FieldByName('SCol').AsString + ', ';
  end;//if
  if St <> '' then begin
    St := Copy(St, 1, Length(St) - 2);
    Result := Ft + ' (' + St + ')';
  end else begin
    Result := Ft;
  end;//if
end;

procedure THauptF.Savethesentencesoftheproof1Click(Sender: TObject);
  var
    FileName : String;
    F : TextFile;
    Sent, SArg : Integer;
    StringList : TStringList;
    Grid : TStringGrid;
    GridSentence : TGridSentence;
    Sentence, Ft, St : String;
    nr, i : Integer;
    ZLine, ULine : String;
begin
  if DataOK(Self) then begin
    if not StepsQ.IsEmpty then begin
      SaveDialog1.DefaultExt := '*.txt';
      SaveDialog1.Title := 'Save sentences of the proof';
      SaveDialog1.FileName := 'Proof' + StepsQ.FieldByName('Sentence').AsString + '.txt';
      if SaveDialog1.Execute then begin
        HauptF.LogicDB.StartTransaction;
        try
          FileName := SaveDialog1.FileName;
          AssignFile(F, FileName);
          Rewrite(F);
          try
            Sent := StepsQ.FieldByName('Sentence').Value;
            StepsTQ.ParamByName('Sentence').Value := Sent;
            StepsTQ.Open;
            try
              while not StepsTQ.Eof do begin
                SArg := StepsTQ.FieldByName('Step').Value;
                Sentence := GetSentenceFromStep(Sent, SArg);
                WriteLn(F, GetStepLineFromStepTQ);
                StringList := TStringList.Create;
                try
                  StringSentence.SetSentence(Sentence);
                  StringSentence.SentenceAsStringList(0, StringList);
                  if StringList.Count > 0 then begin
                    nr := Length(StringList[0]) div 2;
                    GetColNr(nr, ZLine, ULine);
                    WriteLn(F, ZLine);
                    WriteLn(F, ULine);
                    for i := 0 to StringList.Count - 1 do begin
                      WriteLn(F, StringList[i]);
                    end;//for
                  end;//if
                finally
                  StringList.Free;
                end;
                WriteLn(F, '');
                StepsTQ.Next;
              end;//while;
            finally
              StepsTQ.Close;
            end;
          finally
            CloseFile(F);
          end;
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
      end;//if
    end else begin
      MessageDlg(
        'No proof!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.Savethestepsoftheproof1Click(Sender: TObject);
  var
    FileName : String;
    F : TextFile;
    Sent, SArg : Integer;
    Sentence, Ft, St : String;
begin
  if DataOK(Self) then begin
    if not StepsQ.IsEmpty then begin
      SaveDialog1.DefaultExt := '*.txt';
      SaveDialog1.Title := 'Save sentences of the proof';
      SaveDialog1.FileName := 'Steps' + StepsQ.FieldByName('Sentence').AsString + '.txt';
      if SaveDialog1.Execute then begin
        HauptF.LogicDB.StartTransaction;
        try
          FileName := SaveDialog1.FileName;
          AssignFile(F, FileName);
          Rewrite(F);
          try
            Sent := StepsQ.FieldByName('Sentence').Value;
            StepsTQ.ParamByName('Sentence').Value := Sent;
            StepsTQ.Open;
            try
              while not StepsTQ.Eof do begin
                SArg := StepsTQ.FieldByName('Step').Value;
                Sentence := GetSentenceFromStep(Sent, SArg);
                WriteLn(F, GetStepLineFromStepTQ);
                StepsTQ.Next;
              end;//while;
            finally
              StepsTQ.Close;
            end;
          finally
            CloseFile(F);
          end;
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
      end;//if
    end else begin
      MessageDlg(
        'No proof!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.HVStringList(H, V : TStringList);
// nu e folosita
  var
    nr, i, j : Integer;
    St : String;
begin
  nr := Length(H[0]);
  j := 2;
  while j <= nr do begin
    St := '';
    for i := 0 to H.Count - 1 do begin
      if H[i][j] = Smin then begin
        St := St + '| ';
      end else begin
        St := St + H[i][j] + ' ';
      end;
    end;//for
    V.Add('  '+ St);
    j := j + 2;
  end;//while
  {Asa ar trebui apelata
                  VStringList := TStringList.Create;
                  try
                    HVStringList(StringList, VStringList);
                    for i := 0 to VStringList.Count - 1 do begin
                      WriteLn(F, VStringList[i]);
                    end;//for
                  finally
                    VStringList.Free;
                  end;//try
  }
end;

procedure THauptF.SentencesGDblClick(Sender: TObject);
  var
    Sentence, Step, Link : Integer;
begin
  HauptF.LogicDB.StartTransaction;
  try
    if                EditProofPC.ActivePage = EditTS then begin
      EditGrid.SetFocus;
      if not SentencesT.IsEmpty then begin
        EditGridSentence.Clear;
        EditGrid.SetFocus;
        EditGridSentence.PutStringSentence(
          GetSentenceFromDatabase(SentencesT.FieldByName('Sentence').Value)
        );
      end;//if
    end else begin if EditProofPC.ActivePage = ProofTS then begin
      if not USentencesT.IsEmpty then begin
        if USentencesT.FieldByName('Kind').Value = 'U' then begin
          StepsG.SetFocus;
          if USentencesT.FieldByName('Kind').Value = 'U' then begin
            if SentencesT.FieldByName('Kind').AsString <> 'U' then begin
              Sentence := USentencesT.FieldByName('Sentence').Value;
              Link := SentencesT.FieldByName('Sentence').Value;
              Step := StepGridSentence.GetStepForLink(Sentence, Link);
              StepsQ.Refresh;
              if Step <> 0 then begin
                StepsQ.Locate('Sentence;Step', VarArrayOf([Sentence, Step]), []);
                USentencesT.Refresh;
              end else begin
                StepsQ.Locate('Sentence;Link', VarArrayOf([Sentence, Link]), []);
              end;//if
              StepsG.SelectedRows.Clear;
            end else begin
              MessageDlg('Undefined sentences are not allowed!', mtWarning, [mbOK], 0);
            end;//if
          end else begin  // 'T'
            MessageDlg('A proof of a theorem cannot be changed!', mtWarning, [mbOK], 0);
          end;
        end else begin  // Kind is 'T'
          USentencesG.SetFocus;
          USentencesT.Locate('Sentence', SentencesT.FieldByName('Sentence').Value, []);
        end;//if
      end else begin
        MessageDlg('No sentence!', mtWarning, [mbOK], 0);
      end;//if
    end else begin if EditProofPC.ActivePage = CategoriesTS then begin
      if not SentencesT.IsEmpty then begin
        if SentencesT.FieldByName('Kind').AsString <> 'U' then begin
          if not CategoriesT.IsEmpty then begin
            VCatSenT.Insert;
            VCatSenT.FieldByName('Sentence').Value :=
              SentencesT.FieldByName('Sentence').Value
            ;
            VCatSenT.Post;
          end else begin
            MessageDlg('No category!', mtWarning, [mbOK], 0);
          end;//if
        end else begin
          MessageDlg('Undefined sentences are not allowed!', mtWarning, [mbOK], 0);
        end;//if
      end;//if
    end end end;//if
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
end;

procedure THauptF.SentencesGDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DrawSentences(SentencesT, SentencesG);
  SentencesG.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure THauptF.SentencesGExit(Sender: TObject);
begin
  MyExitGrid(Sender);
end;

procedure THauptF.SentencesGKeyDown(
  Sender: TObject; var Key: Word;
  Shift: TShiftState
);
  var
    Sent : Integer;
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      DBMemo1.SetFocus;
    end end;//if
  end else begin if Chr(Key) = 'G' then begin
    if [ssCtrl, ssShift] = Shift then begin
      if GeneralB.Visible then begin
        GeneralB.Visible := False;
      end else begin
        GeneralB.Visible := True;
      end;//if
    end;//if
  end else begin if Chr(Key) = 'O' then begin
    if [ssCtrl, ssShift] = Shift then begin
      Clipboard.AsText := GetSentenceFromDatabase(SentencesT.FieldByName('Sentence').Value);
    end;//if
  end else begin if Chr(Key) = 'P' then begin
    if [ssCtrl, ssShift] = Shift then begin
      Sent := FindSentence(Clipboard.AsText);
      if Sent <> 0 then begin
        SentencesT.Locate('Sentence', Sent, []);
      end else begin
        MessageDlg('Cannot find sentence.', mtWarning, [mbOK], 0);
      end;//if
    end;//if
  end end end end;//if
end;

procedure THauptF.SentencesMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      MatrixTextPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      QuantifiersG.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.SentencesRulesPCChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if                SentencesRulesPC.ActivePage = SentencesTS then begin
    if not DataSetOK(SentencesT) then begin
      AllowChange := False;
    end;//if
  end else begin if SentencesRulesPC.ActivePage = FormulasTS then begin
    if not DataSetOK(FormulasT) then begin
      AllowChange := False;
    end;//if
  end end;//if
end;

procedure THauptF.SentencesTAfterDelete(DataSet: TDataSet);
begin
  USentencesT.Refresh;
  FormsQ.Refresh;
  TermsQ.Refresh;
  DefinitionsQ.Refresh;
  OSentencesQ.Refresh;
  VCatSenT.Refresh;
end;

procedure THauptF.SentencesTAfterPost(DataSet: TDataSet);
begin
  USentencesT.Refresh;
  StepsQ.Refresh;
  DefinitionsQ.Refresh;
  OSentencesQ.Refresh;
  VCatSenT.Refresh;
end;

procedure THauptF.SentencesTAfterRefresh(DataSet: TDataSet);
begin
  if not SentencesT.ControlsDisabled then begin
    if not SentencesT.IsEmpty then begin
      PutSentence(SentencesT.FieldByName('Sentence').Value);
    end;//if
  end;//if
  USentencesT.Refresh;
end;

procedure THauptF.PutSentence(Sent : Integer);
  var
    Index : Integer;
    StringList : TStringList;
begin
  Sent := SentencesT.FieldByName('Sentence').Value;
  if                MatrixTextPC.ActivePage = MatrixTS then begin
    SentGridSentence.Delete(0, 0);
    SentGridSentence.PutStringSentence(GetSentenceFromDatabase(Sent));
  end else begin if MatrixTextPC.ActivePage = TextTS then begin
    StringList := TStringList.Create;
    try
      StringSentence.SetSentence(GetSentenceFromDatabase(Sent));
      StringSentence.SentenceAsStringList(Sent, StringList);
      SentencesM.Lines.Clear;
      for Index := 0 to StringList.Count - 1 do begin
        SentencesM.Lines.Text := StringList.GetText;
      end;//for
    finally
      StringList.Free;
    end;
  end end;//if
end;

procedure THauptF.SentencesTAfterScroll(DataSet: TDataSet);
begin
  if not SentencesT.ControlsDisabled then begin
    if not SentencesT.IsEmpty then begin
      PutSentence(SentencesT.FieldByName('Sentence').Value);
    end;//if
  end;//if
end;

procedure THauptF.SentencesTBeforeInsert(DataSet: TDataSet);
begin
  Beep;
  Abort;
end;

procedure THauptF.SentencesTDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.SentencesTDESCRIPTIONGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := SentencesT.FieldByName('Description').AsString;
end;

procedure THauptF.SentencesTPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.SentGridKeyDown(
  Sender: TObject; var Key: Word;
  Shift: TShiftState
);
begin
  if Key = VK_UP then begin
    if                [ssCtrl] = Shift then begin
      if SentencesG.Height >= 57 then begin
        Panel8.Height := Panel8.Height + 22;
      end;//if
    end;//if
  end else begin if Key = VK_DOWN then begin
    if                [ssCtrl] = Shift then begin
      if SentGrid.Height >= 267 then begin
        Panel8.Height := Panel8.Height - 22;
      end;//if
    end;//if
  end else begin if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      MatrixTextPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      SentencesRulesPC.SetFocus;
    end end;//if
  end end end;//if
end;

procedure THauptF.Sidebyside1Click(Sender: TObject);
begin
  Tile;
end;

procedure THauptF.StepGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if                Chr(Key) = 'S' then begin
    if [ssShift, ssCtrl] = Shift then begin
      View1.Value := StepGridSentence.GetSCol + 1;
      if View1.Execute then begin
        StepGridSentence.ClientSetPosition(View1.Value);
      end;//
    end;//if
  end else begin if Key = VK_UP then begin
    if                [ssCtrl] = Shift then begin
      if StepsG.Height >= 57 then begin
        StepGrid.Height := StepGrid.Height + 22;
      end;//if
    end else begin if [ssShift, ssCtrl] = Shift then begin
      if Panel5.Height >= 57 then begin
        Panel4.Height := Panel4.Height - 22;
        StepGrid.Height := StepGrid.Height + 22;
      end;//if
    end end;//if
  end else begin if Key = VK_DOWN then begin
    if                [ssCtrl] = Shift then begin
      if StepGrid.Height >= 201 then begin
        StepGrid.Height := StepGrid.Height - 22;
      end;//if
    end else begin if [ssShift, ssCtrl] = Shift then begin
      if StepGrid.Height >= 201 then begin
        StepGrid.Height := StepGrid.Height - 22;
        Panel4.Height := Panel4.Height + 22;
      end;//if
    end end;//if
  end else begin if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      StepsG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      EditProofPC.SetFocus;
    end end;//if
  end end end end;//if
end;

procedure THauptF.StepsGDblClick(Sender: TObject);
  var
    Rule, Link : Integer;
begin
  if DataOK(Self) then begin
    if not StepsQ.IsEmpty then begin
      Rule := StepsQ.FieldByName('Rule').Value;
      if                Rule = 0 then begin
        Link := StepsQ.FieldByName('Link').Value;
        if SentencesT.Locate('Sentence', Link, []) then begin
           SentencesRulesPC.ActivePage := SentencesTS;
        end else begin
          MessageDlg(
            'The sentence is not visible.',
            mtWarning, [mbOK], 0
          );
        end;//if
      end else begin if (Rule > 0) and (Rule < 100) then begin
        if RulesT.Locate('Rule', Rule, []) then begin
          SentencesRulesPC.ActivePage := InferencesTS;
        end else begin
          MessageDlg(
            'The function is not visible.',
            mtWarning, [mbOK], 0
          );
        end;
      end else begin
        if FormulasT.Locate('Rule', Rule, []) then begin
          SentencesRulesPC.ActivePage := FormulasTS;
        end else begin
          MessageDlg(
            'The formula is not visible.',
            mtWarning, [mbOK], 0
          );
        end;//if
      end end;//if
    end else begin
      MessageDlg(
        'No proof!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.StepsGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      ProoGrid.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      StepGrid.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.StepsQAfterScroll(DataSet: TDataSet);
begin
  StepGridSentence.Delete(0, 0);
  if not StepsQ.IsEmpty then begin
    StepGridSentence.PutStringSentence(
      GetSentenceFromStep(
        StepsQ.FieldByName('Sentence').Value,
        StepsQ.FieldByName('Step').Value
      )
    );
  end;//if
end;

procedure THauptF.StepsQDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.StepsQPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.SwitchAux1Click(Sender: TObject);
begin
  if DataOK(Self) then begin
    SentencesT.Refresh;
    if not SentencesT.Eof then begin
      if SentencesT.FieldByName('Kind').Value <> 'U' then begin
        SentencesT.Edit;
        if SentencesT.FieldByName('Aux').Value = '0' then begin
          SentencesT.FieldByName('Aux').Value := '1';
        end else begin
          SentencesT.FieldByName('Aux').Value := '0';
        end;//if
        try
          SentencesT.Post;
        except
          SentencesT.Cancel;
        end;
        SentencesT.Refresh;
        FormsQ.Refresh;
        TermsQ.Refresh;
      end else begin
        MessageDlg('Sentence is undifined!', mtWarning, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('No sentence!', mtWarning, [mbOK], 0);
    end;//if
  end;//if
end;

procedure THauptF.Overlapping1Click(Sender: TObject);
begin
  Cascade;
end;

procedure SeparRind(
  Rind : String;
  var Step, Arg, SArg, Rule, Link, Col, SCol : Integer;
  var Formula : String
);
  var
    i : Integer;
    St : String;
begin
  Step := 0;
  Arg := 0;
  SArg := 0;
  Rule := 0;
  Link := 0;
  Col := 0;
  SCol := 0;
  Formula := '';
  i := 1;
  St := Separ(Rind, ';', i);
  if St <> '' then begin
    Step := StrToInt(St);
  end;//if
  St := Separ(Rind, ';', i);
  if St <> '' then begin
    Arg := StrToInt(St);
  end;//if
  St := Separ(Rind, ';', i);
  if St <> '' then begin
    SArg := StrToInt(St);
  end;//if
  St := Separ(Rind, ';', i);
  if St <> '' then begin
    Rule := StrToInt(St);
  end;//if
  Formula := Separ(Rind, ';', i);
  Formula := Copy(Formula, 2, Length(Formula) - 2);
  St := Separ(Rind, ';', i);
  if St <> '' then begin
    Link := StrToInt(St);
  end;//if
  St := Separ(Rind, ';', i);
  if St <> '' then begin
    Col := StrToInt(St);
  end;//if
  St := Separ(Rind, ';', i);
  if St <> '' then begin
    SCol := StrToInt(St);
  end;//if
end;

procedure THauptF.LoadProof(NewSent : Integer);
  var
    FileName : String;
    F : TextFile;
    Title, Sentence, Rind, Quantifiers : String;
    Step, Sent, Arg, SArg, Rule, Link, Col, SCol : Integer;
    Formula, LinkSentence, LinkS : String;
    OK : Boolean;
begin
  OpenDialog1.DefaultExt := '*.csv';
  OpenDialog1.Title := 'Load proof';
  if OpenDialog1.Execute then begin
    FileName := OpenDialog1.FileName;
    AssignFile(F, FileName);
    Reset(F);
    try
      ReadLn(F, Title);
      ReadLn(F, Sentence);
      ReadLn(F, Quantifiers);
      ReadLn(F, Rind);  // ca sa sara un rind
      OK := True;
      Sent := FindSentence(Sentence);
      if Sent <> 0 then begin
        if
          MessageDlg(
            'Sentence is equal to the sentence ' + IntToStr(Sent) + '. Load proof?',
            mtConfirmation, [mbOK], 0
          ) <> mrOK
        then begin
          OK := False;
        end;//if
      end;//if
      if OK then begin
        HauptF.LogicDB.StartTransaction;
        try
          Sent := WriteSentence(NewSent, Title, '', 'U', '');
          WriteVariables(Sent, Quantifiers);
          StringSentence.SetSentence(Sentence);
          StringSentence.SetSentenceToDatabase(Sent);
          while OK and not(Eof(F)) do begin
            ReadLn(F, Rind);
            SeparRind(
              Rind,
              Step, Arg, SArg, Rule, Link, Col, SCol,
              Formula
            );
            if Link <> 0 then begin
              ReadLn(F, LinkSentence);
              OK := False;
              GetKindQ.ParamByName('Sentence').Value := Link;
              GetKindQ.Open;
              try
                if not GetKindQ.FieldByName('Kind').IsNull then begin
                  if GetKindQ.FieldByName('Kind').Value <> 'U' then begin
                    if LinkSentence = GetSentenceFromDatabase(Link) then begin
                      OK := True;
                    end;//if
                  end;//if
                end;//if
              finally
                GetKindQ.Close;
              end;//try
              if not OK then begin
                LinkS := IntToStr(Link);
                Link := FindSentence(LinkSentence);
                if Link <> 0 then begin
                  OK := True;
                end else begin
                  MessageDlg('Sentence ' + LinkS + ' not found!', mtWarning, [mbOK], 0);
                end;//if
              end;//if
            end;//if
            if OK then begin
              OK := (ExecuteFunction(Sent, Arg, SArg, Rule, Link, Col, SCol, Formula) <> 0);
            end;//if
          end;//while
          SentencesT.Refresh;
          SentencesT.Locate('Sentence', Sent, []);
          USentencesT.Refresh;
          USentencesT.Locate('Sentence', Sent, []);
          if not StepsQ.Eof then begin
            VerifiesTheProof;
          end;//if
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
      end;//if
    finally
      CloseFile(F);
    end;
  end;//if
end;

procedure THauptF.Loadproof1Click(Sender: TObject);
begin
  if DataOK(Self) then begin
    LoadProof(0);
  end;//if
end;

procedure THauptF.Loadproofat1Click(Sender: TObject);
  var
    NewSent : Integer;
begin
  if DataOK(Self) then begin
    NewSent := 0;
    HauptF.SentView.Value := 0;
    if HauptF.SentView.Execute then begin
      NewSent := HauptF.SentView.Value;
    end;//if
    LoadProof(NewSent);
  end;//if
end;

function THauptF.AllQuantifAreUsed(
  SourceSentence : TStringSentence;
  StringList : TStringList;
  s : Integer
) : Boolean;
  var
    k : Integer;
begin
  Result := True;
  k := 1;
  while Result and (k < s) do begin
    if StringList.Values[IntToStr(k)] <> '' then begin
      k := SourceSentence.FirstPosAfter(k + 1);
    end else begin
      Result := False;
    end;
  end;//while
end;

function THauptF.SatisfyCondition(
  SourceSentence : TStringSentence;
  DestinSentence : TStringSentence;
  StringList : TStringList;
  Qj, j, i : Integer
) : Boolean;
  var
    Source, Destin : String;
    m, n, p, q : Integer;
    Gp, Gq : Integer;
    Np, Nq : Integer;
    Qi : Integer;
begin
  Result := True;
  Source := SourceSentence.GetSentence;
  Destin := DestinSentence.GetSentence;
  if Source[i] <> Stru then begin
    Qi := i - 1;
    p := i;
    q := j;
    m := SourceSentence.FirstPosAfter(p);
    n := DestinSentence.FirstPosAfter(q);
    while Result and (p < m) do begin
      if q < n then begin
        if Source[p] = Spoi then begin
          if Destin[q] = Spoi then begin
            Gp := SourceSentence.GetQuantifier(p);
            Gq := DestinSentence.GetQuantifier(q);
            Inc(p);
            Np := SourceSentence.GetNumber(p);
            Inc(q);
            Nq := DestinSentence.GetNumber(q);
            if                Gp < Qi then begin
              if StringList.Values[IntToStr(Gp)] <> '' then begin
                if Gq <> StrToInt(StringList.Values[IntToStr(Gp)]) then begin
                  Result := False;
                end;
              end else begin
                Result := False;
              end;//if
            end else begin if Gp = Qi then begin
              if Gq <> Qj then begin
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
          if Source[p] = Destin[q] then begin
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

function THauptF.RecCondition(
  SourceSentence : TStringSentence;
  DestinSentence : TStringSentence;
  StringList : TStringList;
  Qj, j, i : Integer
) : Boolean;
  var
    Destin : String;
begin
  Result := SatisfyCondition(SourceSentence, DestinSentence, StringList, Qj, j, i);
  Destin := DestinSentence.GetSentence;
  if not(Result) then begin
    if Destin[j] = Sand then begin
      Inc(j);
      Result := RecCondition(SourceSentence, DestinSentence, StringList, Qj, j, i);
      if not(Result) then begin
        j := DestinSentence.FirstPosAfter(j);
        Result := RecCondition(SourceSentence, DestinSentence, StringList, Qj, j, i);
      end;//if
    end;//if
  end;//if
end;

function THauptF.Match(
  SourceSentence : TStringSentence;
  DestinSentence : TStringSentence;
  StringList : TStringList;
  i, j : Integer
) : String;
  var
    Source, Destin : String;
    p, q, m, n, u, v, Gp, Gq, Np, Nq : Integer;
    Cond : String;
    nr : Integer;
    VerifiedQuant : TStringList;
    s : Integer;
    Pref : TPref;
begin
  Result := '';
  Source := SourceSentence.GetSentence;
  Destin := DestinSentence.GetSentence;
  nr := 0;
  p := i;
  q := j;
  m := SourceSentence.FirstPosAfter(i);
  n := DestinSentence.FirstPosAfter(j);
  while (Result = '') and (p < m) do begin
    if q < n then begin
      if Source[p] = Spoi then begin
        Inc(nr);
        if Destin[q] = Spoi then begin
          Gp := SourceSentence.GetQuantifier(p);
          Gq := DestinSentence.GetQuantifier(q);
          if Gp < i then begin  // extern
            if Gq < j then begin
              if
                (StringList.Values[IntToStr(Gp)] = '') or
                (StringList.Values[IntToStr(Gp)] = IntToStr(Gq))
              then begin
                StringList.Values[IntToStr(Gp)] := IntToStr(Gq);
                if Destin[Gq] = Sgen then begin
                  if Source[Gp + 1] = Stru then begin
                    p := SourceSentence.FirstPosAfter(p);
                    q := DestinSentence.FirstPosAfter(q);
                  end else begin
                    Result :=
                      'The link number ' + IntToStr(nr) + ' of the destination references a class generator. ' +
                      'The condition of the source quantifier is not satisfied.'
                    ;
                  end;//if
                end else begin
                  p := SourceSentence.FirstPosAfter(p);
                  q := DestinSentence.FirstPosAfter(q);
                end;//if
              end else begin
                Result :=
                  'No corresponding quantifier for the link number ' + IntToStr(nr) +
                  ' from the source.'
                ;
              end;//if
            end else begin
              Result :=
                'The quantifier referenced by the link ' + IntToStr(nr) + ' from the source ' +
                'is external to the source, but the corresponding link from the destination ' +
                'is internal to the destination.'
              ;
            end;//if
          end else begin        // intern
            if j <= Gq then begin
              Inc(p);
              Inc(q);
              Np := SourceSentence.GetNumber(p);
              Nq := DestinSentence.GetNumber(q);
              if Np <> Nq then begin
                Result :=
                  'No corresponding quantifier for the link number ' + IntToStr(nr) +
                  ' from the source.'
                ;
              end;//if
            end else begin
              Result :=
                'The quantifier referenced by the link ' + IntToStr(nr) + ' from the source ' +
                'is internal to the source, but the corresponding link from the destination ' +
                'is external to the destination.'
              ;
            end;//if
          end;//if
        end else begin
          Result :=
            'The link number ' + IntToStr(nr) + ' from the source ' +
            'has no correspondig link in the destination.'
          ;
        end;//if
      end else begin
        if Source[p] = Destin[q] then begin
          Inc(p);
          Inc(q);
        end else begin
          Result := 'The source and the destination are different.';
        end;//if
      end;//if
    end else begin
      Result := 'The source and the destination are different.';
    end;//if
  end;//while
  if Result = '' then begin
    Pref := SourceSentence.Prefix(False, 1);
    s := Pref.SecArgOfLast;
    if AllQuantifAreUsed(SourceSentence, StringList, s) then begin
      // Verify the condition of the quantifiers.
      VerifiedQuant := TStringList.Create;
      try
        nr := 0;
        p := i;
        q := j;
        m := SourceSentence.FirstPosAfter(i);
        n := DestinSentence.FirstPosAfter(j);
        while (Result = '') and (p < m) do begin
          if Source[p] = Spoi then begin
            Inc(nr);
            Gp := SourceSentence.GetQuantifier(p);
            Gq := DestinSentence.GetQuantifier(q);
            if Gp < i then begin  // extern
              if Destin[Gq] <> Sgen then begin
                if VerifiedQuant.Values[IntToStr(Gp)] = '' then begin
                  VerifiedQuant.Values[IntToStr(Gp)] := IntToStr(Gp);
                  if
                    RecCondition(
                      SourceSentence, DestinSentence, StringList,
                        Gq, Gq + 1, Gp + 1
                    )
                  then begin
                    p := SourceSentence.FirstPosAfter(p);
                    q := DestinSentence.FirstPosAfter(q);
                  end else begin
                    Result :=
                      'The function cannot verify the condition of the quantifier ' +
                      'referenced by the link number ' + IntToStr(nr) + ' of the destination.'
                    ;
                  end;//if
                end else begin
                  Inc(p);
                  Inc(q);
                end;//if
              end else begin
                Inc(p);
                Inc(q);
              end;//if
            end else begin
              Inc(p);
              Inc(q);
            end;//if
          end else begin
            Inc(p);
            Inc(q);
          end;//if
        end;//while
      finally
        VerifiedQuant.Free;
      end;//try
    end else begin
      Result :=
        'The source must reference all the quantifiers in the pre-q-list of the source step.'
      ;
    end;
  end;//if
end;

procedure THauptF.MatrixTextPCChange(Sender: TObject);
begin
  if not SentencesT.IsEmpty then begin
    PutSentence(SentencesT.FieldByName('Sentence').Value);
  end;//if
end;

function THauptF.PrepareTheSecondArgument(
  SourceSentence : TStringSentence;
  DestinSentence : TStringSentence;
  StringList : TStringList;
  i, j : Integer
) : String;
  var
    Source, Destin : String;
    m, p, Gp, Np, Gq, Nq, Dif : Integer;
begin
  Result := '';
  Source := SourceSentence.GetSentence;
  Destin := DestinSentence.GetSentence;
  m := SourceSentence.FirstPosAfter(i);
  p := m;
  while p <= Length(Source) do begin
    if Source[p] = Spoi then begin
      Gp := SourceSentence.GetQuantifier(p);
      if Gp < m then begin  // extern
        Gq := StrToInt(StringList.Values[IntToStr(Gp)]);
        Nq := DestinSentence.QuantifierParentsNumber(Gq, j);
        Dif := SourceSentence.QuantifierParentsNumber(m, p);
        Result := Result + Spoi + IntToStr(Nq + Dif);
        p := SourceSentence.FirstPosAfter(p);
      end else begin        // intern
        Inc(p);
        Np := SourceSentence.GetNumber(p);
        Result := Result + Spoi + IntToStr(Np);
      end;//if
    end else begin
      Result := Result + Source[p];
      Inc(p);
    end;//if
  end;//while
end;

function THauptF.CrossReplacement(Source, Destin : String; j : Integer) : String;
// Toti quantificatorii din prefixul lui Source sunt Suni.
// Prima forma dupa prefixul lui Source trebuie sa fie Sdou, Simp, Seqa.
// j indica o form sau un term in Destin, care trebuie sa fie la fel cu primul argument al lui
// Sdou sau Simp din Source.
  var
    SourceSentence : TStringSentence;
    DestinSentence : TStringSentence;
    StringList : TStringList;
    i, m, n, s : Integer;
    Pref : TPref;
    OK : Boolean;
    St : String;
begin
  Result := '';
  SourceSentence := TStringSentence.Create;
  DestinSentence := TStringSentence.Create;
  StringList := TStringList.Create;
  try
    SourceSentence.SetSentence(Source);
    DestinSentence.SetSentence(Destin);
    Pref := SourceSentence.Prefix(False, 1);
    s := Pref.SecArgOfLast;
    OK := False;
    if                Source[s] = Sdou then begin
      if DestinSentence.IsForm(j) then begin
        OK := True;
      end else begin
        MessageDlg(
          'The expression you want to replace must be a form.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin if Source[s] = Simp then begin
      if DestinSentence.IsForm(j) then begin
        if DestinSentence.CanBeImplied(j) then begin
          OK := True;
        end else begin
          MessageDlg(
            'The expression you want to replace cannot be implied.',
             mtWarning, [mbOK], 0
          );
        end;//if
      end else begin
        MessageDlg(
          'The expression you want to replace must be a form.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin if Source[s] = Seqa then begin
      if DestinSentence.IsTerm(j) then begin
        OK := True;
      end else begin
        MessageDlg(
          'The expression you want to replace must be a term.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The prefix-arg of the source must be ' +
        'an implication, a double implication or an equality.',
        mtWarning, [mbOK], 0
      );
    end end end;//if
    if OK then begin
      i := s + 1;
      m := SourceSentence.FirstPosAfter(i);
      n := DestinSentence.FirstPosAfter(j);
      St := Match(SourceSentence, DestinSentence, StringList, i, j);
      if St = '' then begin
        Result :=
          Copy(Destin, 1, j - 1) +
          PrepareTheSecondArgument(SourceSentence, DestinSentence, StringList, i, j) +
          Copy(Destin, n, Length(Destin) - n + 1)
        ;
      end else begin
        MessageDlg(St, mtWarning, [mbOK], 0);
      end;//if
    end;//if
  finally
    SourceSentence.Free;
    DestinSentence.Free;
    StringList.Free;
  end;//try
end;

function THauptF.ReducedCrossReplacement(Source, Destin : String; j : Integer) : String;
// E CrossReplacement fara mesaje.
  var
    SourceSentence : TStringSentence;
    DestinSentence : TStringSentence;
    StringList : TStringList;
    i, m, n, s : Integer;
    Pref : TPref;
    OK : Boolean;
begin
  Result := '';
  SourceSentence := TStringSentence.Create;
  DestinSentence := TStringSentence.Create;
  StringList := TStringList.Create;
  try
    SourceSentence.SetSentence(Source);
    DestinSentence.SetSentence(Destin);
    Pref := SourceSentence.Prefix(False, 1);
    s := Pref.SecArgOfLast;
    OK := False;
    if                Source[s] = Sdou then begin
      if DestinSentence.IsForm(j) then begin
        OK := True;
      end;//if
    end else begin if Source[s] = Simp then begin
      if DestinSentence.IsForm(j) then begin
        if DestinSentence.CanBeImplied(j) then begin
          OK := True;
        end;//if
      end;//if
    end else begin if Source[s] = Seqa then begin
      if DestinSentence.IsTerm(j) then begin
        OK := True;
      end;//if
    end end end;//if
    if OK then begin
      i := s + 1;
      m := SourceSentence.FirstPosAfter(i);
      n := DestinSentence.FirstPosAfter(j);
      if Match(SourceSentence, DestinSentence, StringList, i, j) = '' then begin
        Result :=
          Copy(Destin, 1, j - 1) +
          PrepareTheSecondArgument(SourceSentence, DestinSentence, StringList, i, j) +
          Copy(Destin, n, Length(Destin) - n + 1)
        ;
      end;//if
    end;//if
  finally
    SourceSentence.Free;
    DestinSentence.Free;
    StringList.Free;
  end;//try
end;

procedure THauptF.CategoriesGDblClick(Sender: TObject);
begin
  if DataOK(Self) then begin
    if SentencesRulesPC.ActivePage = SentencesTS then begin
      if MatrixTextPC.ActivePage = CategoryTS then begin
        if not CategoriesT.IsEmpty then begin
          CanInsert := True;
          try
            try
              VSenCatT.Insert;
              VSenCatT.FieldByName('Category').Value :=
                CategoriesT.FieldByName('Category').Value
              ;
              VSenCatT.Post;
              VSenCatT.Refresh;
            except
              VSenCatT.Cancel;
            end;//try
          finally
            CanInsert := False;
          end;
        end else begin
          MessageDlg('No category!', mtWarning, [mbOK], 0);
        end;//if
      end else begin
        MessageDlg('Open the page "Category"!', mtWarning, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('Open the page "Sentences"!', mtWarning, [mbOK], 0);
    end;//if
  end;//if
end;

procedure THauptF.CategoriesGExit(Sender: TObject);
begin
  MyExitGrid(Sender);
end;

procedure THauptF.CategoriesGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      VCatSenG.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.CategoriesTAfterDelete(DataSet: TDataSet);
begin
  VSenCatT.Refresh;
end;

procedure THauptF.CategoriesTAfterInsert(DataSet: TDataSet);
begin
  CategorySP.ExecProc;
  CategoriesT.FieldByName('Category').Value := CategorySP.ParamByName('Category').Value;
end;

procedure THauptF.CategoriesTAfterPost(DataSet: TDataSet);
begin
  CategoriesT.Refresh;
  VSenCatT.Refresh;
end;

procedure THauptF.CategoriesTAfterScroll(DataSet: TDataSet);
begin
  VCatSenTAfterScroll(Nil);
end;

procedure THauptF.CategoriesTDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.CategoriesTNewRecord(DataSet: TDataSet);
begin
  CategoriesT.FieldByName('Category').Value := 0;
end;

procedure THauptF.CategoriesTPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.CateGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if                Key = VK_UP then begin
    if                [ssCtrl] = Shift then begin
      if VCatSenG.Height >= 57 then begin
        CateGrid.Height := CateGrid.Height + 22;
      end;//if
    end;//if
  end else begin if Key = VK_DOWN then begin
    if                [ssCtrl] = Shift then begin
      if CateGrid.Height >= 201 then begin
        CateGrid.Height := CateGrid.Height - 22;
      end;//if
    end;//if
  end else begin if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      VCatSenG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      EditProofPC.SetFocus;
    end end;//if
  end end end;//if
end;

procedure THauptF.CopySentence1Click(Sender: TObject);
begin
  SentencesGDblClick(Sender);
end;

procedure THauptF.Copysentencetoclipboard1Click(Sender: TObject);
  var
    St : String;
begin
  if not SentencesT.IsEmpty then begin
    StringSentence.SetSentence(GetSentenceFromDatabase(SentencesT.FieldByName('Sentence').Value));
    St := StringSentence.SentenceAsUsual(SentencesT.FieldByName('Sentence').Value);
    if St <> '' then begin
      Clipboard.AsText := St;
    end else begin
      MessageDlg('First define variable for all the quantifiers!', mtWarning, [mbOK], 0);
    end;//if
  end;//if
end;

function THauptF.CrossAttachment(Source, Destin : String; j : Integer) : String;
// Toti quantificatorii din prefixul lui Source sunt Suni.
// Prima forma dupa prefixul lui Source trebuie sa fie Simp.
// j indica o form in Destin, care trebuie sa fie la fel cu primul argument al lui
// Simp din Source.
// Daca j are ca parinte o conjunctie si celalalt argument al acestei conjuntii
// e egal cu cel de-al doilea argument al implicatiei din sursa, atunci functia
// inlocuieste conjuntia din destinatie cu forma selectata in destinatie.
// In caz contrar, functia inlocuieste forma selectata in destinatie cu o conjuntie
// formata din din aceasta forma si al doilea argument al implicatiei din sursa.
  var
    SourceSentence : TStringSentence;
    DestinSentence : TStringSentence;
    StringList : TStringList;
    s, i, m : Integer;  // pentru Source
    x, q, r : Integer;  // pentru Destin
    Pref : TPref;
    OK, Adding : Boolean;
    St, SecArg : String;
begin
  Result := '';
  SourceSentence := TStringSentence.Create;
  DestinSentence := TStringSentence.Create;
  StringList := TStringList.Create;
  try
    SourceSentence.SetSentence(Source);
    DestinSentence.SetSentence(Destin);
    Pref := SourceSentence.Prefix(False, 1);
    s := Pref.SecArgOfLast;
    OK := False;
    if Source[s] = Simp then begin
      if DestinSentence.IsForm(j) then begin
        OK := True;
      end else begin
        MessageDlg(
          'The expression you want to replace must be a form.',
           mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'The prefix-arg of the source must be an implication.',
        mtWarning, [mbOK], 0
      );
    end;//if
    if OK then begin
      i := s + 1;
      m := SourceSentence.FirstPosAfter(i);
      St := Match(SourceSentence, DestinSentence, StringList, i, j);
      if St = '' then begin
        SecArg := PrepareTheSecondArgument(SourceSentence, DestinSentence, StringList, i, j);
        if j = 1 then begin
          Result := Sand + Destin + SecArg;
        end else begin  // j > 1
          Adding := True;
          x := DestinSentence.Parent(j);
          if Destin[x] = Sand then begin
            if x = j - 1 then begin  // j e primul argument al lui X
              q := DestinSentence.FirstPosAfter(j);
              r := DestinSentence.FirstPosAfter(x);
              if SecArg = Copy(Destin, q, r - q) then begin
                Result :=
                  Copy(Destin, 1, j - 2) +
                  Copy(Destin, j, q - j) +
                  Copy(Destin, r, Length(Destin) - r + 1)
                ;
                Adding := False;
              end;//if
            end else begin           // j e al doilea argument al lui X
              q := x + 1;
              r := DestinSentence.FirstPosAfter(x);
              if SecArg = Copy(Destin, q, j - q) then begin
                Result :=
                  Copy(Destin, 1, x - 1) +
                  Copy(Destin, j, r - j) +
                  Copy(Destin, r, Length(Destin) - r + 1)
                ;
                Adding := False;
              end;//if
            end;//if
          end;//if
          if Adding then begin
            r := DestinSentence.FirstPosAfter(j);
            Result :=
              Copy(Destin, 1, j - 1) +
              Sand +
              Copy(Destin, j, r - j) +
              SecArg +
              Copy(Destin, r, Length(Destin) - r + 1)
            ;
          end;//if
        end;//if
      end else begin
        MessageDlg(St, mtWarning, [mbOK], 0);
      end;//if
    end;//if
  finally
    SourceSentence.Free;
    DestinSentence.Free;
    StringList.Free;
  end;//try
end;

procedure THauptF.ProofExistUnique;
  var
    Sent, Step, Arg, SArg, Rule, i, nr : Integer;
    Exist, Unique, Sentence : String;
    Title, Description, Operation : String;
    ExistUnique : TExistUnique;
begin
  if not StepsQ.IsEmpty then begin
    Title := USentencesT.FieldByName('Title').AsString;
    StepsQ.First;
    Sent := StepsQ.FieldByName('Sentence').Value;
    Sentence := GetSentenceFromDatabase(Sent);
    Arg := StepsQ.FieldByName('Step').Value;
    if Arg = 1 then begin
      Exist := GetSentenceFromStep(Sent, Arg);
      StepsQ.Next;
      Arg := StepsQ.FieldByName('Step').Value;
      if Arg = 2 then begin
        Unique := GetSentenceFromStep(Sent, Arg);
        StepsQ.Next;
        if StepsQ.Eof then begin
          ExistUnique := TExistUnique.Create(Exist, Unique);
          try
            if ExistUnique.DefinesAFunction then begin
              Operation := InputBox('Definition', 'Function', '');
              if Operation <> '' then begin
                if
                  (Pos('(', Operation) = 0)
                  and (Pos(')', Operation) = 0)
                  and (Pos(Spoi, Operation) = 0)
                then begin
                  if not HauptF.OperationExists(Operation) then begin
                    Sentence := ExistUnique.GetFunction(Operation, nr);
                    WriteOperation(Operation, Title, Sterm, Sterm, nr);

                    StringSentence.SetSentence(Sentence);
                    StringSentence.SetSentenceToDatabase(Sent);

                    ChangeKindOpUQ.ParamByName('Sentence').Value := Sent;
                    ChangeKindOpUQ.ParamByName('Kind').Value := 'F';
                    ChangeKindOpUQ.ParamByName('Operation').Value := Operation;
                    ChangeKindOpUQ.ExecSQL;

                    USentencesT.Refresh;
                    USentencesTAfterScroll(Nil);
                    SentencesT.Refresh;
                    TermsQ.Refresh;
                    MessageDlg('The sentence defines now a function!', mtInformation, [mbOK], 0);
                  end else begin
                    MessageDlg('Name already exists!', mtWarning, [mbOK], 0);
                  end;//if
                end else begin
                  MessageDlg('"(", ")" and "^" are not permited!', mtWarning, [mbOK], 0);
                end;//if
              end;//if
            end;//if
          finally
            ExistUnique.Free;
          end;//try
        end else begin
          MessageDlg('Too many steps!', mtWarning, [mbOK], 0);
        end;//if
      end else begin
        MessageDlg('The second step has a wrong number!', mtError, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('The first step has a wrong number!', mtError, [mbOK], 0);
    end;//if
  end else begin
    MessageDlg('No step!', mtWarning, [mbOK], 0);
  end;//if
end;

procedure THauptF.AuxCBClick(Sender: TObject);
begin
  SetSentenceFilter;
end;

procedure THauptF.AxiomCBClick(Sender: TObject);
begin
  SetSentenceFilter;
end;

function THauptF.HasExistence(Destin : String; i, Sent, Step : Integer) : Boolean;
// Destin e sentinta in care vrem sa stergem cuantificatorul
// modificata prin PrepareDeleteQuantifier.
  var
    SourceSentence : TStringSentence;
    Source : String;
begin
  Result := False;
  SourceSentence := TStringSentence.Create;
  try
    DeleteQuantifierQ.ParamByName('Sentence').Value := Sent;
    DeleteQuantifierQ.ParamByName('Step').Value := Step;
    DeleteQuantifierQ.Open;
    try
      while not(Result or DeleteQuantifierQ.Eof) do begin
        SourceSentence.SetSentence(
          GetSentenceFromDatabase(DeleteQuantifierQ.FieldByName('Sentence').Value)
        );
        Source := SourceSentence.MakeExistenceAsDImplication;
        if Source <> '' then begin
          Result := (ReducedCrossReplacement(Source, Destin, i) <> '');
        end;//if
        DeleteQuantifierQ.Next;
      end;//while
    finally
      DeleteQuantifierQ.Close;
    end;//try
  finally
    SourceSentence.Free;
  end;//try
end;

function THauptF.DeleteQuantifier(Sent, Arg, Rule, Col, i : Integer) : Integer;
  var
    Res, Destin : String;
begin
  Result := 0;
  Res := StringSentence.CanDeleteQuantifier(i);
  if Res = '0' then begin
    // StringSentence contine sentinta din care vrem sa stergem cuantificatorul.
    // PrepareDeleteQuantifier muta cuantificatorul o pozite la dreapta!
    Destin := StringSentence.PrepareDeleteQuantifier(i);
    if HasExistence(Destin, i + 1, Sent, Arg) then begin
      Res := StringSentence.DeleteQuantifier(i);
    end;//if
  end;//if
  if                Res = '0' then begin
    MessageDlg(MessageDeleteQuantifier, mtWarning, [mbOK], 0);
  end else begin if Res = '1' then begin
    MessageDlg(
      'The current position on the grid must be a quantifier.',
      mtWarning, [mbOK], 0
    );
  end else begin if Res = '2' then begin
    MessageDlg(
      'The execution argument of the quantifier references the quantifier.',
      mtWarning, [mbOK], 0
    );
  end else begin
    Result := StepGridSentence.GetStepForSentence(
      Sent,
      Arg, 0, Rule, Col, -1,
      Res
    );
  end end end;//if
end;

function THauptF.DeleteQuantifiers(Sent, Arg, Rule, Col, i : Integer) : Integer;
  var
    Res, Destin : String;
    p, nr : Integer;  // parent of i
begin
  Result := 0;
  // StringSentence contine sentinta din care vrem sa stergem cuantificatorii.
  nr := 0;
  Res := StringSentence.GetSentence;
  while (Res <> '0') and (Res <> '1') and (Res <> '2') and (i > 0) do begin
    p := StringSentence.Parent(i);
    Res := StringSentence.CanDeleteQuantifier(i);
    if Res = '0' then begin
      // PrepareDeleteQuantifier muta cuantificatorul o pozite la dreapta!
      Destin := StringSentence.PrepareDeleteQuantifier(i);
      if HasExistence(Destin, i + 1, Sent, Arg) then begin
        Res := StringSentence.DeleteQuantifier(i);
      end;//if
    end;//if
    if (Res <> '0') and (Res <> '1') and (Res <> '2') then begin
      StringSentence.SetSentence(Res);
      i := p;
      Inc(nr);
    end;//if
  end;//while
  if nr > 0 then begin  // cel putin o data cu succes
    if (Res = '0') or (Res = '1') or (Res = '2') then begin
      Res := StringSentence.GetSentence;
    end;//if
    Result := StepGridSentence.GetStepForSentence(
      Sent,
      Arg, 0, Rule, Col, -1,
      Res
    );
  end else begin
    if                Res = '0' then begin
      MessageDlg(MessageDeleteQuantifier, mtWarning, [mbOK], 0);
    end else begin if Res = '1' then begin
      MessageDlg(
        'The current position on the grid must be a quantifier.',
        mtWarning, [mbOK], 0
      );
    end else begin if Res = '2' then begin
      MessageDlg(
        'The execution argument of the quantifier references the quantifier.',
        mtWarning, [mbOK], 0
      );
    end end end;//if
  end;//if
end;

function THauptF.DeleteQuantifiersSentence(Sent, Arg, i : Integer) : String;
// StringSentence contine sentinta din care vrem sa stergem cuantificatorii.
  var
    Destin : String;
    p : Integer;  // parent of i
begin
  Result := '';
  Result := StringSentence.GetSentence;
  while (Result <> '0') and (Result <> '1') and (Result <> '2') and (i > 0) do begin
    p := StringSentence.Parent(i);
    Result := StringSentence.CanDeleteQuantifier(i);
    if Result = '0' then begin
      // PrepareDeleteQuantifier muta cuantificatorul o pozite la dreapta!
      Destin := StringSentence.PrepareDeleteQuantifier(i);
      if HasExistence(Destin, i + 1, Sent, Arg) then begin
        Result := StringSentence.DeleteQuantifier(i);
      end;//if
    end;//if
    if (Result <> '0') and (Result <> '1') and (Result <> '2') then begin
      StringSentence.SetSentence(Result);
      i := p;
    end;//if
  end;//while
end;

function THauptF.Reductio(Sentence : Integer) : Boolean;
begin
  Result := False;
  ReductioQ.ParamByName('Sentence').Value := Sentence;
  try
    ReductioQ.Open;
    Result := not(ReductioQ.FieldByName('Step').IsNull);
  finally
    ReductioQ.Close;
  end;//try
end;

procedure THauptF.RelationCBClick(Sender: TObject);
begin
  SetSentenceFilter;
end;

procedure THauptF.VCatSenGDblClick(Sender: TObject);
  var
    Sent : Integer;
begin
  if DataOK(Self) then begin
    if not VCatSenT.IsEmpty then begin
      Sent := VCatSenT.FieldByName('Sentence').Value;
      if SentencesT.Locate('Sentence', Sent, []) then begin
         SentencesRulesPC.ActivePage := SentencesTS;
      end else begin
        MessageDlg(
          'The sentence is not visible.',
          mtWarning, [mbOK], 0
        );
      end;//if
    end else begin
      MessageDlg(
        'No sentence!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.VCatSenGDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DrawSentences(VCatSenT, VCatSenG);
  VCatSenG.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure THauptF.VCatSenGExit(Sender: TObject);
begin
  MyExitGrid(Sender);
end;

procedure THauptF.VCatSenGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      CategoriesG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      CateGrid.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.VCatSenTAfterDelete(DataSet: TDataSet);
begin
  VSenCatT.Refresh;
end;

procedure THauptF.VCatSenTAfterPost(DataSet: TDataSet);
begin
  VCatSenT.Refresh;
  VCatSenTAfterScroll(Nil);
  VSenCatT.Refresh;
end;

procedure THauptF.VCatSenTAfterScroll(DataSet: TDataSet);
begin
  if not VCatSenT.ControlsDisabled then begin
    CateGridSentence.Delete(0, 0);
    if not VCatSenT.FieldByName('Sentence').IsNull then begin
      CateGridSentence.PutStringSentence(
        GetSentenceFromDatabase(VCatSenT.FieldByName('Sentence').Value)
      );
    end;//if
  end;//if
end;

procedure THauptF.VCatSenTBeforeEdit(DataSet: TDataSet);
begin
  Beep;
  Abort;
end;

procedure THauptF.VCatSenTDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.VCatSenTDESCRIPTIONGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := VCatSenT.FieldByName('Description').AsString;
end;

procedure THauptF.VCatSenTPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

function THauptF.FirstDifPos(Sentence, Step : Integer) : Integer;
// -1 pentru lungimi diferite
// 0 pentru egalitate
// mai mare de 0 da pozitia de unde nu mai sunt egale
begin
  FirstDifPosSP.ParamByName('Sentence').Value := Sentence;
  FirstDifPosSP.ParamByName('Step').Value := Step;
  FirstDifPosSP.ExecProc;
  Result := FirstDifPosSP.ParamByName('Pos').Value;
end;

procedure THauptF.VerifiesTheProof;
  var
    Sent, Step, Arg : Integer;
    OK : Boolean;
    //Sentence : String;
    Res, Pos : Integer;
begin
  // Astea sunt verificate la apel:
  // not USentencesT.IsEmpty then begin
  // USentencesT.FieldByName('Kind').Value = 'U' then begin
  // not StepsQ.IsEmpty then begin
  Sent := StepsQ.FieldByName('Sentence').Value;
  if GetSentenceFromDatabase(Sent) = Stru then begin
    ProofExistUnique;
  end else begin
    StepsQ.Last;
    if Reductio(Sent) then begin
      Arg := StepsQ.FieldByName('Step').Value;
      StringSentence.SetSentence(GetSentenceFromStep(Sent, Arg));
      if StringSentence.IsAContradiction then begin
        OK := False;
        ChangeKindQ.ParamByName('Sentence').Value := Sent;
        ChangeKindQ.ParamByName('Kind').Value := 'T';
        try
          ChangeKindQ.ExecSQL;
          OK := True;
        except
          on E : Exception do begin
            if E is EDatabaseError then begin
              MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
            end else begin
              MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
          end;//on
        end;//try
        if OK then begin
          USentencesT.Refresh;
          SentencesT.Refresh;
          //MessageDlg('The sentence is now a theorem!', mtInformation, [mbOK], 0);
        end;//if
      end else begin
        MessageDlg('The step is not a contradiction!', mtWarning, [mbOK], 0);
      end;//if
    end else begin  // demonstratie directa
      Res := FirstDifPos(Sent, StepsQ.FieldByName('Step').Value);
      if Res = 0 then begin
        OK := False;
        ChangeKindQ.ParamByName('Sentence').Value := Sent;
        ChangeKindQ.ParamByName('Kind').Value := 'T';
        try
          ChangeKindQ.ExecSQL;
          OK := True;
        except
          on E : Exception do begin
            if E is EDatabaseError then begin
              MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
            end else begin
              MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
          end;//on
        end;//try
        if OK then begin
          USentencesT.Refresh;
          SentencesT.Refresh;
          OSentencesQ.Refresh;
          //MessageDlg('The sentence is now a theorem!', mtInformation, [mbOK], 0);
        end;//if
      end else begin if Res = -1 then begin
        MessageDlg('The sentences have different length.', mtWarning, [mbOK], 0);
      end else begin  // Res > 0
        StepGridSentence.ClientSetPosition(Res);
        StepGrid.SetFocus;
        MessageDlg(
          'The sentences differ at the position ' + IntToStr(Res) + '.',
          mtWarning, [mbOK], 0
        );
      end end;//if
    end;//if
  end;//if
end;

procedure THauptF.VerifyProof(Msg : Boolean);
  var
    Sent, Arg, SArg, Rule, Link, Col, SCol : Integer;
    Formula : String;
    Sentence, Title : String;
    CurSent, Step : Integer;
    OK : Boolean;
begin
  Sent := 0;
  Step := 0;
  HauptF.LogicDB.StartTransaction;
  try
    CurSent := USentencesT.FieldByName('Sentence').Value;
    Title := USentencesT.FieldByName('Title').AsString;
    Sentence := GetSentenceFromDatabase(CurSent);
    Sent := WriteSentence(0, Title, '', 'U', '');
    StringSentence.SetSentence(Sentence);  // pt. instructiunea urmatoare
    StringSentence.SetSentenceToDatabase(Sent);
    StepsVQ.ParamByName('Sentence').Value := CurSent;
    StepsVQ.Open;
    OK := True;
    try
      while OK and (not StepsVQ.Eof) do begin
        if StepsVQ.FieldByName('Arg').IsNull then begin
          Arg := 0;
        end else begin
          Arg := StepsVQ.FieldByName('Arg').Value;
        end;//if
        if StepsVQ.FieldByName('SArg').IsNull then begin
          SArg := 0;
        end else begin
          SArg := StepsVQ.FieldByName('SArg').Value;
        end;//if
        if StepsVQ.FieldByName('Rule').IsNull then begin
          Rule := 0;
        end else begin
          Rule := StepsVQ.FieldByName('Rule').Value;
        end;//if
        if StepsVQ.FieldByName('Link').IsNull then begin
          Link := 0;
        end else begin
          Link := StepsVQ.FieldByName('Link').Value;
        end;//if
        if StepsVQ.FieldByName('Col').IsNull then begin
          Col := 0;
        end else begin
          Col := StepsVQ.FieldByName('Col').Value;
        end;//if
        if StepsVQ.FieldByName('SCol').IsNull then begin
          SCol := 0;
        end else begin
          SCol := StepsVQ.FieldByName('SCol').Value;
        end;//if
        Formula := StepsVQ.FieldByName('Formula').AsString;
        Step := ExecuteFunction(Sent, Arg, SArg, Rule, Link, Col, SCol, Formula);
        OK := False;
        if Step > 0 then begin
          if GetSentenceFromStep(Sent, Step) = GetSentenceFromStep(CurSent, Step) then begin
            OK := True;
          end;
        end;//if
        StepsVQ.Next;
      end;//while;
    finally
      StepsVQ.Close;
    end;//try
    if OK then begin
      HauptF.LogicDB.Rollback;
      if Msg then begin
        MessageDlg('The proof is correct!', mtInformation, [mbOK], 0);
      end;//if
    end else begin
      HauptF.LogicDB.Commit;
      USentencesT.Refresh;
      SentencesT.Refresh;
      if Sent <> 0 then begin
        USentencesT.Locate('Sentence', Sent, []);
        SentencesT.Locate('Sentence', Sent, []);
      end;//if
    end;//if
  except
    on E : Exception do begin
      HauptF.LogicDB.Commit;
      if E is EDatabaseError then begin
        MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
      end else begin
        MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
      USentencesT.Refresh;
      SentencesT.Refresh;
      if Sent <> 0 then begin
        USentencesT.Locate('Sentence', Sent, []);
        SentencesT.Locate('Sentence', Sent, []);
      end;//if
    end;//on
  end;
end;

procedure THauptF.Verifyalltheproofs1Click(Sender: TObject);
begin
  USentencesT.Refresh;
  //USentencesT.First;
  while not USentencesT.Eof do begin
    VerifyProof(False);
    USentencesT.Next;
  end;//while
end;

procedure THauptF.Verifyproof1Click(Sender: TObject);
  var
    Sent, Arg, SArg, Rule, Link, Col, SCol : Integer;
    Formula : String;
    Sentence, Title : String;
    CurSent, Step : Integer;
    OK : Boolean;
begin
  if DataOK(Self) then begin
    if not StepsQ.IsEmpty then begin
      VerifyProof(True);
    end else begin
      MessageDlg(
        'No proof!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.VSenCatGExit(Sender: TObject);
begin
  MyExitGrid(Sender);
end;

procedure THauptF.VSenCatGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      MatrixTextPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      SentencesRulesPC.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.VSenCatTAfterDelete(DataSet: TDataSet);
begin
  VCatSenT.Refresh;
end;

procedure THauptF.VSenCatTAfterPost(DataSet: TDataSet);
begin
  VCatSenT.Refresh;
end;

procedure THauptF.VSenCatTBeforeEdit(DataSet: TDataSet);
begin
  Beep;
  Abort;
end;

procedure THauptF.VSenCatTBeforeInsert(DataSet: TDataSet);
begin
  if not CanInsert then begin
    Beep;
    Abort;
  end;//if
end;

procedure THauptF.VSenCatTDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.VSenCatTPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.RulesGDblClick(Sender: TObject);
  var
    Sent, Arg, SArg, Rule, Link, Col, SCol : Integer;
    Formula : String;
    Step : Integer;
    SelRows : Integer;
    //Sent, Step, Arg, SArg, SelRows, Rule, i : Integer;
    //Sentence1, Sentence2 : String;
    OK : Boolean;
begin
  Sent := 0;
  Arg := 0;
  SArg := 0;
  Rule := 0;
  Link := 0;
  Col := 0;
  SCol := 0;
  Formula := '';
  HauptF.LogicDB.StartTransaction;
  try
    if EditProofPC.ActivePage = ProofTS then begin
      StepsG.SetFocus;
      if not USentencesT.IsEmpty then begin
        Sent := USentencesT.FieldByName('Sentence').Value;
        if USentencesT.FieldByName('Kind').Value = 'U' then begin
          if not RulesT.IsEmpty then begin
            Rule := RulesT.FieldByName('Rule').Value;
            OK := False;
            if Rule in [15, 20, 29] then begin
              // fara argumente
              ProofHasSentenceQ.Open;
              try
                if ProofHasSentenceQ.FieldByName('Number').Value = 0 then begin
                  OK := True;
                end else begin
                  Beep;
                  MessageDlg(
                    'One of the following inference operators has allready been used:' + #13#10 +
                    'Extracting the hypothesis' + #13#10 +
                    'Reductio ad absurdum' + #13#10 +
                    'Tautologize',
                    mtWarning, [mbOK], 0
                  );
                end;//if
              finally
                ProofHasSentenceQ.Close;
              end;
            end else begin
              if not StepsQ.IsEmpty then begin
                if Rule = 17 then begin  // VerifiesTheProof
                  VerifiesTheProof;
                end else begin
                  if                Rule in [1, 23, 28] then begin
                    // Arg, SArg, Col
                    SArg := StepsQ.FieldByName('Step').Value;
                    SelRows := StepsG.SelectedRows.Count;
                    if SelRows = 2 then begin
                      if StepGridSentence.ColInContent then begin
                        Col := StepGridSentence.GetSCol + 1;
                        StepsQ.GotoBookmark(StepsG.SelectedRows.Items[0]);
                        Arg := StepsQ.FieldByName('Step').Value;
                        if Arg = SArg then begin
                          StepsQ.GotoBookmark(StepsG.SelectedRows.Items[1]);
                          Arg := StepsQ.FieldByName('Step').Value;
                        end;//if
                        OK := True;
                      end;//if
                    end else begin
                      MessageDlg('First select two steps and a position on the grid!', mtWarning, [mbOK], 0);
                    end;//if
                  end else begin if Rule in [2, 6, 18, 19, 25, 27, 30, 31] then begin
                    // Arg, Col, SCol
                    Arg := StepsQ.FieldByName('Step').Value;
                    if                StepGridSentence.ColsInContent then begin
                      Col := StepGridSentence.GetOldSCol + 1;
                      SCol := StepGridSentence.GetSCol + 1;
                      OK := True;
                    end;//if
                  end else begin
                    // Arg, Col
                    Arg := StepsQ.FieldByName('Step').Value;
                    if StepGridSentence.ColInContent then begin
                      Col := StepGridSentence.GetSCol + 1;
                      OK := True;
                    end;//if
                  end end;//if
                end;//if
              end else begin
                MessageDlg('No steps!', mtWarning, [mbOK], 0);
              end;//if
            end;//if
            if OK then begin
              Step := ExecuteFunction(
                Sent, Arg, SArg, Rule, Link, Col, SCol,
                Formula
              );
              if Step <> 0 then begin
                StepsQ.Refresh;
                StepsQ.Locate('Sentence;Step', VarArrayOf([Sent, Step]), []);
                USentencesT.Refresh;
              end;//if
            end;//if
          end else begin
            MessageDlg('No rule!', mtWarning, [mbOK], 0);
          end;//if
        end else begin
          MessageDlg('A proof of a theorem cannot be changed!', mtWarning, [mbOK], 0);
        end;
      end else begin
        MessageDlg('No sentence to proof!', mtWarning, [mbOK], 0);
      end;//if
    end else begin
      MessageDlg('The page "Proof" is not open!', mtWarning, [mbOK], 0);
    end;//if
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
end;

procedure THauptF.RulesGExit(Sender: TObject);
begin
  MyExitGrid(Sender);
end;

procedure THauptF.RulesGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if                Chr(Key) = 'C' then begin
    if [ssCtrl, ssShift] = Shift then begin
      RulesGDblClick(Sender);
    end;//if
  end else begin if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      DBMemo3.SetFocus;
    end end;//if
  end end;//if
end;

procedure THauptF.RulesTDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.RulesTPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure AutoIncrement(DataSet : TDataSet; StoredProc : TIBOStoredProc);
begin
  StoredProc.Prepare;
  try
    StoredProc.ExecProc;
    DataSet.Fields[0].Value := StoredProc.Params[0].Value;
  finally
    StoredProc.Unprepare;
  end;//try
end;

procedure RefreshRecord(DataSet : TIBODataSet);
begin
  DataSet.InvalidateRowNum(DataSet.RecNo);
end;

function THauptF.OperationExists(Op : String) : Boolean;
begin
  Result := False;
  OperationQ.ParamByName('Operation').Value := Op;
  OperationQ.Open;
  try
    if not OperationQ.IsEmpty then begin
      Result := True;
    end;//if
  finally
    OperationQ.Close;
  end;
end;

procedure THauptF.OperationsEChange(Sender: TObject);
begin
  if OperationsE.Text <> '' then begin
    OperationsDS.DataSet.Filter :=
      'Operation = ''' + OperationsE.Text + '*'''
    ;
    OperationsDS.DataSet.Filtered := True;
  end else begin
    OperationsDS.DataSet.Filtered := False;
  end;//if
  Extender.SynchronizeFilter(OperationsDS.DataSet);
end;

procedure THauptF.OperationsEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      OperationsG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      OperationsB.SetFocus;
    end end;//if
  end else begin if Key = VK_RETURN then begin
    OperationsG.SetFocus;
  end end;//if
end;

procedure THauptF.SetOperationsFilter(Ch : Char);
begin
  if Ch in ['A'..'Z'] then begin
    OperationsE.Text := UpperCase(Ch);
    OperationsEChange(Self);
  end;//if
end;

procedure THauptF.OperationsGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Chr(Key) = 'S' then begin
    if [ssCtrl, ssShift] = Shift then begin
      if OperationsDS.DataSet <> Nil then begin
        if not OperationsDS.DataSet.FieldByName('Sentence').IsNull then begin
          SentencesT.Locate('Sentence', OperationsDS.DataSet.FieldByName('Sentence').Value, []);
        end;//if
      end;//if
    end else begin
      SetOperationsFilter(Chr(Key));
    end;//if
  end else begin if Chr(Key) = 'C' then begin
    if [ssCtrl, ssShift] = Shift then begin
      OperationsG.OnDblClick(Self);
    end else begin
      SetOperationsFilter(Chr(Key));
    end;//if
  end else begin if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      EditGrid.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      OperationsE.SetFocus;
    end end;//if
  end else begin if Key = VK_ESCAPE then begin
    OperationsE.Text := '';
    OperationsEChange(Self);
  end else begin
    SetOperationsFilter(Chr(Key));
  end end end end;//if
end;

procedure THauptF.OSentencesQAfterRefresh(DataSet: TDataSet);
begin
  OSentencesQAfterScroll(Nil);
end;

procedure THauptF.OSentencesQAfterScroll(DataSet: TDataSet);
begin
  if not OSentencesQ.ControlsDisabled then begin
    DefiGridSentence.Delete(0, 0);
    if not OSentencesQ.IsEmpty then begin
      DefiGridSentence.PutStringSentence(
        GetSentenceFromDatabase(OSentencesQ.FieldByName('Sentence').Value)
      );
    end;//if
  end;//if
end;

procedure THauptF.WriteDetail(
  Sentence, Detail : Integer;
  Operation : String;
  Link : Integer
);
begin
  DetailsIQ.ParamByName('Sentence').Value := Sentence;
  DetailsIQ.ParamByName('Detail').Value := Detail;
  if Operation = Spoi then begin
    DetailsIQ.ParamByName('Operation').Value := SLLL;
  end else begin
    DetailsIQ.ParamByName('Operation').Value := Operation;
  end;//if
  DetailsIQ.ParamByName('Link').Value := Link;
  DetailsIQ.ExecSQL;
end;

procedure THauptF.WriteStepDetail(
  Sentence, Step, Detail : Integer;
  Operation : String;
  Link : Integer
);
begin
  StepDetailsIQ.ParamByName('Sentence').Value := Sentence;
  StepDetailsIQ.ParamByName('Step').Value := Step;
  StepDetailsIQ.ParamByName('Detail').Value := Detail;
  if Operation = Spoi then begin
    StepDetailsIQ.ParamByName('Operation').Value := SLLL;
  end else begin
    StepDetailsIQ.ParamByName('Operation').Value := Operation;
  end;//if
  StepDetailsIQ.ParamByName('Link').Value := Link;
  StepDetailsIQ.ExecSQL;
end;

procedure THauptF.WriteOperation(Operation, Title : String; IPut, OPut : Char; Number : Integer);
begin
  if Operation = '^' then begin
    OperationsIQ.ParamByName('Operation').Value := SLLL;
  end else begin
    OperationsIQ.ParamByName('Operation').Value := Operation;
  end;//if
  OperationsIQ.ParamByName('Title').Value := Title;
  OperationsIQ.ParamByName('IPut').Value := IPut;
  OperationsIQ.ParamByName('OPut').Value := OPut;
  OperationsIQ.ParamByName('Number').Value := Number;
  OperationsIQ.ExecSQL;
end;

function THauptF.WriteSentence(
  Sentence : Integer;
  Title, Description : String;
  Kind : Char;
  Operation : String
) : Integer;
begin
  if Sentence = 0 then begin
    SentenceSP.ExecProc;
    Result := SentenceSP.ParamByName('Sentence').Value;
  end else begin
    Result := Sentence;
  end;//if
  SentencesIQ.ParamByName('Sentence').Value := Result;
  SentencesIQ.ParamByName('Title').Value := Title;
  SentencesIQ.ParamByName('Description').Value := Description;
  SentencesIQ.ParamByName('Kind').Value := Kind;
  if Operation <> '' then begin
    SentencesIQ.ParamByName('Operation').Value := Operation;
  end else begin
    SentencesIQ.ParamByName('Operation').Clear;
  end;//if
  SentencesIQ.ExecSQL;
end;

procedure THauptF.ProoGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if                Key = VK_UP then begin
    if                [ssCtrl] = Shift then begin
      if Panel5.Height >= 57 then begin
        ProoGrid.Height := ProoGrid.Height + 22;
      end;//if
    end else begin if [ssShift, ssCtrl] = Shift then begin
      if StepsG.Height >= 57 then begin
        Panel4.Height := Panel4.Height + 22;
        ProoGrid.Height := ProoGrid.Height + 22;
      end;//if
    end end;//if
  end else begin if Key = VK_DOWN then begin
    if                [ssCtrl] = Shift then begin
      if ProoGrid.Height >= 201 then begin
        ProoGrid.Height := ProoGrid.Height - 22;
      end;//if
    end else begin if [ssShift, ssCtrl] = Shift then begin
      if ProoGrid.Height >= 201 then begin
        ProoGrid.Height := ProoGrid.Height - 22;
        Panel4.Height := Panel4.Height - 22;
      end;//if
    end end;//if
  end else begin if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      USentencesG.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      SentencesRulesPC.SetFocus;
    end else begin
      StepsG.SetFocus;
    end end;//if
  end end end;//if
end;

procedure THauptF.QuantifiersGExit(Sender: TObject);
begin
  MyExitGrid(Sender);
end;

procedure THauptF.QuantifiersGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then begin
    if [ssShift] = Shift then begin
      SentencesM.SetFocus;
    end else begin if [ssCtrl, ssShift] = Shift then begin
      EditProofPC.SetFocus;
    end else begin
      SentencesRulesPC.SetFocus;
    end end;//if
  end;//if
end;

procedure THauptF.QuantifiersTAfterDelete(DataSet: TDataSet);
begin
  if not QuantifiersT.ControlsDisabled then begin
    if not SentencesT.IsEmpty then begin
      PutSentence(SentencesT.FieldByName('Sentence').Value);
    end;//if
  end;//if
end;

procedure THauptF.QuantifiersTAfterPost(DataSet: TDataSet);
begin
  if not QuantifiersT.ControlsDisabled then begin
    if not SentencesT.IsEmpty then begin
      PutSentence(SentencesT.FieldByName('Sentence').Value);
    end;//if
  end;//if
end;

procedure THauptF.QuantifiersTBeforePost(DataSet: TDataSet);
begin
  if QuantifiersT.State = dsInsert then begin
    if QuantifiersT.FieldByName('QNr').Value = 0 then begin
      if not SentencesT.IsEmpty then begin
        QuantifiersNumberQ.ParamByName('Sentence').Value :=
          SentencesT.FieldByName('Sentence').Value
        ;
        QuantifiersNumberQ.Open;
        try
          if not QuantifiersNumberQ.FieldByName('Number').IsNull then begin
            QuantifiersT.FieldByName('QNr').Value :=
              QuantifiersNumberQ.FieldByName('Number').Value + 1
            ;
          end else begin
            QuantifiersT.FieldByName('QNr').Value := 1;
          end;//if
        finally
          QuantifiersNumberQ.Close;
        end;
      end;//if
    end;//if
  end;//if
end;

procedure THauptF.QuantifiersTDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.QuantifiersTNewRecord(DataSet: TDataSet);
begin
  QuantifiersT.FieldByName('QNr').Value := 0;
end;

procedure THauptF.QuantifiersTPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(SelectError(E.Message), mtError, [mbOK], 0);
  Action := daAbort;
end;

procedure THauptF.SetSentenceFilter;
  var
    Filter : String;
    Sentence : Integer;
    nr : Integer;
begin
  if not SentencesT.IsEmpty then begin
    Sentence := SentencesT.FieldByName('Sentence').Value;
  end else begin
    Sentence := -1;
  end;//if
  Filter := '';
  nr := 0;
  if AxiomCB.Checked then begin
    Filter := Filter + ' or (Kind = ''A'')';
    Inc(nr);
  end;//if
  if TheoremCB.Checked then begin
    Filter := Filter + ' or (Kind = ''T'')';
    Inc(nr);
  end;//if
  if RelationCB.Checked then begin
    Filter := Filter + ' or (Kind = ''R'')';
    Inc(nr);
  end;//if
  if FunctionCB.Checked then begin
    Filter := Filter + ' or (Kind = ''F'')';
    Inc(nr);
  end;//if
  if UnprovedCB.Checked then begin
    Filter := Filter + ' or (Kind = ''U'')';
    Inc(nr);
  end;//if
  if Filter <> '' then begin
    if nr < 5 then begin
      if AuxCB.Checked then begin  // fara conditie
        Filter := Copy(Filter, 5, Length(Filter) - 4);
        SentencesT.Filter := Filter;
        SentencesT.Filtered := True;
      end else begin               // cu conditie
        Filter := '(Aux = ''0'') and (' + Copy(Filter, 5, Length(Filter) - 4) + ')';
        SentencesT.Filter := Filter;
        SentencesT.Filtered := True;
      end;//if
    end else begin
      if AuxCB.Checked then begin  // fara conditie
        Filter := '';
        SentencesT.Filter := Filter;
        SentencesT.Filtered := False;
      end else begin               // cu conditie
        Filter := '(Aux = ''0'')';
        SentencesT.Filter := Filter;
        SentencesT.Filtered := True;
      end;//if
    end;//if
  end else begin
    Filter := '(0 = 1)';
    SentencesT.Filter := Filter;
    SentencesT.Filtered := True;
  end;//if;
  SentencesT.Locate('Sentence', Sentence, []);
  Extender.SynchronizeFilter(SentencesT);
end;

procedure THauptF.ShowSentenceAsTree;  // nu e folosita
  var
    FileName : String;
    F : TextFile;
    StringList : TStringList;
    Sent, i : Integer;
begin
  if DataOK(Self) then begin
    if not SentencesT.IsEmpty then begin
      TreeSentenceF := TTreeSentenceF.Create(Nil);
      try
        Sent := SentencesT.FieldByName('Sentence').Value;
        StringSentence.SetSentenceFromDatabase(Sent);
        StringSentence.MakeTreeSentence(Sent, TreeSentenceF.Tree);
        TreeSentenceF.TitleE.Text := SentencesT.FieldByName('Title').AsString;
        TreeSentenceF.Tree.FullExpand;
        TreeSentenceF.ShowModal;
      finally
        TreeSentenceF.Free;
      end;
    end else begin
      MessageDlg(
        'No sentence!',
        mtWarning, [mbOK], 0
      );
    end;//if
  end;//if
end;

procedure THauptF.Gotosentences1Click(Sender: TObject);
begin
  SentencesRulesPC.ActivePage := SentencesTS;
  SentencesG.SetFocus;
end;

procedure THauptF.Gotofunctions1Click(Sender: TObject);
begin
  SentencesRulesPC.ActivePage := InferencesTS;
  RulesG.SetFocus;
end;

procedure THauptF.Gotoformulas1Click(Sender: TObject);
begin
  SentencesRulesPC.ActivePage := FormulasTS;
  FormulasG.SetFocus;
end;

procedure THauptF.GetQuantifierNames(Sent : Integer; Quanti : TStringList);
begin
  QuantifiersQ.ParamByName('Sentence').Value := Sent;
  QuantifiersQ.Open;
  try
    while not QuantifiersQ.Eof do begin
      Quanti.Values[QuantifiersQ.FieldByName('QNr').AsString] :=
        QuantifiersQ.FieldByName('QName').AsString
      ;
      QuantifiersQ.Next;
    end;//while
  finally
    QuantifiersQ.Close;
  end;
end;

function THauptF.GetVariables(Sent : Integer) : String;
begin
  Result := '';
  QuantifiersQ.ParamByName('Sentence').Value := Sent;
  QuantifiersQ.Open;
  try
    while not QuantifiersQ.Eof do begin
      Result := Result + '"' + QuantifiersQ.FieldByName('QName').AsString + '";';
      QuantifiersQ.Next;
    end;//while
  finally
    QuantifiersQ.Close;
  end;
  if Result <> '' then begin
    Result := Copy(Result, 1, Length(Result) - 1);
  end;//if
end;

procedure THauptF.WriteVariables(Sent : Integer; Rind : String);
  var
    QNr, i : Integer;
    QName : String;
begin
  QNr := 1;
  i := 1;
  QName := 'Nix';
  while QName <> '' do begin
    QName := Separ(Rind, ';', i);
    QName := Copy(QName, 2, Length(QName) - 2);
    if QName <> '' then begin
      QuantIQ.ParamByName('Sentence').Value := Sent;
      QuantIQ.ParamByName('QNr').Value := QNr;
      QuantIQ.ParamByName('QName').Value := QName;
      QuantIQ.ExecSQL;
      Inc(QNr);
    end;//if
  end;//while
end;

function CtrlDown : Boolean;
  var
    State : TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_CONTROL] and 128) <> 0);
end;

procedure THauptF.SetSentenceToStep(Sentence : String; Sent, Step : Integer);
begin
  StepStringSentence.SetSentence(Sentence);
  StepStringSentence.SetSentenceToStep(Sent, Step);
end;

procedure THauptF.Sevesentenceat1Click(Sender: TObject);
begin
  if SaveB.Enabled then begin
    EditGridSentence.SaveSentenceAt;
  end;//if
end;

function THauptF.FindSentence(Sentence : String) : Integer;
  var
    Sent : Integer;
begin
  Result := 0;
  SentencesQ.Open;
  try
    while (Result = 0) and (not SentencesQ.Eof) do begin
      Sent := SentencesQ.FieldByName('Sentence').Value;
      if Sentence = GetSentenceFromDatabase(Sent) then begin
        Result := Sent;
      end else begin
        SentencesQ.Next;
      end;//if
    end;//while
  finally
    SentencesQ.Close;
  end;
end;

end.
