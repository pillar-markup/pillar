Class {
	#name : #PRTextTest3,
	#superclass : #PRTextWriterDocumentItemTest3,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRTextTest3 class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextTest3 >> actualClass [
	^ PRText
]

{ #category : #'tests-instantiation' }
PRTextTest3 >> testContent [
	instance := self actualClass content: 'zork'.
	self assert: self instance text equals: 'zork'
]

{ #category : #'tests-comparing' }
PRTextTest3 >> testEqualText [
	self deny: (self actualClass content: 'foo') equals: (self actualClass content: 'bar')
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testEscapeCpp [
	| wiki tree |
	wiki := 'Text: \+\+'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Text: ++');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testEscapeFirst [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '\* text' , nLine , '\+ text' , nLine , '\= text' , nLine , '\@ text' , nLine , '\! text' , nLine , '\| text'
		, nLine , '\# text' , nLine , '\- text'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: '* text');
						add: PRLineBreak new;
						add: (PRText content: '+ text');
						add: PRLineBreak new;
						add: (PRText content: '= text');
						add: PRLineBreak new;
						add: (PRText content: '@ text');
						add: PRLineBreak new;
						add: (PRText content: '! text');
						add: PRLineBreak new;
						add: (PRText content: '| text');
						add: PRLineBreak new;
						add: (PRText content: '# text');
						add: PRLineBreak new;
						add: (PRText content: '- text');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testEscapeStrange [
	| wiki tree |
	wiki := '< text' , Smalltalk os lineEnding , '> text'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: '< text');
						add: PRLineBreak new;
						add: (PRText content: '> text');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testEscapeText [
	| wiki tree |
	wiki := 'Text: \*\+'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Text: *+');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testEscapeWiki [
	| wiki tree |
	wiki := 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testParseBasic [
	| wiki tree |
	wiki := 'abcdefghijklmnopqrstuvwxyz... ABCDEFGHIJKLMNOPQRSTUVWXYZ... 0123456789...'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'abcdefghijklmnopqrstuvwxyz... ABCDEFGHIJKLMNOPQRSTUVWXYZ... 0123456789...');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testParseHtml [
	| wiki tree |
	wiki := '<strong>strong <emph>strong, emph</emph></strong>'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '<strong>strong <emph>strong, emph</emph></strong>');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testParseLatex [
	| wiki text tree |
	wiki := '\\begin{foo}[bar]$zork$\\end{foo}'.
	text := '\begin{foo}[bar]$zork$\end{foo}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '\begin{foo}[bar]$zork$\end{foo}');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testParseSpecial [
	| wiki tree |
	wiki := '????????????¬å???????????????¬ú??¬ü¬¬°¬¢¬£¬§¬·?¬ß?¬©¬¬´¬¨?¬Æ¬Ø¬¬±???¬µ¬¬??¬¬ª???¬ø¦Ä¦Å¦Ç¦É¦Ñ¦Ö¦Ü¦á¦à¦â¦ä¦ã¦å¦ç¦é¦è?¦ë¦í¦ì¦î¦ï¦ñ?¦ò¦ô¦ö¦õ¦ú??¦ü¦¦°¦¢¦£¦§¦·¦¶¦ß¦®¦©¦¦´¦¨¦¦Æ¦Ø?¦±¦¦¦¥¦µ¦¦¦¦¦¦ª¦º??'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText
										content: '????????????¬å???????????????¬ú??¬ü¬¬°¬¢¬£¬§¬·?¬ß?¬©¬¬´¬¨?¬Æ¬Ø¬¬±???¬µ¬¬??¬¬ª???¬ø¦Ä¦Å¦Ç¦É¦Ñ¦Ö¦Ü¦á¦à¦â¦ä¦ã¦å¦ç¦é¦è?¦ë¦í¦ì¦î¦ï¦ñ?¦ò¦ô¦ö¦õ¦ú??¦ü¦¦°¦¢¦£¦§¦·¦¶¦ß¦®¦©¦¦´¦¨¦¦Æ¦Ø?¦±¦¦¦¥¦µ¦¦¦¦¦¦ª¦º??');
							yourself);
				yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRTextTest3 >> testParseWiki [
	| wiki tree |
	wiki := ' !_#-|=]@:<>\*'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText content: ' !_#-|=]@:<>*');
							yourself);
				yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-printing' }
PRTextTest3 >> testPrinting [
	| text |
	text := PRText content: 'abcdef'.
	'*abcdef*' match: text printString
]

{ #category : #'tests-accessing' }
PRTextTest3 >> testText [
	self instance text: 'zork'.
	self assert: self instance text equals: 'zork'
]