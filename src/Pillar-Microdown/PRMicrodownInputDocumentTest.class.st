Class {
	#name : #PRMicrodownInputDocumentTest,
	#superclass : #PRInputDocumentTest,
	#category : #'Pillar-Microdown'
}

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
