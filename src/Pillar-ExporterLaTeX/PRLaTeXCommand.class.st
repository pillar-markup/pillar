"
A LaTeX command

to emit 

\mycommand potentially with arguments and optionals. 

\mycommand[1]{#1}
"
Class {
	#name : #PRLaTeXCommand,
	#superclass : #PRLaTeXBrush,
	#category : 'Pillar-ExporterLaTeX'
}

{ #category : #accessing }
PRLaTeXCommand >> name: aString [ 
	stream
		<< $\
		<< aString
]
