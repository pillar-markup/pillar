Class {
	#name : #PRParseTextTest,
	#superclass : #PRParseDocumentItemTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParseTextTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseTextTest >> actualClass [
	^ PRText
]

{ #category : #'tests-parsing' }
PRParseTextTest >> testEscapeCpp [
	| wiki tree |
	wiki := 'Text: \+\+'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Text: ++');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseTextTest >> testEscapeFirst [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '\* text' , nLine , '\+ text' , nLine , '\= text' , nLine
	        , '\@ text' , nLine , '\! text' , nLine , '\| text' , nLine
	        , '\# text' , nLine , '\- text'.
	tree := PRDocument new
		        add: (PRParagraph new
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
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseTextTest >> testEscapeStrange [

	| wiki tree |
	wiki := '< text' , self lineEnding , '> text'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: '< text');
				         add: PRLineBreak new;
				         add: (PRText content: '> text');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseTextTest >> testEscapeText [
	| wiki tree |
	wiki := 'Text: \*\+'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Text: *+');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseTextTest >> testEscapeWiki [
	| wiki tree |
	wiki := 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseTextTest >> testParseBasic [
	| wiki tree |
	wiki := 'abcdefghijklmnopqrstuvwxyz... ABCDEFGHIJKLMNOPQRSTUVWXYZ... 0123456789...'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'abcdefghijklmnopqrstuvwxyz... ABCDEFGHIJKLMNOPQRSTUVWXYZ... 0123456789...');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseTextTest >> testParseHtml [
	| wiki tree |
	wiki := '<strong>strong <emph>strong, emph</emph></strong>'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '<strong>strong <emph>strong, emph</emph></strong>');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseTextTest >> testParseLatex [
	| wiki text tree |
	wiki := '\\begin{foo}[bar]$zork$\\end{foo}'.
	text := '\begin{foo}[bar]$zork$\end{foo}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '\begin{foo}[bar]$zork$\end{foo}');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseTextTest >> testParseSpecial [
	| wiki tree |
	wiki := '????????????¬å???????????????¬ú??¬ü¬¬°¬¢¬£¬§¬·?¬ß?¬©¬¬´¬¨?¬Æ¬Ø¬¬±???¬µ¬¬??¬¬ª???¬ø¦Ä¦Å¦Ç¦É¦Ñ¦Ö¦Ü¦á¦à¦â¦ä¦ã¦å¦ç¦é¦è?¦ë¦í¦ì¦î¦ï¦ñ?¦ò¦ô¦ö¦õ¦ú??¦ü¦¦°¦¢¦£¦§¦·¦¶¦ß¦®¦©¦¦´¦¨¦¦Æ¦Ø?¦±¦¦¦¥¦µ¦¦¦¦¦¦ª¦º??'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText
										content: '????????????¬å???????????????¬ú??¬ü¬¬°¬¢¬£¬§¬·?¬ß?¬©¬¬´¬¨?¬Æ¬Ø¬¬±???¬µ¬¬??¬¬ª???¬ø¦Ä¦Å¦Ç¦É¦Ñ¦Ö¦Ü¦á¦à¦â¦ä¦ã¦å¦ç¦é¦è?¦ë¦í¦ì¦î¦ï¦ñ?¦ò¦ô¦ö¦õ¦ú??¦ü¦¦°¦¢¦£¦§¦·¦¶¦ß¦®¦©¦¦´¦¨¦¦Æ¦Ø?¦±¦¦¦¥¦µ¦¦¦¦¦¦ª¦º??');
							yourself);
				yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseTextTest >> testParseWiki [
	| wiki tree |
	wiki := ' !_#-|=]@:<>\*'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText content: ' !_#-|=]@:<>*');
							yourself);
				yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]
