"
An HTML canvas that facilitates writing HTML to a stream. The main method is #tag that allow you to write something like this:

canvas tag
        name: 'a';
        parameterAt: 'href' put: href;
        with: [ ""some code that generates the HTML inside the link"" ]
"
Class {
	#name : #PRHTMLCanvas,
	#superclass : #PRExportCanvas,
	#classVars : [
		'HTMLCharacters'
	],
	#category : 'Pillar-ExporterHTML'
}

{ #category : #'class initialization' }
PRHTMLCanvas class >> initialize [
	HTMLCharacters := Dictionary new.
	HTMLCharacters
		at: $" put: '&quot;';
		at: $& put: '&amp;';
		at: $< put: '&lt;';
		at: $> put: '&gt;'
]

{ #category : #tags }
PRHTMLCanvas >> emptyTag [
	^ self brush: PRHTMLEmptyTag new
]

{ #category : #'writing text' }
PRHTMLCanvas >> nextPut: aCharacter [
	| string |
	string := HTMLCharacters at: aCharacter ifAbsent: nil.
	string isNil
		ifTrue: [ super nextPut: aCharacter ]
		ifFalse: [ self raw: string ]
]

{ #category : #tags }
PRHTMLCanvas >> tag [
	^ self brush: PRHTMLTag new
]
