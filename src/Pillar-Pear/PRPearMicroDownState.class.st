Class {
	#name : #PRPearMicroDownState,
	#superclass : #PRPearSyntaxState,
	#category : #'Pillar-Pear'
}

{ #category : #accessing }
PRPearMicroDownState >> exampleText [
	^ '# Heading one 

##Heading Twoo 

**this is bold**

This is not bold 

This is a list
- item 1 **this is bold again my friend**
- item 2

This is an ordered collection
1. one
2. two 

The following code shows the definition of the method `printOn:`

``` 
Point class >> new
	self foo	
``` 

```language=smalltalk 
1 + 2 
```

# Heading one 

'
]

{ #category : #accessing }
PRPearMicroDownState >> extension [
	^ 'microdown'
]

{ #category : #accessing }
PRPearMicroDownState >> name [
	^ 'MicroDown'
]

{ #category : #accessing }
PRPearMicroDownState >> next [
	^ PRPearPillarState new
]

{ #category : #parsing }
PRPearMicroDownState >> parse: aText [
	^ (super parse: aText asString) asPillar
]

{ #category : #accessing }
PRPearMicroDownState >> parser [
	^ MicroDownParser 
]

{ #category : #accessing }
PRPearMicroDownState >> writer [
	^ PRMicrodownWriter
]
