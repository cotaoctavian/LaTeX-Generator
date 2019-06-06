module IMP-SYNTAX

syntax Word ::= Int | Id | String

syntax Phrase ::= Word
               | Phrase Phrase [right]

syntax Printable ::= Int | String | Id | Phrase

syntax PrintF::= "Print" "(" Printable ")" ";" [strict]

syntax Document ::= "documentclass:"
syntax Section ::= "section:"
syntax Package ::= "usepackage:"
syntax Begin ::= "begin:"
syntax End ::= "end:"
syntax Title ::= "title:"
syntax Date ::= "date:"
syntax Author ::= "author:"
syntax Maketitle ::= "maketitle"
syntax Small ::= "small:"
syntax Large ::= "Large:" 
syntax LARGE ::= "LARGE:" 
syntax SLarge ::= "large:" 
syntax Huge ::= "huge:" 
syntax Tiny ::= "tiny:" 
syntax Newpage ::= "newpage"
syntax Enter ::= "enter"
syntax Cos ::= "cos:" 
syntax Sin ::= "sin:" 
syntax Tan ::= "tan:"
syntax Arcsin ::= "arcsin:" 
syntax Arccos ::= "arccos:" 
syntax Arctan ::= "arctan:"
syntax Item ::= "item:"
syntax Textsubscript ::= "textsubscript:"
syntax Cdots ::= "cdots:"
syntax Ddots ::= "ddots:"
syntax Hdots ::= "hdots:"
syntax Vdots ::= "vdots:"
syntax Next ::= "next"
syntax Simbol ::= "&"
syntax Subset ::= "subset:"
syntax NSubset ::= "nsubset:"
syntax Subseteq ::= "subseteq:"
syntax NSubseteq ::= "nsubseteq:"
syntax Leq ::= "leq:"
syntax NLeq ::= "nleq:"
syntax Geq ::= "geq:"
syntax NGeq ::= "ngeq:"
syntax NLess ::= "nless:"
syntax NGtr ::= "ngtr:"
syntax Doteq ::= "doteq:"
syntax Equiv ::= "equiv:"
syntax Approx ::= "approx:"
syntax Cong ::= "cong:"
syntax Simeq ::= "simeq:"
syntax Sim ::= "sim:"
syntax Neq ::= "neq:"
syntax In ::= "in:"
syntax Models ::= "models:"
syntax Perp ::= "perp:"
syntax Vdash ::= "vdash:"
syntax Parallel ::= "parallel:"
syntax NParallel ::= "nparallel:"
syntax Pm ::= "pm:"
syntax Mp ::= "mp:"
syntax Cup ::= "cup:"
syntax Cap ::= "cap:"
syntax Oplus ::= "oplus:"
syntax Ominus ::= "ominus:"
syntax Oslash ::= "oslash:"
syntax To ::= "to:"
syntax Gets ::= "gets:"
syntax RightArrow ::= "rightarrow:"
syntax LeftArrow ::= "leftarrow:"
syntax UpArrow ::= "uparrow:"
syntax DownArrow ::= "downarrow:"
 
syntax Stmt ::= PrintF
             |  Section
		     |  Document 
             |  Package 
             |  Begin 
             |  Title 
             |  Date
             |  Author
             |  Maketitle 
             |  Small
             |  LARGE
             |  Large
             |  SLarge
             |  Huge
             |  Tiny
             |  Newpage
             |  Enter
             |  Phrase
             |  End
             |  Cos  
             |  Sin 
             |  Tan 
             |  Arcsin 
             |  Arccos  
             |  Arctan 
             |  Item
             |  Textsubscript
             |  Cdots
             |  Vdots
             |  Ddots
             |  Hdots
             |  Next
             |  Simbol
             |  Subset
             |  NSubset
             |  Subseteq
             |  NSubseteq
             |  Leq
             |  NLeq
             |  Geq
             |  NGeq
             |  NLess
             |  NGtr
             |  Doteq 
             |  Equiv
             |  Approx
             |  Cong
             |  Simeq
             |  Sim
             |  Neq
             |  In
             |  Perp
             |  Parallel
             |  NParallel
             |  Models
             |  Vdash
             |  Pm
             |  Mp
             |  Oplus
             |  Ominus
             |  Oslash
             |  Cup 
             |  Cap
             |  To
             |  Gets 
             |  RightArrow
             |  LeftArrow
             |  UpArrow
             |  DownArrow

syntax Stmts::= Stmt 
             > Stmts Stmts [right]
        
endmodule

module IMP
    imports IMP-SYNTAX

    syntax KResult ::= Printable
    configuration 
	<k> $PGM:Stmts </k>
        <out stream = "stdout"> .List </out>

	rule <k> (Print(V:Printable); => .) ...</k>
       <out>... (.List => ListItem(V)) </out>
	   
	rule S1:Stmts S2:Stmts => S1 ~> S2  [structural]

	rule <k>  V:Document => Print("\\documentclass:{"); ...  </k>
    rule <k>  V:Section => Print("\\section:{"); ... </k>
    rule <k>  V:Package => Print("\\usepackage:{"); ...  </k>
    rule <k>  V:Begin => Print("\\begin:{"); ...  </k>
    rule <k>  V:End => Print("\\end:{"); ... </k>
    rule <k>  V:Title => Print("\\title:{"); ...  </k>
    rule <k>  V:Author => Print("\\author:{"); ...  </k>
    rule <k>  V:Date => Print("\\date:{"); ...  </k>
    rule <k>  V:Maketitle => Print("\\maketitle \n"); ...  </k>
    rule <k>  V:Phrase => Print(V); Print("} \n"); ... </k>
    rule <k>  V:Small => Print("\\small:{"); ... </k>
    rule <k>  V:Large => Print("\\Large:{"); ... </k>
    rule <k>  V:LARGE => Print("\\LARGE:{"); ... </k>
    rule <k>  V:SLarge => Print("\\large:{"); ... </k>
    rule <k>  V:Huge => Print("\\huge:{"); ... </k>
    rule <k>  V:Tiny => Print("\\tiny:{"); ... </k>
    rule <k>  V:Newpage => Print("\\newpage \n"); ... </k>
    rule <k>  V:Enter => Print("\\\\"); Print("\n"); ... </k>
    rule <k>  V:Sin => Print("$sin:"); ... </k>
    rule <k>  V:Cos => Print("$cos:"); ... </k>
    rule <k>  V:Tan => Print("$tan:"); ... </k>
    rule <k>  V:Arccos => Print("$arccos:"); ... </k>
    rule <k>  V:Arcsin => Print("$arcsin:"); ... </k>
    rule <k>  V:Arctan => Print("$arctan:"); ... </k>
    rule <k>  V:Item => Print("\\item{"); ... </k>
    rule <k>  V:Textsubscript => Print("\\textsubscript{"); ... </k>
    rule <k>  V:Cdots => Print("\\cdots "); ... </k>
    rule <k>  V:Ddots => Print("\\ddots "); ... </k>
    rule <k>  V:Hdots => Print("\\hdots "); ... </k>
    rule <k>  V:Vdots => Print("\\vdots "); ... </k>
    rule <k>  V:Next => Print("\n"); ... </k>
    rule <k>  V:Simbol => Print("&"); ... </k>
    rule <k>  V:Subset => Print("\\subset "); ... </k>
    rule <k>  V:NSubset => Print("\\nsubset "); ... </k>
    rule <k>  V:Subseteq => Print("\\subseteq "); ... </k>
    rule <k>  V:NSubseteq => Print("\\nsubseteq ");  ... </k>
    rule <k>  V:Leq => Print("\\leq "); ... </k>
    rule <k>  V:NLeq => Print("\\nleq "); ... </k>
    rule <k>  V:Geq => Print("\\geq "); ... </k>
    rule <k>  V:NGeq => Print("\\ngeq "); ... </k>
    rule <k>  V:NLess => Print("\\nless "); ... </k>
    rule <k>  V:NGtr => Print("\\ngtr "); ... </k>
    rule <k>  V:Doteq => Print("\\doteq "); ... </k>
    rule <k>  V:Equiv => Print("\\equiv "); ... </k>
    rule <k>  V:Approx => Print("\\approv "); ... </k>
    rule <k>  V:Cong => Print("\\cong "); ... </k>
    rule <k>  V:Simeq => Print("\\simeq "); ... </k>
    rule <k>  V:Sim => Print("\\sim "); ... </k>
    rule <k>  V:Neq => Print("\\neq "); ... </k>
    rule <k>  V:In => Print("\\in "); ... </k>
    rule <k>  V:Vdash => Print("\\vdash "); ... </k>
    rule <k>  V:Parallel => Print("\\parallel "); ... </k>
    rule <k>  V:Perp => Print("\\perp "); ... </k>
    rule <k>  V:Models => Print("\\models "); ... </k>
    rule <k>  V:NParallel => Print("\\nparallel "); ... </k>
    rule <k>  V:Pm => Print("\\pm "); ... </k>
    rule <k>  V:Mp => Print("\\mp "); ... </k>
    rule <k>  V:Oplus => Print("\\oplus "); ... </k>
    rule <k>  V:Ominus => Print("\\ominus "); ... </k>
    rule <k>  V:Oslash => Print("\\oslash "); ... </k>
    rule <k>  V:Cup => Print("\\cup "); ... </k>
    rule <k>  V:Cap => Print("\\cap "); ... </k>
    rule <k>  V:To => Print("\\to "); ... </k>
    rule <k>  V:Gets => Print("\\gets "); ... </k>
    rule <k>  V:RightArrow => Print("\\rightarrow "); ... </k>
    rule <k>  V:LeftArrow => Print("\\leftarrow "); ... </k>
    rule <k>  V:DownArrow => Print("\\downarrow "); ... </k>
    rule <k>  V:UpArrow => Print("\\uparrow "); ... </k>

endmodule