Class {
	#name : #PRRemoveHideableScriptsTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #'as yet unclassified' }
PRRemoveHideableScriptsTest >> actualClass [
	^ PRRemoveHideableScripts 
]

{ #category : #tests }
PRRemoveHideableScriptsTest >> testScriptWhenHideable [
	| input expected |
	input := PRDocument new 
		add: ((PRCodeblock content: 'Object') 
					hideable: true;
					yourself);
				yourself.
	expected := PRDocument new.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRRemoveHideableScriptsTest >> testScriptWhenNotHideable [
	| input |
	input := PRDocument new 
		add: ((PRCodeblock content: 'Object') 
					hideable: false;
					yourself);
				yourself.
	self assert: (self executePhase: input with: self configuration) equals: input
]

{ #category : #tests }
PRRemoveHideableScriptsTest >> testScriptWithoutHideableParameter [
	| input |
	input := PRDocument new 
		add: ((PRCodeblock content: 'Object') 
					yourself);
				yourself.
	self assert: (self executePhase: input with: self configuration) equals: input
]
