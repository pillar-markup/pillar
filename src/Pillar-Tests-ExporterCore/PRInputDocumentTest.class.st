Class {
	#name : #PRInputDocumentTest,
	#superclass : #PRTestWithMemoryFileSystem,
	#category : #'Pillar-Tests-ExporterCore-Base'
}

{ #category : #tests }
PRInputDocumentTest >> testBasic [
	
	| input |
	input := (PRPillarInputDocument new file: memoryFileSystem / 'input1.pillar').
	self 
		assert:  input parserClass 
		equals: PRDocument parser.
	self 
		assert:  input basename 
		equals: 'input1.pillar'.

]

{ #category : #tests }
PRInputDocumentTest >> testBasicNoInput [
	
	| input |
	input := (PRNoInputDocument new file: memoryFileSystem / 'input1.pillar').
	self should: [ input parserClass ] raise: Error. 
	
]

{ #category : #tests }
PRInputDocumentTest >> testBasicPillarInputDocument [
	
	| input |
	input := (PRPillarInputDocument new file: memoryFileSystem / 'input1.pillar').
	self 
		assert:  input parserClass 
		equals: PRDocument parser.
	self 
		assert:  input basename 
		equals: 'input1.pillar'.

]

{ #category : #tests }
PRInputDocumentTest >> testParsedDocument [
	
	| doc |
	doc := ((PRInputDocument inputClassForFile: memoryFileSystem / 'input1.pillar') new 
					file:  memoryFileSystem / 'input1.pillar') parsedDocument.
	self 
		assert: doc class
		equals: PRDocument


]

{ #category : #tests }
PRInputDocumentTest >> testParsedDocument2 [
	
	| doc |
	doc := (PRInputDocument forFile: memoryFileSystem / 'input1.pillar') parsedDocument.
	self 
		assert: doc class
		equals: PRDocument


]

{ #category : #tests }
PRInputDocumentTest >> testRegistration [
	
	| inputClass |
	inputClass := (PRInputDocument inputClassForFile: memoryFileSystem / 'input1.pillar').
	self 
		assert: inputClass 
		equals: PRPillarInputDocument

]

{ #category : #tests }
PRInputDocumentTest >> testRegistrationNoCandidate [
	
	| inputClass |
	inputClass := (PRInputDocument inputClassForFile: memoryFileSystem / 'input1.Zork').
	self 
		assert: inputClass 
		equals: PRNoInputDocument

]

{ #category : #tests }
PRInputDocumentTest >> testRegistrationNoCandidate2 [
	
	| inputClass |
	inputClass := (PRInputDocument forFile: memoryFileSystem / 'input1.Zork') class.
	self 
		assert: inputClass 
		equals: PRNoInputDocument

]
