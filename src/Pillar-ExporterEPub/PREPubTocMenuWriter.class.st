"
I write a document as a ToC menu for ePub table of content.
"
Class {
	#name : #PREPubTocMenuWriter,
	#superclass : #PREPubMenuWriter,
	#instVars : [
		'counter'
	],
	#category : 'Pillar-ExporterEPub'
}

{ #category : #accessing }
PREPubTocMenuWriter class >> fileExtension [
	^'toc.ncx'
]

{ #category : #accessing }
PREPubTocMenuWriter class >> writerName [
	^ #tocmenu
]

{ #category : #initialization }
PREPubTocMenuWriter >> initialize [
	counter := 0.
	super initialize.
]

{ #category : #'visiting-document' }
PREPubTocMenuWriter >> visitHeader: aHeader [
	canvas tag
		name: 'navLabel';
		with: [ canvas tag
				name: 'text';
				with: [ self visitDocumentGroup: aHeader ] ].
	canvas emptyTag
		name: 'content';
		parameterAt: 'src' put: (self refFor: aHeader);
		closeTag
]

{ #category : #'visiting-document' }
PREPubTocMenuWriter >> visitSection: aSection [
			counter := counter + 1.
			canvas tag
				name: 'navPoint';
				parameterAt: 'playOrder' put: counter;
				with: [ super visitDocumentGroup: aSection ]
]
