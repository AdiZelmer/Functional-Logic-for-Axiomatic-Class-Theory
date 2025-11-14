program Logic;

{$R *.dres}

uses
  Forms,
  Haupt in 'Haupt.pas' {HauptF},
  Connection in '..\..\Units\Connection.pas',
  CommonDefs in 'CommonDefs.pas',
  GridSentenceU in 'GridSentenceU.pas',
  StringSentenceU in 'StringSentenceU.pas',
  Save in 'Save.pas' {SaveF},
  ExistUniqueU in 'ExistUniqueU.pas',
  QuantifierType in 'QuantifierType.pas' {QuantifierTypeF},
  Formula in 'Formula.pas' {FormulaF},
  VarSentence in 'VarSentence.pas' {VarSentenceF},
  TreeSentence in 'TreeSentence.pas' {TreeSentenceF},
  Functions in '..\..\Units\Functions.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(THauptF, HauptF);
  Application.Run;
end.
