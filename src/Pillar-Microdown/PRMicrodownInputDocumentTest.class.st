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
		equals: MicRootBlock

]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParsedDocument2 [
	
	| doc |
	doc := (PRInputDocument forFile: memoryFileSystem / 'input1.mic') parsedDocument.
	self 
		assert: doc class
		equals: MicRootBlock

]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParserClass [
	
	| input |
	input := (PRInputDocument inputClassForFile: memoryFileSystem / 'input1.mic') new.
	self 
		assert: input parserClass 
		equals: MicrodownParser

]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testParserClass2 [
	
	| input |
	input := PRInputDocument forFile: memoryFileSystem / 'input1.mic'.
	self 
		assert: input parserClass 
		equals: MicrodownParser

]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testRegistration [
	
	| inputClass |
	inputClass := (PRInputDocument inputClassForFile: memoryFileSystem / 'input1.mic').
	self 
		assert: inputClass 
		equals: MicMicrodownInputDocument

]

{ #category : #tests }
PRMicrodownInputDocumentTest >> testRegistration2 [
	
	| inputClass |
	inputClass := (PRInputDocument forFile: memoryFileSystem / 'input1.mic') class.
	self 
		assert: inputClass 
		equals: MicMicrodownInputDocument

]
