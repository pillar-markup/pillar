Class {
	#name : #PRMicrodownInputDocumentTest,
	#superclass : #PRInputDocumentTest,
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParsedDocument [

	| doc |
	doc := ((PRInputDocument inputClassForFile: memoryFileSystem / 'input1.md') new file: memoryFileSystem / 'input1.md') parsedDocument.
	self assert: doc class equals: MicRootBlock
]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParsedDocument2 [

	| doc |
	doc := (PRInputDocument forFile: memoryFileSystem / 'input1.md') parsedDocument.
	self assert: doc class equals: MicRootBlock
]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParserClass [

	| input |
	input := (PRInputDocument inputClassForFile: memoryFileSystem / 'input1.md') new.
	self assert: input parserClass equals: MicrodownParser
]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParserClass2 [

	| input |
	input := PRInputDocument forFile: memoryFileSystem / 'input1.md'.
	self assert: input parserClass equals: MicrodownParser
]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testRegistration [

	| inputClass |
	inputClass := PRInputDocument inputClassForFile: memoryFileSystem / 'input1.md'.
	self assert: inputClass equals: MicMicrodownInputDocument
]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testRegistration2 [

	| inputClass |
	inputClass := (PRInputDocument forFile: memoryFileSystem / 'input1.md') class.
	self assert: inputClass equals: MicMicrodownInputDocument
]
