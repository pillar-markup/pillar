"
!!! Purpose
I am a class to manage code styling for different programming languages and formats.

I am able to style ==smalltalk== code, and provides a plugin architecture for other formats.


!!!! Plugin
To define a new styler for a different language or format you should do the following

- The name of the language to use for formatting is specified ==[[[language=Foolang==, or ==[[[Foolang==. 
- A styler should implement a class method which takes a ==String== argument, and returns a formatted/styled ==Text==.
- That class method should have a pragma of the format ==<codeblockStylerFor:Foolang>==. See the example in this class for Smalltalk

					

"
Class {
	#name : #PRRichTextCodeblokStyler,
	#superclass : #Object,
	#category : #'Pillar-ExporterRichText'
}

{ #category : #'as yet unclassified' }
PRRichTextCodeblokStyler class >> defaultStyler: aString [
	<codeblockStylerFor:'default'>
	
	"By default, render it as smalltalk code"
	^self smalltalkStylerFor: aString
]

{ #category : #'as yet unclassified' }
PRRichTextCodeblokStyler class >> languageStylerFor: aLanguage [
	| stylers |
	stylers := Dictionary
		newFromAssociations: ((PragmaCollector
						filter: [ :prg | prg selector = 'codeblockStylerFor:' ]) reset
						collected collect: [ :p | p arguments first -> p method ]).
	^ stylers
		at: aLanguage
		ifAbsent: [ self languageStylerFor: 'default' ]
]

{ #category : #'as yet unclassified' }
PRRichTextCodeblokStyler class >> smalltalkStylerFor: aString [
	<codeblockStylerFor:'Smalltalk'>
	
	^SHRBTextStyler new 
		isForWorkspace: true; 
		styledTextFor: aString asText
]

{ #category : #'as yet unclassified' }
PRRichTextCodeblokStyler class >> style: aString asLanguage: aLanguage [
	"render aString according to the styler named aLanguage"
	|styler|
	styler := self languageStylerFor: aLanguage.
	^ styler
		valueWithReceiver: styler methodClass soleInstance 
		arguments:  (Array with: aString)
]

{ #category : #'as yet unclassified' }
PRRichTextCodeblokStyler class >> textStyler: aString [
	<codeblockStylerFor:'text'>
	
	^aString asText
]
