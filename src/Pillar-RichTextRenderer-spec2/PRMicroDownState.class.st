Class {
	#name : #PRMicroDownState,
	#superclass : #PRSyntaxState,
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #accessing }
PRMicroDownState >> exampleText [
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
PRMicroDownState >> extension [
	^ 'microdown'
]

{ #category : #accessing }
PRMicroDownState >> name [
	^ 'MicroDown'
]

{ #category : #accessing }
PRMicroDownState >> next [
	^ PRPillarState new
]

{ #category : #parsing }
PRMicroDownState >> parse: aText [
	^ (super parse: aText asString) asPillar
]

{ #category : #accessing }
PRMicroDownState >> parser [
	^ MicroDownParser 
]

{ #category : #accessing }
PRMicroDownState >> writer [
	^ PRMicrodownWriter
]
