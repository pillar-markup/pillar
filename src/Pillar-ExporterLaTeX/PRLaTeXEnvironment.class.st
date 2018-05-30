"
A LaTeX environment

To emit

\begin{XXX}
kjlkjkl
\end{XXX}
"
Class {
	#name : #PRLaTeXEnvironment,
	#superclass : #PRLaTeXBrush,
	#instVars : [
		'name'
	],
	#category : 'Pillar-ExporterLaTeX'
}

{ #category : #accessing }
PRLaTeXEnvironment >> name: aString [
	name := aString.
	stream newLine.
	stream << '\begin{' << aString << '}'
]

{ #category : #accessing }
PRLaTeXEnvironment >> with: aBlock [
	stream newLine.
	aBlock value.
	(stream << '\end{' << name)
		<< '}';
		newLine
]
