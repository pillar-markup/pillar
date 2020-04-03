Class {
	#name : #GTPillarCodeHighlightingCommand,
	#superclass : #GTHighlightingCommand,
	#instVars : [
		'properties',
		'string'
	],
	#category : #'Pillar-Pharo-Tools-Editor'
}

{ #category : #execute }
GTPillarCodeHighlightingCommand >> executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference [
	| styler styledText |
	self isSmalltalk
		ifTrue: [ 
			styler := SHRBTextStyler new.
			styler classOrMetaClass: nil.
			styledText := styler styledTextFor: (aText copyFrom: self start to: self stop).
			aText replaceFrom: self start to: self stop with: styledText ]
		ifFalse: [ 
			aText 
				addAttribute: TextColor black
				from: self start 
				to: self stop ].
	aText 
		addAttribute: (TextFontReference toFont: StandardFonts codeFont)
		from: self start
		to: self stop.
]

{ #category : #accessing }
GTPillarCodeHighlightingCommand >> isSmalltalk [ 
	^ self language = 'smalltalk'
]

{ #category : #accessing }
GTPillarCodeHighlightingCommand >> language [
	^ self properties 
		detect: [ :each | each key asLowercase = 'language' ]
		ifFound: [ :languagePair | languagePair value asLowercase ]
		ifNone: [ 'smalltalk' ]
]

{ #category : #accessing }
GTPillarCodeHighlightingCommand >> properties [
	^ properties
]

{ #category : #accessing }
GTPillarCodeHighlightingCommand >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
GTPillarCodeHighlightingCommand >> string [
	^ string
]

{ #category : #accessing }
GTPillarCodeHighlightingCommand >> string: anObject [
	string := anObject
]
