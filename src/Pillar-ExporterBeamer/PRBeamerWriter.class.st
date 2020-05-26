"
I'm a writer generating Beamer slides from a Pillar document. Beamer is a LaTeX package specialized in slide creation.
"
Class {
	#name : #PRBeamerWriter,
	#superclass : #PRLaTeXWriter,
	#category : #'Pillar-ExporterBeamer'
}

{ #category : #'as yet unclassified' }
PRBeamerWriter class >> codeSmalltalk [
	^ '% Source Code
\usepackage{color}
\definecolor{source}{gray}{0.85}% my comment style
\newcommand{\myCommentStyle}[1]{{\footnotesize\sffamily\color{gray!100!white} #1}}
% my string style
\newcommand{\myStringStyle}[1]{{\footnotesize\sffamily\color{violet!100!black} #1}}
% my symbol style
\newcommand{\mySymbolStyle}[1]{{\footnotesize\sffamily\color{violet!100!black} #1}}
% my keyword style
\newcommand{\myKeywordStyle}[1]{{\footnotesize\sffamily\color{green!70!black} #1}}
% my global style
\newcommand{\myGlobalStyle}[1]{{\footnotesize\sffamily\color{blue!100!black} #1}}
% my number style
\newcommand{\myNumberStyle}[1]{{\footnotesize\sffamily\color{brown!100!black} #1}}

\lstset{
language={},
tabsize=3,
escapechar={!},
keepspaces=true,
breaklines=true,
alsoletter={\#},
literate={\$}{{{\$}}}1,
breakautoindent=true,
columns=fullflexible,
showstringspaces=false,
frame=single,
aboveskip=1em, % automatic space before
framerule=0pt,
basicstyle=\footnotesize\sffamily\color{black},
keywordstyle=\myKeywordStyle,% keyword style
commentstyle=\myCommentStyle,% comment style
frame=single,%
backgroundcolor=\color{source},
stepnumber=1,
numbersep=10pt,
numberstyle=\tiny,
numberfirstline=true,
captionpos=b,
moredelim=[is][\bfseries]{&lt;b&gt;}{&lt;/b&gt;},
moredelim=[is][\textit]{&lt;i&gt;}{&lt;/i&gt;},
moredelim=[is][\underbar]{&lt;u&gt;}{&lt;/u&gt;},
moredelim=[is][\color{red}\uwave]{&lt;wave&gt;}{&lt;/wave&gt;},
moredelim=[is][\color{red}\sout]{&lt;del&gt;}{&lt;/del&gt;},
moredelim=[is][\color{blue}\underbar]{&lt;ins&gt;}{&lt;/ins&gt;},
morecomment=[s][\myCommentStyle]{"}{"},
morestring=[b][\myStringStyle]'',
moredelim=[is][]{&lt;sel&gt;}{&lt;/sel&gt;},
moredelim=[is][]{&lt;rcv&gt;}{&lt;/rcv&gt;},
moredelim=[is][\itshape]{&lt;symb&gt;}{&lt;/symb&gt;},
moredelim=[is][\scshape]{&lt;class&gt;}{&lt;/class&gt;},
morekeywords={true,false,nil,self,super,thisContext},
identifierstyle=\idstyle,
}
 
\makeatletter
\newcommand*\idstyle[1]{%
\expandafter\id@style\the\lst@token{#1}\relax%
}
\def\id@style#1#2\relax{%
\ifnum\pdfstrcmp{#1}{\#}=0%
% this is a symbol
\mySymbolStyle{\the\lst@token}%
\else%
\edef\tempa{\uccode`#1}%
\edef\tempb{`#1}%
\ifnum\tempa=\tempb%
% this is a global
\myGlobalStyle{\the\lst@token}%
\else%
\the\lst@token%
\fi%
\fi%
}
\makeatother
\newcommand{\lct}{\texttt}
 
\lstnewenvironment{code}{%
 \lstset{%
 frame=single,
 framerule=0pt,
 mathescape=false
 }%
 \noindent%
 \minipage{\linewidth}%
}{%
 \endminipage%
}%
\lstnewenvironment{codeWithLineNumbers}{%
 \lstset{%
 frame=single,
 framerule=0pt,
 mathescape=false,
 numbers=left
 }%
 \noindent%
 \minipage{\linewidth}%
}{%
 \endminipage%
}%

\newenvironment{codeNonSmalltalk}
{\begin{alltt}\sffamily}
{\end{alltt}\normalsize}
'
]

{ #category : #accessing }
PRBeamerWriter class >> folderName [
	^ #beamer
]

{ #category : #accessing }
PRBeamerWriter class >> writerName [
	^ #beamer
]

{ #category : #helpers }
PRBeamerWriter >> createFrametitle: aTitle [
	canvas command
		name: 'frametitle';
		parameter: aTitle
]

{ #category : #helpers }
PRBeamerWriter >> createLinkToLabelWithAlias: anInternalLink [
	canvas command
		name: 'hyperlink';
		parameter: [ canvas raw: anInternalLink anchor ];
		parameter: [ canvas raw: anInternalLink alias ]
]

{ #category : #helpers }
PRBeamerWriter >> createTOCWith: aCollection [
	| parameters |
	parameters := LinkedList new.
	"highlight := aCollection at: 'highlight' ifPresent: [ :param | param ] ifAbsent: [ false ].
	highlight = 1
		ifTrue: [ parameters add: 'currentsection, hideallsubsections' ]
		ifFalse: [ 
			highlight = 2
				ifTrue: [ parameters add: 'currentsection, currentsubsection' ]
				ifFalse: [ self sectionOptionFrom: (aCollection at: 'level') asInteger To: (aCollection at: 'depthLevel') asInteger On: parameters ] ]."
	self flag: #todo.	"We need to change the highlight"
	canvas command
		name: 'tableofcontents';
		optParameter: (String streamContents: [ :s | parameters do: [ :each | s nextPutAll: each ] separatedBy: [ s nextPut: $, ] ])
]

{ #category : #'visiting-document' }
PRBeamerWriter >> getLevelFor: aHeader [
	^ 2 + (super getLevelFor: aHeader)
]

{ #category : #helpers }
PRBeamerWriter >> sectionOptionFrom: level To: depth On: parameters [
	parameters
		add:
			((1 > level and: [ 1 <= depth ])
				ifTrue: [ 'sectionstyle=show/show' ]
				ifFalse: [ 'sectionstyle=hide/hide' ]).
	parameters
		add:
			((2 > level and: [ 2 <= depth ])
				ifTrue: [ 'subsectionstyle=show/show/show' ]
				ifFalse: [ 'subsectionstyle=hide/hide/hide' ]).
	parameters
		add:
			((3 > level and: [ 3 <= depth ])
				ifTrue: [ 'subsubsectionstyle=show/show/show' ]
				ifFalse: [ 'subsubsectionstyle=hide/hide/hide' ])
]

{ #category : #templating }
PRBeamerWriter >> templateForConfiguration: aConfiguration [
	^ 'presentation.template'
]

{ #category : #'visiting-document' }
PRBeamerWriter >> visitCodeblock: aCodeBlock [
	| env |
	aCodeBlock language isSyntaxHighlightingPossible
		ifTrue: [ 
			canvas
				raw: '% syntax highlighting = ' , (self languageForScript: aCodeBlock) printString;
				newLine ].
	env := (aCodeBlock hasCaption or: [ aCodeBlock hasLabel ])
		ifTrue: [ 
			canvas environment
				name: 'script';
				optParameter: aCodeBlock label;
				parameter: [ self noNewLineDuring: [ self visit: aCodeBlock caption ] ];
				yourself ]
		ifFalse: [ 
			canvas environment
				name: 'listing';
				parameter: '';
				yourself ].
	env with: [ self writeRawDuring: [ self visitText: aCodeBlock ]. canvas newLine ]
]

{ #category : #'visiting-annotations' }
PRBeamerWriter >> visitColumn: aColumn [
	canvas environment
		name: 'column';
		parameter: [ 
					canvas
						nextPutAll: (aColumn width asNumber / 100.0) printString;
						raw: '\textwidth' ];
		with: [ super visitColumn: aColumn ].
	canvas newLine
]

{ #category : #'visiting-annotations' }
PRBeamerWriter >> visitColumns: aColumns [
	canvas environment
		name: 'columns';
		with: [ 
					super visitColumns: aColumns ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRBeamerWriter >> visitFigure: aFigure [
	canvas environment
		name: 'center';
		with: [ self includeGraphicsFor: aFigure ]
]

{ #category : #'visiting-document' }
PRBeamerWriter >> visitHeader: aHeader [
	super visitHeader: aHeader.
	self configuration renderStructureAsSlide
		ifTrue: [ 
			canvas newLine.
			canvas environment
				name: 'frame';
				with: [ 
							canvas newLine.
							canvas environment
								name: 'center';
								with: [ 
											canvas newLine.
											canvas command
												name: 'huge';
												parameter: [ self visitDocumentGroup: aHeader ].
											canvas newLine ] ].
			canvas newLine ]
]

{ #category : #'visiting-document' }
PRBeamerWriter >> visitSlide: aSlide [
	canvas newLine.
	canvas environment
		name: 'frame';
		optParameter: 'fragile';
		with: [ 
					canvas newLine.
					aSlide hasLabel
						ifTrue: [ 
							canvas command
								name: 'label';
								parameter: aSlide label.
							canvas newLine ].
					self createFrametitle: aSlide title.
					canvas newLine.
					super visitSlide: aSlide ].
	canvas newLine
]

{ #category : #'visiting-annotations' }
PRBeamerWriter >> visitTOCAnnotation: aTOCAnnotation [
	canvas newLine.
	canvas environment
		name: 'frame';
		with: [ 
					canvas newLine.
					self createFrametitle: (aTOCAnnotation parameters at: 'title' ifAbsent: [ 'Table Of Content' ]).
					canvas newLine.
					self createTOCWith: aTOCAnnotation parameters.
					canvas newLine ].
	canvas newLine
]
