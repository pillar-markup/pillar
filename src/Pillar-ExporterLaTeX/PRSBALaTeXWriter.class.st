"
Writes LaTeX code in the style expected by sbabook (https://github.com/cdlm/sbabook). sbabook is a special LaTeX book class for our technical books.
"
Class {
	#name : #PRSBALaTeXWriter,
	#superclass : #PRLaTeXWriter,
	#category : #'Pillar-ExporterLaTeX'
}

{ #category : #accessing }
PRSBALaTeXWriter class >> writerName [
	^ #latex:sbabook
]

{ #category : #protected }
PRSBALaTeXWriter >> monospaceMacro [
	^ 'textcode'
]

{ #category : #protected }
PRSBALaTeXWriter >> optionalParametersForFloatingScript: aScript [ 
	| parameters |
	parameters := OrderedCollection new.
	parameters add: 'float'.
	aScript hasLabel ifTrue: [ parameters add: 'label=', aScript label ].
	aScript hasShortCaption ifTrue: [ parameters add: 'list text={', aScript shortCaption, '}' ].
	^ parameters asCommaString
]

{ #category : #'visiting-document' }
PRSBALaTeXWriter >> tabularEnvironment [
	^ 'fullwidthtabular'
]

{ #category : #'visiting-document' }
PRSBALaTeXWriter >> visitCodeblock: aCodeBlock [
	aCodeBlock hasCaption | aCodeBlock hasLabel
		ifTrue: [ self visitFloatingScript: aCodeBlock ]
		ifFalse: [ self visitInFlowScript: aCodeBlock ]
]

{ #category : #'visiting-document' }
PRSBALaTeXWriter >> visitFloatingScript: aScript [ 
	canvas environment
		name: 'listing';
		optParameter: (self optionalParametersForFloatingScript: aScript);
		parameter: (self languageForScript: aScript) sbaString;
		parameter: [ self visitAll: aScript caption children ];
		with: [
			self writeRawDuring: [ self visitText: aScript ].
			canvas newLine ]
]

{ #category : #'visiting-document' }
PRSBALaTeXWriter >> visitInFlowScript: aScript [ 
	canvas environment
		name: 'displaycode';
		parameter: (self languageForScript: aScript) sbaString;
		with: [
			self writeRawDuring: [ self visitText: aScript ].
			canvas newLine ]
]
