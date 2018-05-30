Class {
	#name : #PRScriptFromFileTest,
	#superclass : #PRNodeTransformerTest,
	#instVars : [
		'baseDirectory'
	],
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #helpers }
PRScriptFromFileTest >> aCode [
	| code |
	code := String new writeStream.
	code
		nextPutAll: self headingCode;
		nextPutAll: self middleCode;
		nextPutAll: self endingCode.
	^ code contents
]

{ #category : #private }
PRScriptFromFileTest >> actualClass [
	^ PRScriptFromFile
]

{ #category : #'as yet unclassified' }
PRScriptFromFileTest >> baseDirectory [
	^ baseDirectory
]

{ #category : #'as yet unclassified' }
PRScriptFromFileTest >> configuration [
	^ super configuration
		baseDirectory: baseDirectory;
		newLine: Smalltalk os lineEnding;
		yourself.
]

{ #category : #actions }
PRScriptFromFileTest >> createFile: aName With: text In: aDirectory [
	| stream |
	stream := (aDirectory / aName) writeStream.
	stream nextPutAll: text.
	stream close
]

{ #category : #helpers }
PRScriptFromFileTest >> endingCode [
	| code |
	code := String new writeStream.
	code nextPutAll: Smalltalk os lineEnding.
	code nextPut: Character tab.
	^ code contents
]

{ #category : #helpers }
PRScriptFromFileTest >> firstLine [
	^ 5
]

{ #category : #helpers }
PRScriptFromFileTest >> headingCode [
	| code |
	code := String new writeStream.
	self firstLine timesRepeat: [ code nextPutAll: Smalltalk os lineEnding ].
	^ code contents
]

{ #category : #helpers }
PRScriptFromFileTest >> middleCode [
	| code |
	code := String new writeStream.
	code
		nextPutAll: '|test|';
		nextPutAll: Smalltalk os lineEnding;
		nextPutAll: 'test := 1.';
		nextPutAll: Smalltalk os lineEnding;
		nextPutAll: 'test := 1+1'.
	^ code contents
]

{ #category : #running }
PRScriptFromFileTest >> setUp [
	super setUp.
	baseDirectory := FileSystem memory root.
	self
		createFile: 'code.st'
		With: self aCode
		In: baseDirectory
]

{ #category : #tests }
PRScriptFromFileTest >> testCanGetFileInsideAnOtherDirectory [
	| input expected |
	(baseDirectory / 'foo') ensureCreateDirectory.
	self createFile: 'code.st' With: self aCode In: baseDirectory / 'foo'.
	input := PRDocument new
		add: ((PRCodeblock content: '') fromFile: 'foo/code.st' yourself);
		yourself.
	expected := PRDocument new
		add:
			((PRCodeblock content: self aCode)
				fromFile: 'foo/code.st';
				yourself);
		yourself.
	self
		assert: (self executePhase: input with: self configuration)
		equals: expected
]

{ #category : #tests }
PRScriptFromFileTest >> testFirstAndLastLineDefine [
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						firstLine: self firstLine +1;
						lastLine: self firstLine + 3 yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: self middleCode)
						fromFile: 'code.st';
						firstLine: self firstLine +1;
						lastLine: self firstLine + 3 yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRScriptFromFileTest >> testFirstLineDefine [
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						firstLine: self firstLine + 1 yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: self middleCode , self endingCode)
						fromFile: 'code.st';
						firstLine: self firstLine + 1 yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRScriptFromFileTest >> testFirstLineOutOfBounds [
	| input |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						firstLine: 500 yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError
]

{ #category : #tests }
PRScriptFromFileTest >> testHasFileFrom [
	| input expected |
	input := PRDocument new
		add: ((PRCodeblock content: '') fromFile: 'code.st' yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: self aCode)
						fromFile: 'code.st';
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRScriptFromFileTest >> testHasWrongFileFrom [
	| input |
	input := PRDocument new
		add: ((PRCodeblock content: '') fromFile: 'wrong.st' yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRInputFileError 
]

{ #category : #tests }
PRScriptFromFileTest >> testLastLineDefine [
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						lastLine: self firstLine + 3 yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: self headingCode , self middleCode)
						fromFile: 'code.st';
						lastLine: self firstLine + 3 yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRScriptFromFileTest >> testLastLineLowestThanFirstLine [
	| input |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						firstLine: 5;
						lastLine: 0 yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError
]

{ #category : #tests }
PRScriptFromFileTest >> testLastLineOutOfBounds [
	| input |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						lastLine: 500 yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError
]

{ #category : #tests }
PRScriptFromFileTest >> testWarningWhenScriptNotEmpty [
	| input  |
	input := PRDocument new
		add: ((PRCodeblock content: 'foo') fromFile: 'code.st' yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRWarning
]

{ #category : #tests }
PRScriptFromFileTest >> testtestFirstLineIsNotANumber [
	| input |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						firstLine: 'foo' yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError
]
