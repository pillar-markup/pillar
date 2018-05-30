Class {
	#name : #PRScriptLineNumberTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRScriptLineNumberTest >> actualClass [
	^ PRScriptLineNumber 
]

{ #category : #tests }
PRScriptLineNumberTest >> testScriptWithLineNumber [
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						lineNumber: true;
						eval: false;
						yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: '1	stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						lineNumber: true;
						eval: false;
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRScriptLineNumberTest >> testScriptWithLineNumberFalse [
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						lineNumber: false;
						eval: false;
						yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						lineNumber: false;
						eval: false;
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRScriptLineNumberTest >> testScriptWithSeveralLineNumbers [
	
	| input expected |
	self skip.
	input := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''
 world
 !')
						lineNumber: true;
						eval: false;
						yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: '1	stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''
2	world
3 	!')
						lineNumber: true;
						eval: false;
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) children first text  equals: expected children first text 
]

{ #category : #tests }
PRScriptLineNumberTest >> testScriptWithoutParameter [
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]
