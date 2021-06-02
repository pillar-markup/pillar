Class {
	#name : #PRMicrodownInputDocumentTest,
	#superclass : #PRInputDocumentTest,
	#category : #'Pillar-Microdown'
}

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParsedDocument [
	
	| doc |
	doc := ((PRInputDocument inputClassForFile: memoryFileSystem / 'input1.mic') new 
					file:  memoryFileSystem / 'input1.mic') parsedDocument.
	self 
		assert: doc class
		equals: PRDocument

]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParserClass [
	
	| input |
	input := (PRInputDocument inputClassForFile: memoryFileSystem / 'input1.mic') new.
	self 
		assert: input parserClass 
		equals: MicroDownParser

]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testRegistration [
	
	| inputClass |
	inputClass := (PRInputDocument inputClassForFile: memoryFileSystem / 'input1.mic').
	self 
		assert: inputClass 
		equals: PRMicrodownInputDocument

]
