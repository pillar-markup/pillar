"
A PRRawTest is xxxxxxxxx.

"
Class {
	#name : #PRScriptTest,
	#superclass : #PRTextTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRScriptTest >> actualClass [
	^ PRCodeblock
]

{ #category : #tests }
PRScriptTest >> testEqualScript [
	self assert: (self actualClass content: 'foo')  ~= (self actualClass content: 'bar').
	self assert: (self actualClass content: 'foo') equals: (self actualClass content: 'foo')
]

{ #category : #tests }
PRScriptTest >> testEqualScriptWithLanguage [
	| param1 param2 |
	param1 := SmallDictionary new
		at: 'language' put: 'smalltalk';
		yourself.
	param2 := SmallDictionary new
		at: 'language' put: 'html';
		yourself.
	self
		assert: (self actualClass content: 'foo' parameters: param1) ~= (self actualClass content: 'foo' parameters: param2).
	self
		assert:
			(self actualClass content: 'foo' parameters: param1)
				equals: (self actualClass content: 'foo' parameters: param1)
]

{ #category : #'tests-comparing' }
PRScriptTest >> testHash [
	| a b |
	a := self actualClass content: 'foo'.
	b := self actualClass content: 'foo'.
	self assert: a hash equals: a copy hash.
	self assert: a hash equals: b hash
]

{ #category : #tests }
PRScriptTest >> testIsStructure [
	| ston nLine script |
	self flag: #toRemove. "we do not support structure anymore dow e?"
	nLine := Smalltalk os lineEnding.
	ston := '[[[structure=Test' , nLine , 'Foo' , nLine , ']]]'.
	script := (self parser parse: ston) children first.
	self assert: script isStructure
]

{ #category : #tests }
PRScriptTest >> testStructureName [
	| ston nLine script |
	self flag: #toRemove. "we do not support structure anymore dow e?"
	nLine := Smalltalk os lineEnding.
	ston := '[[[structure=Test' , nLine , 'Foo' , nLine , ']]]'.
	script := (self parser parse: ston) children first.
	self assert: script structureName equals: 'Test'
]
