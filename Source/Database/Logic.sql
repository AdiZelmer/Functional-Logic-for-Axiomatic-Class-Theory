create database 'localhost:D:\Adi\Logic\Database\Logic.fdb'
  user 'AZ'
  password 'servus'
  default character set ISO8859_1
;
create domain Logic Char(1)
  default '0' not Null
  check(Value in ('0', '1'))
;
create domain Cigol Char(1)
  default '1' not Null
  check(Value in ('0', '1'))
;
create table Operations(
  Operation Varchar(16) not Null,
  Title Varchar(32),
  IPut Char(1) not Null,
  OPut Char(1) not Null,
  Number Integer not Null,
  primary key(Operation),
  check (IPut in ('s', 't')),
  check (OPut in ('s', 't')),
  check (Number >= 0)
)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('A', 'Universal quantifier', 's', 's', 2)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('E', 'Existential quantifier', 's', 's', 2)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('V', 'Disjunction', 's', 's', 2)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('X', 'Conjunction', 's', 's', 2)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('D', 'Double implication', 's', 's', 2)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('C', 'Implication', 's', 's', 2)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('N', 'Negation', 's', 's', 1)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('T', 'True', 's', 's', 0)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('@', 'Appartenance', 't', 's', 2)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('=', 'Equality', 't', 's', 2)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('S', 'Set', 't', 's', 1)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('K', 'Class generator', 's', 't', 1)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values('L', 'Link', 't', 't', 0)
;
insert into
  Operations(Operation, Title, IPut, OPut, Number)
  Values(' ', 'Space', 't', 't', 0)
;
commit
;
create table Sentences(
  Sentence Integer not Null,
  Title Varchar(64),
  Description BLOB SUB_TYPE TEXT SEGMENT SIZE 80,
  Kind Char(1) default 'U' not Null,
  Operation Varchar(16),
  Aux Logic not null,
  Ctrl Integer default 0 not Null,
  primary key(Sentence),
  foreign key(Operation) references Operations(Operation),
  check (Kind in ('A', 'T', 'R', 'F', 'U'))
)
;
create index Sentences_Title_Sentence on Sentences(Title, Sentence)
;
create descending index Sentences_Desc_Sentence on Sentences(Sentence)
;
create table Details(
  Sentence Integer not Null,
  Detail Integer not Null,
  Operation Varchar(16) not Null,
  Link Integer,
  primary key(Sentence, Detail),
  foreign key(Sentence) references Sentences(Sentence),
  foreign key(Operation) references Operations(Operation)
)
;
create table Quantifiers(
  Sentence Integer not Null,
  QNr Integer not Null,
  QName Varchar(4) not Null,
  primary key(Sentence, QNr),
  foreign key(Sentence) references Sentences(Sentence)
)
;
create unique index Quantifiers_Sentence_QName on Quantifiers(Sentence, QName)
;
create table Rules(
  Rule Integer not Null,
  Title Varchar(64),
  Description BLOB SUB_TYPE TEXT SEGMENT SIZE 80,
  Formula Varchar(64),
  Arg1 Varchar(32),
  Arg2 Varchar(32),
  Func Varchar(32),
  Number Integer default 1 not Null,
  check (Number >= 1),
  primary key(Rule)
)
;
create index Rules_Title_Rule on Rules(Title, Rule)
;
create unique index Rules_Formula on Rules(Formula)
;
create unique index Rules_Func on Rules(Func)
;
insert into
  Rules(Rule, Title, Func)
  Values(0, 'Load the sentence to the proof.', 'Load')
;
commit
;
create table Steps(
  Sentence Integer not Null,
  Step Integer not Null,
  Arg Integer,
  SArg Integer,
  Rule Integer,
  Link Integer,
  Col Integer,
  SCol Integer,
  primary key(Sentence, Step),
  foreign key(Sentence) references Sentences(Sentence),
  foreign key(Rule) references Rules(Rule),
  foreign key(Link) references Sentences(Sentence)
)
;
alter table Steps
  add foreign key(Sentence, Arg) references Steps(Sentence, Step)
;
alter table Steps
  add foreign key(Sentence, SArg) references Steps(Sentence, Step)
;
create table StepDetails(
  Sentence Integer not Null,
  Step Integer not Null,
  Detail Integer not Null,
  Operation Varchar(16) not Null,
  Link Integer,
  primary key(Sentence, Step, Detail),
  foreign key(Sentence, Step) references Steps(Sentence, Step),
  foreign key(Operation) references Operations(Operation)
)
;
create table Categories(
  Category Integer not Null,
  Title Varchar(32) not Null,
  primary key(Category)
)
;
create index Categories_Title_Category on Categories(Title, Category)
;
create table SenCat(
  Sentence Integer not Null,
  Category Integer not Null,
  primary key(Sentence, Category),
  foreign key(Sentence) references Sentences(Sentence),
  foreign key(Category) references Categories(Category)
)
;
create generator CategoryGen
;
create exception NoInsert 'No insert!'
;
create exception NoUpdate 'No update!'
;
create exception NoDelete 'No delete!'
;
create exception CharsAreNotPermited '"(", ")", " " and "^" are not permited!'
;
create exception CharsAreNotPermitedBeginning '"-" and "+" are not permited at the beginning!'
;
create exception AProofUsesThisStatement 'A proof uses this statement!'
;
create exception AProofUsesThisRule 'A proof uses this rule!'
;
create exception AProofOfATheoremCannotBeDel 'A proof of a theorem cannot be deleted!'
;
create exception AProofOfATheoremCannotBeMod 'A proof of a theorem cannot be modified!'
;
create exception OnlyTheLastStepCanBeDeleted 'Only the last step can be deleted!'
;
create exception SentenceIsAlreadyLoaded 'Sentence is already loaded!'
;
create exception KindOfRelFunc 'The kind of a relation or a function cannot be changed!'
;
create exception KindMustBeU 'The new kind must be "U"!'
;
create exception SentenceHasAProof 'The sentence has a proof!'
;
create exception SentenceNotTheorem 'A sentence cannot be made directly a theorem!'
;
create exception SentenceNotFunction 'A sentence cannot define directly a function!'
;
create exception SentenceNotRelation 'A sentence cannot define directly a relation!'
;
create view
  Relations(Operation, Title, OPut, Number, Sentence, STitle)
as
select O.Operation, O.Title, O.OPut, O.Number, S.Sentence, S.Title
  from
    Operations O
    join Sentences S on O.Operation = S.Operation
  where
    (O.OPut = 's')
    and (Aux = '0')
  order by Operation
;
create view
  Functions(Operation, Title, OPut, Number, Sentence, STitle)
as
select O.Operation, O.Title, O.OPut, O.Number, S.Sentence, S.Title
  from
    Operations O
    join Sentences S on O.Operation = S.Operation
  where
    (O.OPut = 't')
    and (Aux = '0')
  order by Operation
;
create view
  VDetails(Sentence, Detail, Operation, Link, Title, IPut, OPut, Number)
as
select
    D.Sentence, D.Detail, D.Operation, D.Link,
    O.Title, O.IPut, O.OPut, O.Number
  from
    Details D
    join Operations O on D.Operation = O.Operation
;
create view
  VStepDetails(Sentence, Step, Detail, Operation, Link, Title, IPut, OPut, Number)
as
select
    D.Sentence, D.Step, D.Detail, D.Operation, D.Link,
    O.Title, O.IPut, O.OPut, O.Number
  from
    StepDetails D
    join Operations O on D.Operation = O.Operation
;
create view
  VCatSen(Sentence, Category, Title, Kind, Description, Aux)
as
select
    SC.Sentence, SC.Category, S.Title, S.Kind, S.Description, S.Aux
  from
    SenCat SC
    join Sentences S on SC.Sentence = S.Sentence
  order by SC.Sentence
;
create view
  VSenCat(Sentence, Category, Title)
as
select SC.Sentence, SC.Category, C.Title
  from
    SenCat SC
    join Categories C on SC.Category = C.Category
  order by C.Title, SC.Category
;
set term ^;

create procedure
  SentenceProc
  returns(Sentence Integer)
as
begin
  select max(Sentence)
    from Sentences
    into :Sentence
  ;
  if (Sentence is Null) then begin
    Sentence = 0;
  end
  Sentence = Sentence + 1;
end
^
create procedure
  RuleProc
  returns(Rule Integer)
as
begin
  select max(Rule)
    from Rules
    into :Rule
  ;
  if (Rule is Null) then begin
    Rule = 0;
  end
  Rule = Rule + 1;
end
^
create procedure
  StepProc(Sentence Integer)
  returns(Step Integer)
as
begin
  select max(Step)
    from Steps
    where Sentence = :Sentence
    into :Step
  ;
  if (Step is Null) then begin
    Step = 0;
  end
  Step = Step + 1;
end
^
create procedure CategoryProc
returns(Category Integer)
as
begin
  Category = GEN_ID(CategoryGen, 1);
end
^
create trigger InsertOperations for Operations
  before insert
as
begin
  if (
       (position('(' in NEW.Operation) > 0)
       or (position(')' in NEW.Operation) > 0)
       or (position(' ' in NEW.Operation) > 0)
       or (position(ASCII_CHAR(94) in NEW.Operation) > 0)
     )
  then begin
    exception CharsAreNotPermited;
  end
  if (
       (position('-' in NEW.Operation) = 1)
       or (position('+' in NEW.Operation) = 1)
     )
  then begin
    exception CharsAreNotPermitedBeginning;
  end
end
^
create trigger UpdateOperations for Operations
  before update
as
begin
  if (
       (position('(' in NEW.Operation) > 0)
       or (position(')' in NEW.Operation) > 0)
       or (position(' ' in NEW.Operation) > 0)
       or (position(ASCII_CHAR(94) in NEW.Operation) > 0)
     )
  then begin
    exception CharsAreNotPermited;
  end
  if (
       (position('-' in NEW.Operation) = 1)
       or (position('+' in NEW.Operation) = 1)
     )
  then begin
    exception CharsAreNotPermitedBeginning;
  end
end
^
create trigger InsertSentences for Sentences
  before insert
as
begin
  if (NEW.Sentence = 0) then begin
    select max(Sentence)
      from Sentences
      into NEW.Sentence
    ;
    if (NEW.Sentence is Null) then begin
      NEW.Sentence = 0;
    end
    NEW.Sentence = NEW.Sentence + 1;
  end
end
^
create trigger UpdateSentences for Sentences
  before update
as
  declare variable Number Integer;
begin
  if (OLD.Kind <> NEW.Kind) then begin
    if (OLD.Kind in ('R', 'F')) then begin
      exception KindOfRelFunc;
    end else begin if (OLD.Kind in ('A', 'T')) then begin
      if (NEW.Kind = 'U') then begin
        select count(*)
          from Steps
          where Link = OLD.Sentence
          into :Number
        ;
        if (Number > 0) then begin
          exception AProofUsesThisStatement;
        end
      end else begin
        exception KindMustBeU;
      end
    end else begin if (OLD.Kind = 'U') then begin
      if (NEW.Kind = 'A') then begin
        select count(*)
          from Steps
          where Sentence = OLD.Sentence
          into :Number
        ;
        if (Number > 0) then begin
          exception SentenceHasAProof;
        end
      end else begin if (NEW.Kind = 'T') then begin
        if (OLD.Ctrl = NEW.Ctrl) then begin
          exception SentenceNotTheorem;
        end
      end else begin if (NEW.Kind = 'R') then begin
        exception SentenceNotRelation;
      end else begin if (NEW.Kind = 'F') then begin
        if (OLD.Ctrl = NEW.Ctrl) then begin
          exception SentenceNotFunction;
        end
      end end end
    end end end end
  end
end
^
create procedure EmptySteps(Sentence Integer)
as
  declare variable Step Integer;
begin
  select max(Step)
    from Steps
    where Sentence = :Sentence
    into :Step
  ;
  while (Step is not Null) do begin
    delete from Steps
      where
        (Sentence = :Sentence)
        and (Step = :Step)
    ;
    select max(Step)
      from Steps
      where Sentence = :Sentence
      into :Step
    ;
  end
end
^
create trigger DeleteSentences for Sentences
  before delete
as
begin
  delete from Details
    where Sentence = OLD.Sentence
  ;
  delete from Quantifiers
    where Sentence = OLD.Sentence
  ;
  delete from SenCat
    where Sentence = OLD.Sentence
  ;
  if (OLD.Kind = 'F') then begin
    execute procedure
      EmptySteps(OLD.Sentence)
    ;
  end
end
^
create trigger AfterDeleteSentences for Sentences
  after delete
as
begin
  if (OLD.Operation is not Null) then begin
    delete from Operations
      where Operation = OLD.Operation
    ;
  end
end
^
create trigger InsertQuantifiers for Quantifiers
  before insert
as
begin
  if (
       (position('(' in NEW.QName) > 0)
       or (position(')' in NEW.QName) > 0)
       or (position(' ' in NEW.QName) > 0)
       or (position(ASCII_CHAR(94) in NEW.QName) > 0)
     )
  then begin
    exception CharsAreNotPermited;
  end
end
^
create trigger UpdateQuantifiers for Quantifiers
  before update
as
begin
  if (
       (position('(' in NEW.QName) > 0)
       or (position(')' in NEW.QName) > 0)
       or (position(' ' in NEW.QName) > 0)
       or (position(ASCII_CHAR(94) in NEW.QName) > 0)
     )
  then begin
    exception CharsAreNotPermited;
  end
end
^
create trigger InsertRules for Rules
  before insert
as
begin
  if (NEW.Rule = 0) then begin
    select max(Rule)
      from Rules
      into NEW.Rule
    ;
    if (NEW.Rule is Null) then begin
      NEW.Rule = 0;
    end
    NEW.Rule = NEW.Rule + 1;
  end
end
^
create trigger UpdateRules for Rules
  before update
as
  declare variable Number Integer;
begin
  if (
       (OLD.Formula <> NEW.Formula)
       or (OLD.Func <> NEW.Func)
       or (OLD.Number <> NEW.Number)
    )
  then begin
    select count(*)
      from Steps
      where Rule = OLD.Rule
      into :Number
    ;
    if (Number > 0) then begin
      exception AProofUsesThisRule;
    end
  end
end
^
create trigger DeleteRules for Rules
  before delete
as
  declare variable Number Integer;
begin
  select count(*)
    from Steps
    where Rule = OLD.Rule
    into :Number
  ;
  if (Number > 0) then begin
    exception AProofUsesThisRule;
  end
end
^
create trigger InsertSteps for Steps
  before insert
as
  declare variable Kind Char(1);
  declare variable Number Integer;
begin
  select Kind
    from Sentences
    where Sentence = NEW.Sentence
    into :Kind
  ;
  if (Kind <> 'T') then begin
    if (NEW.Step = 0) then begin
      execute procedure
        StepProc(NEW.Sentence)
        returning_values(NEW.Step)
      ;
    end
    if (NEW.Link is not Null) then begin
      select count(*)
        from Steps
        where
          (Sentence = NEW.Sentence)
          and (Link = NEW.Link)
        into :Number
      ;
      if (Number > 0) then begin
        exception SentenceIsAlreadyLoaded;
      end
    end
  end else begin
    exception AProofOfATheoremCannotBeMod;
  end
end
^
create trigger UpdateSteps for Steps
  before update
as
begin
  exception NoUpdate;
end
^
create trigger DeleteSteps for Steps
  before delete
as
  declare variable Kind Char(1);
  declare variable Step Integer;
begin
  select Kind
    from Sentences
    where Sentence = OLD.Sentence
    into :Kind
  ;
  if (Kind <> 'T') then begin
    select max(Step)
      from Steps
      where Sentence = OLD.Sentence
      into :Step
    ;
    if (OLD.Step = Step) then begin
      delete from StepDetails
        where
          (Sentence = OLD.Sentence)
          and (Step = OLD.Step)
        ;
    end else begin
      exception OnlyTheLastStepCanBeDeleted;
    end
  end else begin
    exception AProofOfATheoremCannotBeMod;
  end
end
^
create trigger InsertCategories for Categories
  before insert
as
begin
  if (NEW.Category = 0) then begin
    NEW.Category = GEN_ID(CategoryGen, 1);
  end
end
^
create trigger DeleteCategories for Categories
  before delete
as
begin
  delete from SenCat
    where Category = OLD.Category
  ;
end
^
create trigger InsertVCatSen for VCatSen
  before insert
as
begin
  insert into
    SenCat(Sentence, Category)
    Values(NEW.Sentence, NEW.Category)
  ;
end
^
create trigger UpdateVCatSen for VCatSen
  before update
as
begin
  exception NoUpdate;
end
^
create trigger DeleteVCatSen for VCatSen
  before delete
as
begin
  delete from SenCat
    where
      (Sentence = OLD.Sentence)
      and (Category = OLD.Category)
  ;
end
^
create trigger InsertVSenCat for VSenCat
  before insert
as
begin
  insert into
    SenCat(Sentence, Category)
    Values(NEW.Sentence, NEW.Category)
  ;
end
^
create trigger UpdateVSenCat for VSenCat
  before update
as
begin
  exception NoUpdate;
end
^
create trigger DeleteVSenCat for VSenCat
  before delete
as
begin
  delete from SenCat
    where
      (Sentence = OLD.Sentence)
      and (Category = OLD.Category)
  ;
end
^
create procedure DeleteProof(Sentence Integer)
as
  declare variable Step Integer;
begin
  for
    select Step
      from Steps
      where Sentence = :Sentence
      order by Step desc
      into :Step
  do begin
    delete from Steps
      where
        (Sentence = :Sentence)
        and (Step = :Step)
    ;
  end
end
^
create procedure
  EqualSentences(Sentence1 Integer, Sentence2 Integer)
  returns(Ind Char(1))
as
  declare variable Operation1 Varchar(16);  
  declare variable Link1 Integer;  
  declare variable Operation2 Varchar(16);  
  declare variable Link2 Integer;  
begin
  Ind = '0';
  for
    select D1.Operation, D1.Link, D2.Operation, D2.Link
      from
        Details D1
        left outer join Details D2 on
          (D2.Sentence = :Sentence2)
          and (D2.Detail = D1.Detail)
      where
        D1.Sentence = :Sentence1
      into :Operation1, :Link1, :Operation2, :Link2
  do begin
    if ((Operation1 is distinct from Operation2) or (Link1 is distinct from Link2)) then begin
      Ind = '1';
      Leave;
    end
  end
end
^
create procedure
  SentenceExists(CSentence Integer)
  returns(DSentence Integer)
as
  declare variable Sentence Integer;
  declare variable Ind Char(1);
begin
  DSentence = 0;
  for
    select Sentence
      from Sentences
      where Sentence <> :CSentence
      into :Sentence
  do begin
    execute procedure
      EqualSentences(CSentence, Sentence)
      returning_values(Ind)
    ;
    if (Ind = 0) then begin
      DSentence = Sentence;
      Leave;
    end
  end
end
^
create procedure
  FirstDifPos(Sentence Integer, Step Integer)
  returns(Pos Integer)
as
  declare variable SentenceNr Integer;
  declare variable StepNr Integer;
  declare variable Detail Integer;
  declare variable SOperation Varchar(16);
  declare variable SLink Integer;
  declare variable DOperation Varchar(16);
  declare variable DLink Integer;
begin
  Pos = -1;
  select count(Detail)
    from Details
    where Sentence = :Sentence
    into :SentenceNr
  ;
  select count(Detail)
    from StepDetails
    where
      (Sentence = :Sentence)
      and (Step = :Step)
    into StepNr
  ;
  if (SentenceNr = StepNr) then begin
    Pos = 0;
    for
      select
          S.Detail, S.Operation, S.Link, D.Operation, D.Link
        from
          StepDetails S
          left outer join Details D on
            (S.Sentence = D.Sentence)
            and (S.Detail = D.Detail)
        where
          (S.Sentence = :Sentence)
          and (S.Step = :Step)
        into
          :Detail, :SOperation, :SLink, :DOperation, :DLink
    do begin
      if (Pos = 0) then begin
        if ((SOperation <> DOperation) or (SLink <> DLink)) then begin
          Pos = Detail;
        end
      end
    end
  end
end
^
set term;^

insert into
  Rules(Rule, Title, Description, Func)
  Values(
    1,
    'Inserting a sentence into another sentence',
    'Select:' || ASCII_CHAR(13) ||
    '- two steps of the proof (the source step and the destination step), and' || ASCII_CHAR(13) ||
    '- a form from the destination step (the destination).' || ASCII_CHAR(13) ||
    'The inference operator generates a new step consisting of the destination step, where ' ||
    'the destination is replaced by the conjunction of the destination and the source step.',
    'InsertSentences'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    2,
    'Attachment',
    'Select:' || ASCII_CHAR(13) || 
    '- a step of the proof, and' || ASCII_CHAR(13) || 
    '- two forms from the selected step (the source and the destination).' || ASCII_CHAR(13) || 
    'This operator verifies whether:' || ASCII_CHAR(13) || 
    '- The source is the first argument of an implication.' || ASCII_CHAR(13) || 
    '- The parent of the source is duplicable on the destination.' || ASCII_CHAR(13) || 
    '- The source and the destination are equal.' || ASCII_CHAR(13) || 
    'If the parent of the destination is a conjunction and the other argument of this ' || 
    'conjunction is equal to the second argument of the parent of the source, the function ' || 
    'will replace the conjunction with the destination. Otherwise, the function will replace ' || 
    'the destination with a conjunction formed by the destination and the second argument ' || 
    'of the parent of the source.',
    'Attachment'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    3,
    'Extracting the condition of the quantifier',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a form from the selected step.' || ASCII_CHAR(13) ||
    'This operator verifies whether the selected form is a quantifier.' || ASCII_CHAR(13) ||
    'If the selected form is:' || ASCII_CHAR(13) ||
    '1. a universal quantifier having its condition a conjunction, then' || ASCII_CHAR(13) ||
    '   AXpqr --> ApCqr' || ASCII_CHAR(13) ||
    '2. a universal quantifier with no conjunction as the condition part, then' || ASCII_CHAR(13) ||
    '   Apq --> ATCpq' || ASCII_CHAR(13) ||
    '3. an existential quantifier having its condition part a conjunction, then' || ASCII_CHAR(13) ||
    '   EXpqr --> EpXqr' || ASCII_CHAR(13) ||
    '4. an existential quantifier with no conjunction as the condition part, then' || ASCII_CHAR(13) ||
    '   Epq --> ETXpq',
    'ExtractCondition'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    4,
    'Inserting the condition into the quantifier',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a quantifier from the selected step.' || ASCII_CHAR(13) ||
    'If the quantifier is:' || ASCII_CHAR(13) ||
    '1. universal, then its execution part must be an implication.' || ASCII_CHAR(13) ||
    '   ATCpq --> Apq' || ASCII_CHAR(13) ||
    '   ApCqr --> AXpqr' || ASCII_CHAR(13) ||
    '2. existential, then its execution part must be a conjunction.' || ASCII_CHAR(13) ||
    '   ETXpq --> Epq' || ASCII_CHAR(13) ||
    '   EpXqr --> EXpqr',
    'InsertCondition'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    5,
    'Class generator to form',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a form from this step.' || ASCII_CHAR(13) ||
    'This operator verifies whether:' || ASCII_CHAR(13) ||
    '- The selected form is a belonging (“@”).' || ASCII_CHAR(13) ||
    '- The second argument of this belonging is a class generator (“K”).' || ASCII_CHAR(13) ||
    'This inference operator transforms a belonging to a class generator into a form without ' ||
    'the class generator.',
    'ClassGeneratorToForm'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    6,
    'Particularization',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof' || ASCII_CHAR(13) ||
    '- a quantifier, a link, a function or a class generator (the source)' || ASCII_CHAR(13) ||
    '- an implicable universal quantifier (the destination).' || ASCII_CHAR(13) ||
    'This operator verifies whether:' || ASCII_CHAR(13) ||
    '- If the source is a quantifier, it is an ancestor of the destination. If not, all the' || ASCII_CHAR(13) ||
    '  external references of the source are ancestors of the destination.' || ASCII_CHAR(13) ||
    '- The source satisfies the condition of the destination.' || ASCII_CHAR(13) ||
    'If the source is:' || ASCII_CHAR(13) ||
    '1. A quantifier or a link to a quantifier, then the inference operator deletes the' || ASCII_CHAR(13) ||
    '   destination quantifier and replaces all its links with links to the source' || ASCII_CHAR(13) ||
    '   quantifier.' || ASCII_CHAR(13) ||
    '2. A function or a class generator, then the inference operator deletes the' || ASCII_CHAR(13) ||
    '   destination quantifier and replaces all its links with the function or the class' || ASCII_CHAR(13) ||
    '   generator.',
    'Particularization'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    8,
    'Quantifier distributivity',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a form from the step.' || ASCII_CHAR(13) ||
    'If the selected form is:' || ASCII_CHAR(13) ||
    '1. A universal quantifier having its second argument a conjunction, then' || ASCII_CHAR(13) ||
    '   AcXpq --> XAcpAcq' || ASCII_CHAR(13) ||
    '2. An existential quantifier having its second argument a disjunction, then' || ASCII_CHAR(13) ||
    '   EcVpq --> VEcpEcq' || ASCII_CHAR(13) ||
    '3. A conjunction whose arguments are universal quantifiers having the same' || ASCII_CHAR(13) ||
    '   condition, then XAcpAcq --> AcXpq' || ASCII_CHAR(13) ||
    '4. A disjunction whose arguments are existential quantifiers having the same' || ASCII_CHAR(13) ||
    '   condition, then VEcpEcq --> EcVpq',
    'QuantifierDistrib'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    9,
    'Restricted quantifier distributivity',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a form from this step.' || ASCII_CHAR(13) ||
    'This operator verifies whether:' || ASCII_CHAR(13) ||
    '- The selected form is a disjunction or an existential quantifier.' || ASCII_CHAR(13) ||
    '- The selected form is implicable.' || ASCII_CHAR(13) ||
    'If the selected form is:' || ASCII_CHAR(13) ||
    '1. A disjunction whose arguments are universal quantifiers having' || ASCII_CHAR(13) ||
    '   equal conditions, then VAcpAcq --> AcVpq' || ASCII_CHAR(13) ||
    '2. An existential quantifier having its execution part a conjunction, then' || ASCII_CHAR(13) ||
    '   EcXpq --> XEcpEcq',
    'RestrictedQuantifierDistrib'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    10,
    'Partial quantifier distributivity',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a form from this step (the destination).' || ASCII_CHAR(13) ||
    'The destination must be a quantifier, a conjunction, a disjunction, or an implication.' || ASCII_CHAR(13) || ASCII_CHAR(13) ||
    'If the destination is a quantifier, then:' || ASCII_CHAR(13) ||
    '- Its execution part must be a conjunction, disjunction, or implication.' || ASCII_CHAR(13) ||
    '  QcMpq --> MpQcq, where Q is "A" of "E" and M is ”X”, ”V”, or ”C”.' || ASCII_CHAR(13) || ASCII_CHAR(13) ||
    'If the destination is a conjunction, a disjunction, or an implication, then:' || ASCII_CHAR(13) ||
    '- Its second argument must be a quantifier.' || ASCII_CHAR(13) ||
    '  MpQcq --> QcMpq, where Q is ”A” or ”E” and M is ”X”, ”V”, or ”C”.',
    'PartialQuantifierDistrib'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    11,
    'Dual quantifier distributivity',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a form from this step (destination).' || ASCII_CHAR(13) ||
    'This operator works in the following cases:' || ASCII_CHAR(13) ||
    '1. The destination is a universal quantifier, having its execution part an implication.' || ASCII_CHAR(13) ||
    '   The second argument of this implication has no references to the quantifier.' || ASCII_CHAR(13) ||
    '   AcCpq --> CEcpq' || ASCII_CHAR(13) ||
    '2. The destination is an existential quantifier, having its execution part an' || ASCII_CHAR(13) ||
    '   implication.' || ASCII_CHAR(13) ||
    '   The second argument of this implication has no references to the quantifier.' || ASCII_CHAR(13) ||
    '   If the condition of the quantifier is not “T”, the selected form must be implicable.' || ASCII_CHAR(13) ||
    '   EcCpq --> CAcpq' || ASCII_CHAR(13) ||
    '3. The destination is an implication, having its first argument a universal' || ASCII_CHAR(13) ||
    '   quantifier with no condition.' || ASCII_CHAR(13) ||
    '   CATpq --> ETCpq' || ASCII_CHAR(13) ||
    '4. The destination is an implication, having its first argument an existential' || ASCII_CHAR(13) ||
    '   quantifier.' || ASCII_CHAR(13) ||
    '   CEcpq --> AcCpq',
    'DualQuantifierDistrib'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    12,
    'Deleting a quantifier',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a quantifier from this step.' || ASCII_CHAR(13) || ASCII_CHAR(13) ||
    'You can delete the quantifier if the execution argument of the quantifier ' ||
    'has no references to the quantifier ' ||
    'and one of the following conditions is satisfied:' || ASCII_CHAR(13) ||
    '1. The condition of the quantifier is True.' || ASCII_CHAR(13) ||
    '2. The condition of the quantifier is an equality having its first argument' || ASCII_CHAR(13) ||
    '   a reference to the quantifier, and the second argument having' || ASCII_CHAR(13) ||
    '   no references to the quantifier.' || ASCII_CHAR(13) ||
    '3. The quantifier is existential and implicable.' || ASCII_CHAR(13) ||
    '4. The quantifier has a condition, and you have loaded in the proof' || ASCII_CHAR(13) ||
    '   an existence axiom or theorem for this condition.',
    'DeleteQuantifier'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    13,
    'Deleting quantifiers from right to left',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a quantifier from this step.' || ASCII_CHAR(13) ||
    'This inference operator is a repeated call of the inference operator "Deleting a ' ||
    'quantifier". If the selected quantifier can be deleted, then this operator also tries to ' ||
    'delete the parent of the selected quantifier, which must be a quantifier. The process is ' ||
    'repeated until it reaches a form that cannot be deleted.',
    'DeleteQuantifiers'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    14,
    'Interchanging quantifiers',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a quantifier from the selected step (destination).' || ASCII_CHAR(13) ||
    'The operator checks that one of the following conditions is met:' || ASCII_CHAR(13) ||
    '- The execution part of the destination is a quantifier of the same type, and' || ASCII_CHAR(13) ||
    '  the condition part of the second quantifier has no references to the destination.' || ASCII_CHAR(13) ||
    '- The destination is existential and implicable, its execution part is a universal' || ASCII_CHAR(13) ||
    '  quantifier, and the condition part of the second quantifier has no references' || ASCII_CHAR(13) ||
    '  to the destination.' || ASCII_CHAR(13) ||
    'This inference operator interchanges the quantifiers along with their conditions.',
    'InterchangeQuantifiers' 
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(15, 'Reductio ad absurdum', '', 'ReductioAdAbsurdum')
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    16,
    'Negation',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- a negation from the selected step.' || ASCII_CHAR(13) ||
    'The operator uses the logical rules of negation in order to change the sentence.',
    'Negation'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(17, 'Verifying the proof', 'It verifies whether the proof is ready.', 'VerifiesTheProof')
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    18,
    'Existential generalization (using equality)',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof,' || ASCII_CHAR(13) ||
    '- a form from the selected step, and' || ASCII_CHAR(13) ||
    '- a term from the selected step.' || ASCII_CHAR(13) ||
    'These operators verifies whether:' || ASCII_CHAR(13) ||
    '- The selected form is an ancestor of the selected term.' || ASCII_CHAR(13) ||
    '- The selected term has no references (links) to the selected form.' || ASCII_CHAR(13) ||
    'The inference operator replaces the selected form with an existential/universal ' ||
    'quantifier, having as a condition the equality of a link to itself and the selected term, ' ||
    'and as an execution argument the selected form, where each occurrence of the selected ' ||
    'term is replaced through links to the new quantifier.',
    'ExistentialGeneralization'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    19,
    'Replacement',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- two logical operators from the step (the source and the destination).' || ASCII_CHAR(13) ||
    'This operator verifies whether:' || ASCII_CHAR(13) ||
    '- The parent of the source is a double implication, an equality, or an implication.' || ASCII_CHAR(13) ||
    '  In the case of the implication, the source must be its first argument.' || ASCII_CHAR(13) ||
    '- The source and the destination are equal.' || ASCII_CHAR(13) ||
    '- If the parent of the source is a double implication or implication, then the' || ASCII_CHAR(13) ||
    '  destination must be a form, and the parent of the source must be duplicable on' || ASCII_CHAR(13) ||
    '  the destination.' || ASCII_CHAR(13) ||
    '- If the parent of the source is an implication, then the destination must be' || ASCII_CHAR(13) ||
    '  implicable.' || ASCII_CHAR(13) ||
    '- If the parent of the source is an equality, then the destination must be a term,' || ASCII_CHAR(13) ||
    '  and the parent of the source must be duplicable on the first ancestor form of the' || ASCII_CHAR(13) ||
    '  destination.' || ASCII_CHAR(13) ||
    'The function replaces the destination with the other argument of the parent of the' || ASCII_CHAR(13) ||
    'destination.',
    'Replacement'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    20,
    'Extracting the hypothesis',
    'Extract the hypothesis of the theorem.',
    'ExtractHypothesis'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    21,
    'Form to class generator',
    'Select:' || ASCII_CHAR(13) || 
    '- a step of the proof, and' || ASCII_CHAR(13) || 
    '- a form from this step.' || ASCII_CHAR(13) || 
    'This operator verifies whether:' || ASCII_CHAR(13) || 
    '- The selected form is a conjunction.' || ASCII_CHAR(13) || 
    '- The first argument of the conjunction is a set operator.',
    'FormToClassGenerator'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    22,
    'Commutativity',
    'Select:' || ASCII_CHAR(13) || 
    '- a step of the proof, and' || ASCII_CHAR(13) || 
    '- a form or a term from this step.' || ASCII_CHAR(13) || 
    'This operator verifies whether the selected form is a conjunction, disjunction, double' || ASCII_CHAR(13) || 
    'implication, or equality.' || ASCII_CHAR(13) || 
    'This inference operator interchanges the arguments of the selected form.',
    'Commutativity'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    23,
    'Cross replacement',
    'Select:' || ASCII_CHAR(13) ||
    '- two steps of the proof (the source step and the destination step) and' || ASCII_CHAR(13) ||
    '- a form or a term from the destination step (the destination).' || ASCII_CHAR(13) ||
    'The operator verifies whether:' || ASCII_CHAR(13) ||
    '- The prefix of the source step is universal.' || ASCII_CHAR(13) ||
    '- The prefix-arg of the source step is one of following operators: double' || ASCII_CHAR(13) ||
    '  implication, implication, or equality. Let us name the first argument of this' || ASCII_CHAR(13) ||
    '  operator the source. The source references all the quantifiers in the pre-q-list of' || ASCII_CHAR(13) ||
    '  the source step.' || ASCII_CHAR(13) ||
    '- If the prefix-arg of the source step is an implication, the destination is implicable.' || ASCII_CHAR(13) ||
    '- The destination is equal to the source.' || ASCII_CHAR(13) ||
    'The result of the operator consists of the destination step, in which the destination is ' ||
    'replaced by the second argument of the postfix of the source step.',
    'CrossReplacement'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    24,
    'Reflexivity',
    'Select:' || ASCII_CHAR(13) || 
    '- a step of the proof, and' || ASCII_CHAR(13) || 
    '- a double implication or an equality from the step.' || ASCII_CHAR(13) || 
    'If the arguments of the selected form are equal, then this operator replaces the form' || ASCII_CHAR(13) || 
    'with the logical operator "T".',
    'Reflexivity'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    25,
    'Universal generalization (using equality)',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof,' || ASCII_CHAR(13) ||
    '- a form from the selected step, and' || ASCII_CHAR(13) ||
    '- a term from the selected step.' || ASCII_CHAR(13) ||
    'These operators verifies whether:' || ASCII_CHAR(13) ||
    '- The selected form is an ancestor of the selected term.' || ASCII_CHAR(13) ||
    '- The selected term has no references (links) to the selected form.' || ASCII_CHAR(13) ||
    'The inference operator replaces the selected form with an existential/universal ' ||
    'quantifier, having as a condition the equality of a link to itself and the selected term, ' ||
    'and as an execution argument the selected form, where each occurrence of the selected ' ||
    'term is replaced through links to the new quantifier.',
    'UniversalGeneralization'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    28,
    'Cross attachment',
    'Select:' || ASCII_CHAR(13) ||
    '- two steps of the proof (the source step and the destination step), and' || ASCII_CHAR(13) ||
    '- a form from the destination step (the destination).' || ASCII_CHAR(13) ||
    'The operator verifies whether:' || ASCII_CHAR(13) ||
    '- The prefix of the source step is universal.' || ASCII_CHAR(13) ||
    '- The prefix-arg of the source step is an implication. Let us name the first' || ASCII_CHAR(13) ||
    '  argument of this implication the source, and the second one the attachment.' || ASCII_CHAR(13) ||
    '  The source references all the quantifiers of the pre-q-list of the source step.' || ASCII_CHAR(13) ||
    '- The source is equal to the destination.' || ASCII_CHAR(13) ||
    'If the parent of the destination is a conjunction, and if the other argument of this ' ||
    'conjunction is equal to the attachment, then the operator replaces the parent of the ' ||
    'destination with the destination. Otherwise, the operator replaces the destination with ' ||
    'a conjunction of the destination and the attachment.',
    'CrossAttachment'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    29,
    'Tautologize',
    'This inference operator generates a proof step based on the sentence' || ASCII_CHAR(13) ||
    'we want to prove. The result of this step contains all the logical' || ASCII_CHAR(13) ||
    'operators of the sentence in a tautologized form.',
    'ExtractConclusion'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    30,
    'Duplication (conjunction)',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- two forms from the selected step (the source and the destination).' || ASCII_CHAR(13) ||
    'This operator verifies whether:' || ASCII_CHAR(13) ||
    '- The source and the destination are at different positions.' || ASCII_CHAR(13) ||
    '- The source is duplicable on the destination.' || ASCII_CHAR(13) ||
    'If the source and the destination have different contents, the operator replaces the ' ||
    'destination with the conjunction of the source and the destination. ' ||
    'If the source and the destination have equal contents and the parent of the destination ' ||
    'is a conjunction, the operator replaces this conjunction with the other argument of the ' ||
    'conjunction.',
    'DuplicationAnd'
  )
;
insert into
  Rules(Rule, Title, Description, Func)
  Values(
    31,
    'Duplication (implication)',
    'Select:' || ASCII_CHAR(13) ||
    '- a step of the proof, and' || ASCII_CHAR(13) ||
    '- two forms from the selected step (the source and the destination).' || ASCII_CHAR(13) ||
    'This operator verifies whether:' || ASCII_CHAR(13) ||
    '- The source and the destination are at different positions.' || ASCII_CHAR(13) ||
    '- The source is duplicable on the destination.' || ASCII_CHAR(13) ||
    'The action of this inference operator is very similar to the operator “Duplication (conjunction)”.' || ASCII_CHAR(13) ||
    'If the source and the destination have different contents, the operator replaces the ' ||
    'destination with the implication of the source and the destination.' || ASCII_CHAR(13) ||
    'If the source and the destination have equal contents and the destination is the first ' ||
    'argument of an implication, the operator replaces this implication with its second argument.',
    'DuplicationImp'
  )
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(101, 'Commutativity of the conjunction', 'Xpq <--> Xqp', 'DXpqXqp', 'Xpq', 'Xqp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(102, 'Commutativity of the disjunction', 'Vpq <--> Vqp', 'DVpqVqp', 'Vpq', 'Vqp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(103, 'Commutativity of the double implication', 'Dpq <--> Dqp', 'DDpqDqp', 'Dpq', 'Dqp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(104, 'Associativity of the conjunction', 'XXpqr <--> XpXqr', 'DXXpqrXpXqr', 'XXpqr', 'XpXqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(105, 'Associativity of the disjunction', 'VVpqr <--> VpVqr', 'DVVpqrVpVqr', 'VVpqr', 'VpVqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(106, 'Distributivity of a conjunction for a disjunction right', 'XVpqr <--> VXprXqr', 'DXVpqrVXprXqr', 'XVpqr', 'VXprXqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(107, 'Distributivity of a disjunction for a conjunction right', 'VXpqr <--> XVprVqr', 'DVXpqrXVprVqr', 'VXpqr', 'XVprVqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(108, 'Negation of a conjunction', 'NXpq <--> VNpNq', 'DNXpqVNpNq', 'NXpq', 'VNpNq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(109, 'Negation of a disjunction', 'NVpq <--> XNpNq', 'DNVpqXNpNq', 'NVpq', 'XNpNq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(110, 'Negation of an implication', 'NCpq <--> XpNq', 'DNCpqXpNq', 'NCpq', 'XpNq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(111, 'Negation of a negation', 'NNp <--> p', 'DNNpp', 'NNp', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(112, 'Negation of double implication', 'NDpq <--> VXpNqXNpq', 'DNDpqVXpNqXNpq', 'NDpq', 'VXpNqXNpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(113, 'Negation of double implication', 'NDpq <--> XVpqVNpNq', 'DNDpqXVpqVNpNq', 'NDpq', 'XVpqVNpNq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(114, 'Biconditionality', 'Dpq <--> XCpqCqp', 'DDpqXCpqCqp', 'Dpq', 'XCpqCqp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(115, 'Exportation', 'CpCqr <--> CXpqr', 'DCpCqrCXpqr', 'CpCqr', 'CXpqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(116, 'Contraposition', 'Cpq <--> CNqNp', 'DCpqCNqNp', 'Cpq', 'CNqNp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(117, 'Absorption', 'Cpq <--> CpXpq', 'DCpqCpXpq', 'Cpq', 'CpXpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(118, 'Implication to disjunction', 'Cpq <--> VNpq', 'DCpqVNpq', 'Cpq', 'VNpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(119, 'Subtraction (left)', 'Xpq --> p', 'CXpqp', 'Xpq', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(120, 'Double implication', 'Dpq <--> DNpNq', 'DDpqDNpNq', 'Dpq', 'DNpNq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(121, 'An implication to a conjunction is a conj. of two implications', 'CpXqr <--> XCpqCpr', 'DCpXqrXCpqCpr', 'CpXqr', 'XCpqCpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(122, 'Reduction conjunction', 'Xpp <--> p', 'DXppp', 'Xpp', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(123, 'Reduction disjunction', 'Vpp <--> p', 'DVppp', 'Vpp', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(124, 'Reflexivity of a double implication', 'Dpp <--> T', 'DDppT', 'Dpp', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(125, 'Disjunctive syllogism', 'XVpqNp --> q', 'CXVpqNpq', 'XVpqNp', 'q')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(126, 'Conjunction to double implication', 'Xpq --> Dpq', 'CXpqDpq', 'Xpq', 'Dpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(127, 'Transitivity of double implicat.', 'XDpqDqr --> Dpr', 'CXDpqDqrDpr', 'XDpqDqr', 'Dpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(128, 'Transitivity of implication', 'XCpqCqr --> Cpr', 'CXCpqCqrCpr', 'XCpqCqr', 'Cpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(129, 'Double implication to implication', 'Dpq --> Cpq', 'CDpqCpq', 'Dpq', 'Cpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(130, 'Conjunction of the negation of p and p', 'XNpp <--> NT', 'DXNppNT', 'XNpp', 'NT')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(131, 'Disjunction of the negation of p and p', 'VNpp <--> T', 'DVNppT', 'VNpp', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(132, 'Modus ponens', 'XpCpq --> q', 'CXpCpqq', 'XpCpq', 'q')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(133, 'Conjunction with True', 'XpT <--> p', 'DXpTp', 'XpT', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(134, 'Conjunction with False', 'XpNT <--> NT', 'DXpNTNT', 'XpNT', 'NT')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(135, 'Disjunction with True', 'VpT --> T', 'DVpTT', 'VpT', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(136, 'Disjunction with False', 'VpNT <--> p', 'DVpNTp', 'VpNT', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(137, 'Double implication with True', 'DpT <--> p', 'DDpTp', 'DpT', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(138, 'Double implication with False', 'DpNT <--> Np', 'DDpNTNp', 'DpNT', 'Np')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(139, 'Implication to True', 'CpT <--> T', 'DCpTT', 'CpT', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(140, 'Implication to False', 'CpNT <--> Np', 'DCpNTNp', 'CpNT', 'Np')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(141, 'Implied by True', 'CTp <--> p', 'DCTpp', 'CTp', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(142, 'Implied by False', 'CNTp <--> T', 'DCNTpT', 'CNTp', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(143, 'Conjunction implies implication', 'Xpq --> Cpq', 'CXpqCpq', 'Xpq', 'Cpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(144, 'Conjunction with double implication to double implication', 'XpDqr --> DXpqXpr', 'CXpDqrDXpqXpr', 'XpDqr', 'DXpqXpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(145, 'Implication with double implication to double implication', 'CpDqr <--> DXpqXpr', 'DCpDqrDXpqXpr', 'CpDqr', 'DXpqXpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(146, 'Implication with implication to implication to conjunction', 'XCpqCpr <--> CpXqr', 'DXCpqCprCpXqr', 'XCpqCpr', 'CpXqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(147, 'Implication to implication to self', 'Cpq <--> CpCpq', 'DCpqCpCpq', 'Cpq', 'CpCpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(148, 'Implication to implication to conjunction to implication', 'CpCqr --> CXpqr', 'CCpCqrCXpqr', 'CpCqr', 'CXpqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(149, 'Double implication of conjunctions to implication', 'DXpqXpr <--> CpDqr', 'DDXpqXprCpDqr', 'DXpqXpr', 'CpDqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(150, 'Conj. of impl. implies impl. of conj.', 'XCpqCrs --> CXprXqs', 'CXCpqCrsCXprXqs', 'XCpqCrs', 'CXprXqs')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(151, 'Implication to double implication and conjunction', 'CpDqXpr <--> CpDqr', 'DCpDqXprCpDqr', 'CpDqXpr', 'CpDqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(152, 'Subtraction (right)', 'Xpq --> q', 'CXpqq', 'Xpq', 'q')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(153, 'p implies p to p implies True', 'Cpp <--> CpT', 'DCppCpT', 'Cpp', 'CpT')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(154, 'Double implication with True (reverse)', 'p <--> DpT', 'DpDpT', 'p', 'DpT')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(155, 'An impl. of a disj. is a conj. of two impl.', 'CVpqr <--> XCprCqr', 'DCVpqrXCprCqr', 'CVpqr', 'XCprCqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(156, 'Equivalence of modus ponens', 'XpCpq <--> Xpq', 'DXpCpqXpq', 'XpCpq', 'Xpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(157, 'Interchanging positions in a conjunction of conjunctions', 'XXpqXrs <--> XXpsXqr', 'DXXpqXrsXXpsXqr', 'XXpqXrs', 'XXpsXqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(158, 'Conjunction implies disjunction', 'Xpq --> Vpq', 'CXpqVpq', 'Xpq', 'Vpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(159, 'Absorption left', 'CXpqr <--> CXpqXpr', 'DCXpqrCXpqXpr', 'CXpqr', 'CXpqXpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(160, 'Absorption right', 'CXpqr <--> CXpqXqr', 'DCXpqrCXpqXqr', 'CXpqr', 'CXpqXqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(161, 'Distributivity of a conjunction for a disjunction left', 'XpVqr <--> VXpqXpr', 'DXpVqrVXpqXpr', 'XpVqr', 'VXpqXpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(162, 'Distributivity of a disjunction for a conjunction left', 'VpXqr <--> XVpqVpr', 'DVpXqrXVpqVpr', 'VpXqr', 'XVpqVpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(163, 'A conj. of two implications to a implication of two disjunctions', 'XCpqCrs --> CVprVqs', 'CXCpqCrsCVprVqs', 'XCpqCrs', 'CVprVqs')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(164, 'Injection', 'CpCqr <--> CpCXpqr', 'DCpCqrCpCXpqr', 'CpCqr', 'CpCXpqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(165, 'Injection', 'CpCqr <--> CpCXpqXpr', 'DCpCqrCpCXpqXpr', 'CpCqr', 'CpCXpqXpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(166, 'p implies the disjunction of p and q', 'CpVpq <--> T', 'DCpVpqT', 'CpVpq', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(167, 'Conjunction implies its first argument', 'CXpqp <--> T', 'DCXpqpT', 'CXpqp', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(168, 'Conjunction with disjunction', 'XpVpq <--> p', 'DXpVpqp', 'XpVpq', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(169, 'Disjunction with conjunction', 'VpXpq <--> p', 'DVpXpqp', 'VpXpq', 'p')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(170, 'Implication to double implication', 'CpDpq <--> Cpq', 'DCpDpqCpq', 'CpDpq', 'Cpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(171, 'Reflexivity of the implication', 'Cpp <--> T', 'DCppT', 'Cpp', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(172, 'p implies p to p implies True (reverse)', 'CpT <--> Cpp', 'DCpTCpp', 'CpT', 'Cpp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(173, 'Biconditionalty (reverse)', 'XCpqCqp <--> Dpq', 'DXCpqCqpDpq', 'XCpqCqp', 'Dpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(174, 'Move condition to implicated', 'CpDqr <--> CpDqXpr', 'DCpDqrCpDqXpr', 'CpDqr', 'CpDqXpr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(175, 'Conj. of negations is negation of disjunctions', 'XNpNq <--> NVpq', 'DXNpNqNVpq', 'XNpNq', 'NVpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(176, 'Reduction conjunction (reverse)', 'p <--> Xpp', 'DpXpp', 'p', 'Xpp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(177, 'Associativity of the conjunction (reverse)', 'XpXqr <--> XXpqr', 'DXpXqrXXpqr', 'XpXqr', 'XXpqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(178, 'Absorption', 'CpXpq <--> Cpq', 'DCpXpqCpq', 'CpXpq', 'Cpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(179, 'Distrib. of a disj. for a conj. left (reverse)', 'XVpqVpr <--> VpXqr', 'DXVpqVprVpXqr', 'XVpqVpr', 'VpXqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(180, 'Distrib. of a conj. for a disj. left (reverse)', 'VXpqXpr <--> XpVqr', 'DVXpqXprXpVqr', 'VXpqXpr', 'XpVqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(181, 'Conjunction with True (reverse)', 'p <--> XpT', 'DpXpT', 'p', 'XpT')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(182, 'Implication to double implication (reverse)', 'Cpq <--> CpDpq', 'DCpqCpDpq', 'Cpq', 'CpDpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(183, 'An impl. of a disj. is a conj. of two impl. (reverse)', 'XCpqCrq <--> CVprq', 'DXCpqCrqCVprq', 'XCpqCrq', 'CVprq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(184, 'Negation of a conjunction (reverse)', 'VNpNq <--> NXpq', 'DVNpNqNXpq', 'VNpNq', 'NXpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(185, 'Equivalence of modus ponens (reverse)', 'Xpq <--> XpCpq', 'DXpqXpCpq', 'Xpq', 'XpCpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(186, 'Negation of a negation (reverse)', 'p <--> NNp', 'DpNNp', 'p', 'NNp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(187, 'Exportation (reverse)', 'CXpqr <--> CpCqr', 'DCXpqrCpCqr', 'CXpqr', 'CpCqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(188, 'Associativity of the disjunction (reverse)', 'VpVqr <--> VVpqr', 'DVpVqrVVpqr', 'VpVqr', 'VVpqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(189, 'Absorption', 'Cpq <--> DpXpq', 'DCpqDpXpq', 'Cpq', 'DpXpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(190, 'Distributivity of a disj. for a conj. right (reverse', 'XVprVqr <--> VXpqr', 'DXVprVqrVXpqr', 'XVprVqr', 'VXpqr')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(191, 'p and not p is true', 'VpNp <--> T', 'DVpNpT', 'VpNp', 'T')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(192, 'Implication to double implication of conjunction', 'Cpq <--> DXpqp', 'DCpqDXpqp', 'Cpq', 'DXpqp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(193, 'Disjunction as disjunctions of conjunctions', 'Vpq <--> VXpqVXpNqXNpq', 'DVpqVXpqVXpNqXNpq', 'Vpq', 'VXpqVXpNqXNpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(194, 'Conj. of double implications implies double implication of conj.', 'XDpqDrs --> DXprXqs', 'CXDpqDrsDXprXqs', 'XDpqDrs', 'DXprXqs')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(195, 'Absorbtion for conjuntion and implication', 'XXpqCpq <--> XpCpq', 'DXXpqCpqXpCpq', 'XXpqCpq', 'XpCpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(196, 'Absorption of conjunction', 'XCpqXpq <--> XCpqp', 'DXCpqXpqXCpqp', 'XCpqXpq', 'XCpqp')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(197, 'Absorption of conjunction (reverse)', 'XCpqp <--> XCpqXpq', 'DXCpqpXCpqXpq', 'XCpqp', 'XCpqXpq')
;
insert into
  Rules(Rule, Title, Description, Formula, Arg1, Arg2)
  Values(198, 'A conj. of two impl. is an impl. of a disj.', 'XCprCqr <--> CVpqr', 'DXCprCqrCVpqr', 'XCprCqr', 'CVpqr')
;
commit
;
