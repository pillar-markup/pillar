"
This parser specializes the basic Pillar grammar for producing highlighting commands that are later used by the Rubric text editor.
"
Class {
	#name : #GTPillarHighlighter,
	#superclass : #PRPillarParser,
	#instVars : [
		'commands'
	],
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #accessing }
GTPillarHighlighter class >> ignoredNames [
	^ super ignoredNames, #(commands)
]

{ #category : #accessing }
GTPillarHighlighter >> annotatedParagraph [
	^ super annotatedParagraph
	==> [ :aNode | 
		self commands add: (GTNoteHighlightingCommand new 
			start: aNode start;
			stop: aNode stop) ]
]

{ #category : #accessing }
GTPillarHighlighter >> commands [ 
	^ commands ifNil: [ commands := OrderedCollection new ]
]

{ #category : #accessing }
GTPillarHighlighter >> figure [
	^ super figure 
	==> [ :aNode | 
		self commands add: (
			GTPillarFileHighlightingCommand new 
				start: aNode start;
				stop: aNode stop;
				fileName: aNode reference) ]
]

{ #category : #accessing }
GTPillarHighlighter >> header [
	^ super header
	==> [ :aNode | 
		self commands add: (GTHeadingHighlightingCommand new 
				start: aNode start;
				stop: aNode stop) ]
]

{ #category : #accessing }
GTPillarHighlighter >> monospaceFormat [
	^ super monospaceFormat 
	==> [ :aNode | 
		self commands add: (GTMonospaceFormatHighlightingCommand new 
			start: aNode start;
			stop: aNode stop)]
]

{ #category : #accessing }
GTPillarHighlighter >> script [
	^ super script ==> [ :aNode | 
			self commands add: (GTPillarCodeHighlightingCommand new
				start: aNode start;
				stop: aNode stop; 
				properties: aNode parameters;
				string: aNode text) ]
]
