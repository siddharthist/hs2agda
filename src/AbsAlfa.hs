module AbsAlfa where

-- Haskell module generated by the BNF converter

newtype Comment = Comment String deriving (Eq,Ord,Show)
newtype Infix = Infix String deriving (Eq,Ord,Show)
newtype PIdent = PIdent ((Int,Int),String) deriving (Eq,Ord,Show)
newtype Star = Star ((Int,Int),String) deriving (Eq,Ord,Show)
newtype Meta = Meta ((Int,Int),String) deriving (Eq,Ord,Show)
data Module =
   Module [Decl]
  deriving (Eq,Ord,Show)

data Decl =
   DDef [DefAttr] Def
 | DImp Import
  deriving (Eq,Ord,Show)

data Def =
   Value AIdent [VarDecl] Exp Exp
 | Binding AIdent Exp
 | Package AIdent [Typing] PackageBody
 | Open Exp [OpenArg]
 | Data AIdent [Typing] [Constructor]
 | Type AIdent [Typing] Exp
 | Axiom AIdent [Typing] Exp
 | Mutual [Def]
 | Commt Comment
 | Class TySig [TySig]
 | Inst TySig [Binding]
  deriving (Eq,Ord,Show)

data TySig =
   TySig AIdent [VarDecl] Exp
  deriving (Eq,Ord,Show)

data Import =
   Import String
  deriving (Eq,Ord,Show)

data Exp =
   EVar AIdent
 | ECon AIdent
 | ESet
 | EType
 | EMeta Meta
 | EMetaU
 | EStar Star
 | EString String
 | EChar Char
 | EInt Integer
 | EDouble Double
 | EProj Exp AIdent
 | EApp Exp Exp
 | EAppHid Exp Exp
 | EInfix Exp Infix Exp
 | ESig [FieldDecl]
 | EStr [Binding]
 | ESum [Constructor]
 | EPi VarDecl Arrow Exp
 | EFun Exp Arrow Exp
 | EAbs VarDecl Arrow Exp
 | EAbsUnt [AIdent] Arrow Exp
 | ELet [Decl] Exp
 | EOpen Exp [OpenArg] Exp
 | ECase Exp [Branch]
 | EIData [VarDecl] [IndConstructor]
 | ECommL Comment Exp
 | ECommR Exp Comment
 | EConst AIdent
 | EMetaN Integer
  deriving (Eq,Ord,Show)

data Arrow =
   AShow
 | AHide
  deriving (Eq,Ord,Show)

data Typing =
   TDecl VarDecl
 | TExp Exp
  deriving (Eq,Ord,Show)

data VarDecl =
   VDecl [Bound] Exp
  deriving (Eq,Ord,Show)

data Bound =
   BVar AIdent
 | BHide AIdent
  deriving (Eq,Ord,Show)

data FieldDecl =
   FDecl AIdent Exp
  deriving (Eq,Ord,Show)

data Branch =
   BranchCon AIdent [AIdent] Exp
 | BranchInf AIdent Infix AIdent Exp
 | BranchVar AIdent Exp
  deriving (Eq,Ord,Show)

data Constructor =
   Cnstr AIdent [Typing]
  deriving (Eq,Ord,Show)

data IndConstructor =
   ICnstr AIdent [Typing] [Exp]
  deriving (Eq,Ord,Show)

data Binding =
   Bind AIdent Exp
  deriving (Eq,Ord,Show)

data PackageBody =
   PackageDef [Decl]
 | PackageInst Exp
  deriving (Eq,Ord,Show)

data OpenArg =
   OArg [DefAttr] AIdent
 | OArgT [DefAttr] AIdent Exp
 | OArgD [DefAttr] AIdent Exp
 | OArgTD [DefAttr] AIdent Exp Exp
  deriving (Eq,Ord,Show)

data DefAttr =
   Private
 | Public
 | Abstract
 | Concrete
  deriving (Eq,Ord,Show)

data AIdent =
   I Infix
 | F PIdent
  deriving (Eq,Ord,Show)
