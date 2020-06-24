Class {
	#name : #PRPillarState,
	#superclass : #PRSyntaxState,
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #accessing }
PRPillarState >> exampleText [
	^ '! Heading one 

!!Heading Twoo 

""this is bold"" 

This is not bold 

This is a list
- item 1 ""this is bold again my friend""
- item 2

This is an ordered collection
# one
# two 

The following code shows the definition of the method ==printOn:==

[[[  
Point class >> new
	self foo	
]]] 

[[[language=smalltalk 
1 + 2 
]]]

! Heading one 

'
]

{ #category : #accessing }
PRPillarState >> extension [
	^ 'pillar'
]

{ #category : #accessing }
PRPillarState >> name [
	^ 'Pillar'
]

{ #category : #accessing }
PRPillarState >> next [
	^ PRMicroDownState new
]

{ #category : #accessing }
PRPillarState >> parser [
	^ PRPillarParser
]

{ #category : #accessing }
PRPillarState >> writer [
	^ PRPillarWriter
]
