"
I am a state pattern to switch syntax between **MicroDown** and **Pillar** for now. We can think of adding GitHub Markdown.
"
Class {
	#name : #PRSyntaxState,
	#superclass : #Object,
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #accessing }
PRSyntaxState >> exampleText [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PRSyntaxState >> label [
	^ 'Change to ', self next new name, ' syntax'.
]

{ #category : #accessing }
PRSyntaxState >> name [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PRSyntaxState >> next [
	^ self subclassResponsibility 
]

{ #category : #parsing }
PRSyntaxState >> parse: aText [
	^ self parser new parse: aText asString
]

{ #category : #accessing }
PRSyntaxState >> parser [
	^ self subclassResponsibility 
]

{ #category : #writing }
PRSyntaxState >> write: aStringOrStream [
	| parsedAsPillar writtenText|
	parsedAsPillar := self parse: aStringOrStream.
	writtenText := self next writer new start: parsedAsPillar; contents.
	^ writtenText
]

{ #category : #accessing }
PRSyntaxState >> writer [
	^ self subclassResponsibility 
]
