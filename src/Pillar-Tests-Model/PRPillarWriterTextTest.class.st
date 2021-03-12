Class {
	#name : #PRPillarWriterTextTest,
	#superclass : #PRPillarWriterDocumentItemTest4,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #testing }
PRPillarWriterTextTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterTextTest >> actualClass [
	^ PRText
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testEscapeCpp [
	| wiki tree |
	wiki := 'Text: \+\+'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Text: ++');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testEscapeFirst [
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
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testEscapeStrange [
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
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testEscapeText [
	| wiki tree |
	wiki := 'Text: \*\+'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Text: *+');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testEscapeWiki [
	| wiki tree |
	wiki := 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testParseBasic [
	| wiki tree |
	wiki := 'abcdefghijklmnopqrstuvwxyz... ABCDEFGHIJKLMNOPQRSTUVWXYZ... 0123456789...'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'abcdefghijklmnopqrstuvwxyz... ABCDEFGHIJKLMNOPQRSTUVWXYZ... 0123456789...');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testParseHtml [
	| wiki tree |
	wiki := '<strong>strong <emph>strong, emph</emph></strong>'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '<strong>strong <emph>strong, emph</emph></strong>');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testParseLatex [
	| wiki tree |
	wiki := '\\begin{foo}[bar]$zork$\\end{foo}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '\begin{foo}[bar]$zork$\end{foo}');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testParseSpecial [
	| wiki tree |
	wiki := '????????????¬å???????????????¬ú??¬ü¬¬°¬¢¬£¬§¬·?¬ß?¬©¬¬´¬¨?¬Æ¬Ø¬¬±???¬µ¬¬??¬¬ª???¬ø¦Ä¦Å¦Ç¦É¦Ñ¦Ö¦Ü¦á¦à¦â¦ä¦ã¦å¦ç¦é¦è?¦ë¦í¦ì¦î¦ï¦ñ?¦ò¦ô¦ö¦õ¦ú??¦ü¦¦°¦¢¦£¦§¦·¦¶¦ß¦®¦©¦¦´¦¨¦¦Æ¦Ø?¦±¦¦¦¥¦µ¦¦¦¦¦¦ª¦º??'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText
										content: '????????????¬å???????????????¬ú??¬ü¬¬°¬¢¬£¬§¬·?¬ß?¬©¬¬´¬¨?¬Æ¬Ø¬¬±???¬µ¬¬??¬¬ª???¬ø¦Ä¦Å¦Ç¦É¦Ñ¦Ö¦Ü¦á¦à¦â¦ä¦ã¦å¦ç¦é¦è?¦ë¦í¦ì¦î¦ï¦ñ?¦ò¦ô¦ö¦õ¦ú??¦ü¦¦°¦¢¦£¦§¦·¦¶¦ß¦®¦©¦¦´¦¨¦¦Æ¦Ø?¦±¦¦¦¥¦µ¦¦¦¦¦¦ª¦º??');
							yourself);
				yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterTextTest >> testParseWiki [
	| wiki tree |
	wiki := ' !_#-|=]@:<>\*'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText content: ' !_#-|=]@:<>*');
							yourself);
				yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki
]
